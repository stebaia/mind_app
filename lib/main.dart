import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mind_app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mind_app/firebase/firebase_api.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
    await FirebaseApi().initNotifications();

  
  runApp(App());
}
