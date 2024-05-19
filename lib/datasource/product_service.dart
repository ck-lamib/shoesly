import 'package:dartz/dartz.dart';
import 'package:shoesly/app/failure.dart';
import 'package:shoesly/app/get_dependencies.dart';
import 'package:shoesly/models/product_model.dart';
import 'package:shoesly/utils/helpers/logger.dart';

class ProductService {
  String collectionName = "Products";
  Future<Either<Failure, ProductModelList>> fetchProducts({
    int? pageNumber,
    int? pageSize,
  }) async {
    List<ProductModel> products = [];

    try {
      await firebaseRemoteService
          .readFirestoreCollectionData(
        collectionPath: collectionName,
        pageNumber: pageNumber,
        pageSize: pageSize,
      )
          .then((snapshot) {
        products = snapshot.docs.map((doc) {
          // log("hi ${doc.data()}");

          Map<String, dynamic> data = doc.data();

          String productId = doc.id; // Get the document ID

          // Assign the document ID as the 'id' field in the Product model
          data['id'] = productId;

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
