import 'package:flutter/material.dart';

class HomeRepository extends ChangeNotifier {
  bool _isShowNavBar = true;
  bool get isShowNavBar => _isShowNavBar;

  void changeVisibleNavBar({bool? visible}) {
    if (visible != null) {
      _isShowNavBar = visible;
    } else {
      _isShowNavBar = !_isShowNavBar;
    }
    notifyListeners();
  }
}
