import 'package:flutter/foundation.dart';
import '../models/country_model.dart';
import '../services/country_service.dart';

class CountryController extends ChangeNotifier {
  final CountryService _countryService = CountryService();
  List<Country> _countries = [];
  bool _isLoading = false;
  String _error = '';

  List<Country> get countries => _countries;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchCountries() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _countries = await _countryService.getCountriesStartingWithA();
      _error = '';
    } catch (e) {
      _error = e.toString();
      _countries = [];
    }

    _isLoading = false;
    notifyListeners();
  }
} 