import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination _destination = CruiseDestination(
    title: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description:
    'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. '
        'Cruise past historic temples, timber hubs, and waterfront settlements while '
        'experiencing authentic Sarawakian hospitality.',
    imageUrl: 'assets/cruise.jpg',
  );

  CruiseDestination get destination => _destination;

  // State Variables
  int _starCount = 43;
  bool _isStarred = false;
  DateTime _selectedDate = DateTime.now();
  String _selectedPackage = 'Private River Cruise';
  bool _isDarkMode = false;

  final List<String> _packages = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  // Getters
  int get starCount => _starCount;
  bool get isStarred => _isStarred;
  DateTime get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  List<String> get packages => _packages;
  bool get isDarkMode => _isDarkMode;

  // Actions / Business Logic
  void toggleStar() {
    if (_isStarred) {
      _starCount--;
      _isStarred = false;
    } else {
      _starCount++;
      _isStarred = true;
    }
    notifyListeners();
  }

  void updateDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  void updatePackage(String? newPackage) {
    if (newPackage != null) {
      _selectedPackage = newPackage;
      notifyListeners();
    }
  }

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}