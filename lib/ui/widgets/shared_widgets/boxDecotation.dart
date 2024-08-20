import 'package:flutter/material.dart';

BoxDecoration boxDecoration({double radius=0}) {
  return  BoxDecoration(
  color: Colors.white.withOpacity(1),
  borderRadius: BorderRadius.circular(radius),
  );
}