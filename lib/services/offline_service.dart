// lib/services/offline_service.dart
import 'package:doctor_finder_flutter/models/doctor_model.dart';
import 'package:doctor_finder_flutter/models/specialty_model.dart';

class OfflineService {
  static List<DoctorModel> getMockDoctors() {
    return [
      DoctorModel(
        id: '1',
        name: 'Dr. Sarah Johnson',
        specialty: 'General Practitioner',
        phone: '+267 1234 5678',
        city: 'Gaborone',
        address: '123 Main Street',
        rating: 4.5,
        reviewCount: 24,
        acceptsInsurance: true,
        location: GeoPoint(latitude: -24.6544, longitude: 25.9084),
        experience: 10,
        languages: 'English, Setswana',
        openingHours: 'Mon-Fri: 8:00 AM - 5:00 PM',
        about: 'Dr. Sarah Johnson is a dedicated general practitioner with over 10 years of experience.',
      ),
      DoctorModel(
        id: '2',
        name: 'Dr. Michael Smith',
        specialty: 'Cardiologist',
        phone: '+267 2345 6789',
        city: 'Gaborone',
        address: '456 Hospital Road',
        rating: 4.8,
        reviewCount: 42,
        acceptsInsurance: true,
        location: GeoPoint(latitude: -24.6582, longitude: 25.9120),
        experience: 15,
        languages: 'English, Setswana',
        openingHours: 'Mon-Thu: 8:00 AM - 6:00 PM, Fri: 8:00 AM - 3:00 PM',
        about: 'Dr. Michael Smith specializes in cardiac care and has been practicing for 15 years.',
      ),
      DoctorModel(
        id: '3',
        name: 'Dr. Linda Johnson',
        specialty: 'Pediatrician',
        phone: '+267 3456 7890',
        city: 'Francistown',
        address: '789 Child Care Ave',
        rating: 4.6,
        reviewCount: 35,
        acceptsInsurance: false,
        location: GeoPoint(latitude: -21.1692, longitude: 27.5110),
        experience: 8,
        languages: 'English',
        openingHours: 'Mon-Fri: 9:00 AM - 5:00 PM',
        about: 'Dr. Linda Johnson provides comprehensive pediatric care for children of all ages.',
      ),
      DoctorModel(
        id: '4',
        name: 'Dr. James Wilson',
        specialty: 'Dentist',
        phone: '+267 4567 8901',
        city: 'Maun',
        address: '321 Dental Street',
        rating: 4.3,
        reviewCount: 18,
        acceptsInsurance: true,
        location: GeoPoint(latitude: -19.9949, longitude: 23.4169),
        experience: 6,
        languages: 'English, Setswana',
        openingHours: 'Mon-Fri: 8:00 AM - 5:00 PM',
        about: 'Dr. James Wilson offers a full range of dental services from routine cleanings to complex procedures.',
      ),
    ];
  }

  static List<SpecialtyModel> getMockSpecialties() {
    return [
      SpecialtyModel(
        id: '1',
        name: 'General Practitioner',
        description: 'Primary healthcare provider for general medical conditions',
      ),
      SpecialtyModel(
        id: '2',
        name: 'Cardiologist',
        description: 'Specialist in heart and cardiovascular conditions',
      ),
      SpecialtyModel(
        id: '3',
        name: 'Pediatrician',
        description: 'Specialist in child healthcare',
      ),
      SpecialtyModel(
        id: '4',
        name: 'Dentist',
        description: 'Specialist in oral health and dental care',
      ),
      SpecialtyModel(
        id: '5',
        name: 'Orthopedic',
        description: 'Specialist in musculoskeletal system, bones, and joints',
      ),
      SpecialtyModel(
        id: '6',
        name: 'Psychiatrist',
        description: 'Specialist in mental health and psychiatric disorders',
      ),
    ];
  }
}