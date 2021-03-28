import 'package:flutter/material.dart';
class Responsive{
  static width(BuildContext context)
  {
    return MediaQuery.of(context).size.width;
  }
  static height(BuildContext context)
  {
    return MediaQuery.of(context).size.height;
  }
}