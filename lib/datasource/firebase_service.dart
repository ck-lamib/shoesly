import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/app/get_dependencies.dart';
import 'package:shoesly/utils/helpers/logger.dart';

class FirebaseRemoteService {
  Future<void> addFirestoreDocData({
    required String collectionPath,
    required String docPath,
    required Map<String, dynamic> data,
  }) {
    final result =
        firebaseFirestore.collection(collectionPath).doc(docPath).set(
              data,
            );
    return result;
  }

  Future<void> updateFirestoreDocData({
    required String collectionPath,
    required String docPath,
    required Map<String, dynamic> data,
  }) {
    final result =
        firebaseFirestore.collection(collectionPath).doc(docPath).update(
              data,
            );
    return result;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> readFirestoreDocData({
    required String collectionPath,
    required String docPath,
  }) {
    final result =
        firebaseFirestore.collection(collectionPath).doc(docPath).get();
    return result;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> readFirestoreCollectionData({
    required String collectionPath,
    int? pageNumber, // Optional parameter for pagination
    int? pageSize, // Optional parameter for pagination
  }) async {
    Query<Map<String, dynamic>> query =
        firebaseFirestore.collection(collectionPath);

    // Conditionally adjust the query for pagination
    if (pageNumber != null && pageSize != null) {
      int startIndex = (pageNumber - 1) * pageSize;
      CustomLogger.trace("startafter $startIndex and limit $pageSize");
      query = query
          .orderBy('brand')
          .startAfterDocument(await _getDocumentAtStartIndex(query, startIndex))
          .limit(pageSize);
    }

    // Execute the query and return the result
    // return query.get();
    return query.get().then((querySnapshot) {
      CustomLogger.trace("Fetched ${querySnapshot.docs.length} documents");
      return querySnapshot;
    }).catchError((error) {
      CustomLogger.trace("Error fetching Firestore collection: $error");
      throw error; // Rethrow the error to handle it elsewhere if needed
    });
  }

  Future<void> deleteFirestoreDocData({
    required String collectionPath,
    required String docPath,
  }) {
    final result =
        firebaseFirestore.collection(collectionPath).doc(docPath).delete();
    return result;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> _getDocumentAtStartIndex(
      Query<Map<String, dynamic>> query, int startIndex) async {
    final snapshot = await query.orderBy("brand").limit(startIndex + 1).get();
    if (snapshot.docs.length > startIndex) {
      return snapshot.docs[startIndex];
    } else {
      throw Exception('No document found at index $startIndex');
    }
  }

  // Future<Either<Failure, String>> uploadImage({
  //   required String collectionPath,
  //   required String docPath,
  //   required String imageName,
  //   required File file,
  // }) async {
  //   final imageRef =
  //       firebaseStorage.ref().child("$collectionPath/$docPath/$imageName");
  //   try {
  //     String url = "";
  //     await imageRef.putFile(file).whenComplete(
  //       () async {
  //         url = await imageRef.getDownloadURL();
  //       },
  //     );
  //     if (url != "") {
  //       return Right(url);
  //     } else {
  //       return const Left(Exception("Error while uploading image"));
  //     }
  //   } on FirebaseException catch (e) {
  //     return Left(Exception(e.message ?? e.code));
  //   }
  // }

  // Future<Either<Failure, String>> deleteImage({
  //   required String collectionPath,
  //   String? docPath,
  //   String? imageName,
  // }) async {
  //   Reference imageRef = firebaseStorage.ref().child(collectionPath);
  //   if (docPath != null && imageName != null) {
  //     imageRef =
  //         firebaseStorage.ref().child("$collectionPath/$docPath/$imageName");
  //   } else if (docPath != null && imageName == null) {
  //     imageRef = firebaseStorage.ref().child("$collectionPath/$docPath");
  //   } else if (docPath == null && imageName != null) {
  //     imageRef = firebaseStorage.ref().child("$collectionPath/$imageName");
  //   }
  //   try {
  //     bool success = false;
  //     // await imageRef
  //     //   ..delete().whenComplete(() {
  //     //     success = true;
  //     //   });
  //     await imageRef.listAll().then(
  //       (value) async {
  //         for (var item in value.items) {
  //           await item.delete();
  //         }
  //       },
  //     ).whenComplete(() {
  //       success = true;
  //     });

  //     if (success) {
  //       return const Right("Image deleted successfully");
  //     } else {
  //       return const Left(Exception("Exception while deleting"));
  //     }
  //   } catch (e) {
  //     CustomLogger.trace("Error while deleting image: $e");
  //     return const Left(Exception("Exception while deleting"));
  //   }
  // }
}
