import 'package:flutter/material.dart';
import 'package:flutter_music/service/request.dart';

class PersonalizedProvide with ChangeNotifier {

  getPersonalizedInfo() {
    request('personalized').then((val) {
      print(val);
    });

    notifyListeners();
  }
}