import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/app/get_dependencies.dart';

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
  }) {
    final result = firebaseFirestore.collection(collectionPath).get();

    return result;
  }

  Future<void> deleteFirestoreDocData({
    required String collectionPath,
    required String docPath,
  }) {
    final result =
        firebaseFirestore.collection(collectionPath).doc(docPath).delete();
    return result;
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
