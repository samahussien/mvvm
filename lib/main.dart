import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/di.dart';

void main() async{
  //to make sure that every async function has implemented before running app
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp( MyApp());
}
