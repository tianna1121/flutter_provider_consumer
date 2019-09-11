import 'package:flutter/foundation.dart';

class WeatureInfo with ChangeNotifier {
  String _tempType = "ceicius";
  int _temperatureVal = 25;

  String get temperatureType => _tempType;
  int get temperatureVal => _temperatureVal;

  set temperatureType(String newType) {
    _tempType = newType;
    notifyListeners();
  }

  set temperatureVal(int newTemp) {
    _temperatureVal = newTemp;
    notifyListeners();
  }
}
