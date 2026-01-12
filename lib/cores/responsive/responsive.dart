import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext c) => MediaQuery.of(c).size.width < 600;
}
