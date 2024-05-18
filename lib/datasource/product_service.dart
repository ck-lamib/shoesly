import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shoesly/app/failure.dart';
import 'package:shoesly/app/get_dependencies.dart';
import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/models/review_model.dart';
import 'package:shoesly/utils/helpers/logger.dart';

class ProductService {
  String collectionName = "Products";
  Future<Either<Failure, ProductModelList>> fetchProducts() async {
    List<ProductModel> products = [];

    try {
      await firebaseRemoteService
          .readFirestoreCollectionData(collectionPath: collectionName)
          .then((snapshot) {
        products = snapshot.docs.map((doc) {
          // log("hi ${doc.data()}");

          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

          String productId = doc.id; // Get the document ID

          // if (data.containsKey('reviews')) {
          //   List<Review> reviews = (data['reviews'] as List<dynamic>)
          //       .map((reviewData) => Review.fromJson(reviewData))
          //       .toList();
          //   print(reviews);
          //   data['reviews'] = reviews;
          // }

          // Assign the document ID as the 'id' field in the Product model
          data['id'] = productId;
          print(data.toString());

          return ProductModel.fromJson(data);
        }).toList();

        // if (snapshot.exists) {
        //   log("it is here3");
        //   Map<dynamic, dynamic> values =
        //       snapshot.data() as Map<String, dynamic>;

        //   values.forEach((key, value) {
        //     Map<String, dynamic> data = value as Map<String, dynamic>;
        //     if (data.containsKey('reviews')) {
        //       List<Review> reviews = (data['reviews'] as List<dynamic>)
        //           .map((reviewData) => Review.fromJson(reviewData))
        //           .toList();
        //       data['reviews'] = reviews;
        //     }
        //     products.add(ProductModel.fromJson(data));
        //   });
        // }
      });
      return right(products);
    } catch (e) {
      CustomLogger.trace('Error fetching products: $e');
      return Left(Exception(e.toString()));
    }
  }
}
