import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class FirebaseService {
  // Firebase instances
  static FirebaseAuth? _auth;
  static FirebaseFirestore? _firestore;
  static FirebaseStorage? _storage;
  static bool _initialized = false;

  // Initialize Firebase services
  static Future<void> initialize() async {
    if (_initialized) return;

    try {
      // Check if Firebase is already initialized
      if (Firebase.apps.isEmpty) {
        throw Exception('Firebase not initialized. Call Firebase.initializeApp() first.');
      }

      _auth = FirebaseAuth.instance;
      _firestore = FirebaseFirestore.instance;
      _storage = FirebaseStorage.instance;

      // Don't enable persistence on desktop platforms
      if (!kIsWeb && !_isDesktop()) {
        try {
          await _firestore!.enablePersistence();
        } catch (e) {
          print('Persistence failed: $e');
        }
      }

      _initialized = true;
      print('Firebase services initialized successfully');
    } catch (e) {
      print('Error initializing Firebase services: $e');
      // Don't rethrow on desktop platforms
      if (!_isDesktop()) {
        rethrow;
      }
    }
  }

  // Check if running on desktop platform
  static bool _isDesktop() {
    return defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.windows;
  }

  // Auth (with fallback)
  static FirebaseAuth get auth {
    if (!_initialized || _auth == null) {
      throw Exception('Firebase not initialized');
    }
    return _auth!;
  }

  static User? get currentUser {
    try {
      return auth.currentUser;
    } catch (e) {
      return null;
    }
  }

  // Firestore (with fallback)
  static FirebaseFirestore get firestore {
    if (!_initialized || _firestore == null) {
      throw Exception('Firebase not initialized');
    }
    return _firestore!;
  }

  // Collections (with graceful error handling)
  static CollectionReference get doctorsCollection {
    try {
      return firestore.collection('doctors');
    } catch (e) {
      throw Exception('Firebase not initialized');
    }
  }

  static CollectionReference get appointmentsCollection {
    try {
      return firestore.collection('appointments');
    } catch (e) {
      throw Exception('Firebase not initialized');
    }
  }

  static CollectionReference get reviewsCollection {
    try {
      return firestore.collection('reviews');
    } catch (e) {
      throw Exception('Firebase not initialized');
    }
  }

  static CollectionReference get specialtiesCollection {
    try {
      return firestore.collection('specialties');
    } catch (e) {
      throw Exception('Firebase not initialized');
    }
  }

  static CollectionReference get usersCollection {
    try {
      return firestore.collection('users');
    } catch (e) {
      throw Exception('Firebase not initialized');
    }
  }

  // Storage
  static FirebaseStorage get storage {
    if (!_initialized || _storage == null) {
      throw Exception('Firebase not initialized');
    }
    return _storage!;
  }

  // Helper method to check if Firebase is ready
  static bool get isInitialized => _initialized;
}