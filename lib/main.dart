import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/di/di.dart';

void main() async {
  await configureDependencies();
  runApp(const MainApp());
}
