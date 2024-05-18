import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/app/init_dependencies.dart';
import 'package:shoesly/datasource/firebase_service.dart';
import 'package:shoesly/datasource/product_service.dart';

final firebaseFirestore = sl.get<FirebaseFirestore>();
final firebaseRemoteService = sl.get<FirebaseRemoteService>();
final productService = sl.get<ProductService>();
