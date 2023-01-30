import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class GlobalData extends ChangeNotifier{
  String cutename;
  String elementName;
  int elementTime;
  int elementCount;

  GlobalData({
    required this.cutename,
    required this.elementName,
    required this.elementTime,
    required this.elementCount});
}
