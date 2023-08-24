import 'package:flutter/material.dart';
import 'package:graphqldemo/src/app.dart';
import '../core/utils/dependency_injection.dart' as di;

void main() async {
  await di.init();

  runApp(const MyApp());
}
