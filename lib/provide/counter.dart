import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  var value;
  increment(){
    value++;
    notifyListeners();
  }
}