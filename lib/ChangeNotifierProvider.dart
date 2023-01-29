import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NameData extends ChangeNotifier {
  String _name="";

  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }
}
