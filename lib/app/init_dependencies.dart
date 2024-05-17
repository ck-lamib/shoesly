import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shoesly/firebase_options.dart';

final sl = GetIt.instance;

initDependencies() {
  WidgetsFlutterBinding.ensureInitialized();
  _initializeFirebase();
  _registerDependencies();
}

void _registerDependencies() {}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
