import 'package:flutter/material.dart';

class HomeRepository extends ChangeNotifier {
  bool _isShowNavBar = true;
  bool get isShowNavBar => _isShowNavBar;

  void changeVisibleNavBar(bool value) {
    _isShowNavBar = value;
    notifyListeners();
  }
}
