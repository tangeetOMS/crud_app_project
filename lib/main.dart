import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'app.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const CrudApp(),
    ),
  );
}
