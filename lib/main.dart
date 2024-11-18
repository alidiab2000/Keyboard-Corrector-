import 'dart:io';

import 'package:flutter/material.dart';
import 'package:keyboard/app.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('My App');
    setWindowMaxSize(const Size(400, 800));
    setWindowMinSize(const Size(400, 800));
  }
  runApp(const KeyboardWrongInput());
}
