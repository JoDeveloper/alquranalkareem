import 'package:flutter/material.dart';

import 'myApp.dart';
import 'services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocator.init();
  runApp(MyApp(theme: ThemeData.light()));
}
