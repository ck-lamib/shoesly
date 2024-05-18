import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shoesly/app/get_dependencies.dart';
import 'package:shoesly/app/uploading.dart';
import 'package:shoesly/datasource/firebase_service.dart';
import 'package:shoesly/datasource/product_service.dart';
import 'package:shoesly/firebase_options.dart';

final sl = GetIt.instance;

initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase();
  _registerDependencies();
}

void _registerDependencies() {
  // register firestore singleton instance
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  sl.registerLazySingleton<FirebaseFirestore>(() => firebaseFirestore);
  // register firebase remote singleton instance
  sl.registerLazySingleton<FirebaseRemoteService>(
      () => FirebaseRemoteService());
  // register product service
  sl.registerLazySingleton<ProductService>(() => ProductService());
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(
    () {
      // populateDemoData();
    },
  );
}
