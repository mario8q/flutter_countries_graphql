import 'package:flutter/foundation.dart';
import '../models/country_model.dart';
import '../services/country_service.dart';

class CountryController extends ChangeNotifier {
  final CountryService _countryService = CountryService();
  List<Country> _countries = [];
  bool _isLoading = false;
  String _error = '';
  bool _hasError = false;

  List<Country> get countries => _countries;
  bool get isLoading => _isLoading;
  String get error => _error;
  bool get hasError => _hasError;

  Future<void> fetchCountries() async {
    if (_isLoading) return; // Evitar múltiples llamadas simultáneas

    _isLoading = true;
    _error = '';
    _hasError = false;
    notifyListeners();

    try {
      _countries = await _countryService.getCountriesStartingWithA();
      _error = '';
      _hasError = false;
    } catch (e) {
      _error = 'Error al cargar los países: ${e.toString()}';
      _hasError = true;
      _countries = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void retry() {
    fetchCountries();
  }
}
