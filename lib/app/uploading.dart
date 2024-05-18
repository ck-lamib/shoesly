import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show rootBundle;

List<Map<String, dynamic>> demoProducts = [];
Future<String> uploadSvgToStorage(String svgFilePath) async {
  log(svgFilePath);
  // final storageRef =
  //     FirebaseStorage.instance.ref().child('svgs/${basename(svgFilePath)}');

  final storageRef =
      FirebaseStorage.instance.ref().child('svgs/${basename(svgFilePath)}');

  final bytes = await rootBundle.load(svgFilePath);
  final metadata = SettableMetadata(contentType: 'image/svg+xml');
  // Convert ByteData to Uint8List
  final uploadData =
      bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

  final uploadTask = storageRef.putData(uploadData, metadata);
  final snapshot = await uploadTask.whenComplete(() {});
  final downloadUrl = await snapshot.ref.getDownloadURL();
  return downloadUrl;
}

Future<void> generateDemoProductsWithUrls() async {
  final svgFilePaths = [
    'assets/svgs/adidas1.svg',
    'assets/svgs/adidas2.svg',
    'assets/svgs/adidas3.svg',
    'assets/svgs/jordan1.svg',
    'assets/svgs/jordan2.svg',
    'assets/svgs/nike1.svg',
    'assets/svgs/nike2.svg',
    'assets/svgs/nike3.svg',
    'assets/svgs/nike4.svg',
    'assets/svgs/nike5.svg',
  ];

  final svgUrls = await Future.wait(svgFilePaths.map((v) async {
    return uploadSvgToStorage(v);
  }));

  demoProducts = [
    {
      'name': 'Product 1',
      'description': 'This is the description for Product 1',
      'images': [svgUrls[0]],
      'sizes': ["29", "30", "31"],
      'colors': ['black', 'white'],
      'price': 99,
      'averageRating': 4,
      'brand': 'adidas',
      'reviews': [
        {
          'name': 'John Doe',
          'image': "",
          'description': 'Great product!',
          'rating': 5,
          'date': '2023-05-01',
        },
        {
          'name': 'Jane Smith',
          'image': "",
          'description': 'Loved the colors!',
          'rating': 4,
          'date': '2023-04-25',
        },
      ],
    },
    {
      'name': 'Product 2',
      'description': 'This is the description for Product 2',
      'images': [svgUrls[1]],
      'sizes': ["29", "30", "31"],
      'colors': ['black', 'white'],
      'price': 999,
      'averageRating': 4,
      'brand': 'adidas',
      'reviews': [
        {
          'name': 'John Doe',
          'image': "",
          'description': 'Great product!',
          'rating': 5,
          'date': '2023-05-01',
        },
        {
          'name': 'Jane Smith',
          'image': "",
          'description': 'Loved the colors!',
          'rating': 4,
          'date': '2023-04-25',
        },
      ],
    },
    {
      'name': 'Product 3',
      'description': 'This is the description for Product 3',
      'images': [svgUrls[2]],
      'sizes': ["29", "30", "31"],
      'colors': ['black', 'white'],
      'price': 99,
      'averageRating': 4,
      'brand': 'adidas',
      'reviews': [
        {
          'name': 'John Doe',
          'image': "",
          'description': 'Great product!',
          'rating': 5,
          'date': '2023-05-01',
        },
        {
          'name': 'Jane Smith',
          'image': "",
          'description': 'Loved the colors!',
          'rating': 4,
          'date': '2023-04-25',
        },
      ],
    },
    {
      'name': 'Product 4',
      'description': 'This is the description for Product4',
      'images': [svgUrls[3]],
      'sizes': ["29", "30", "31"],
      'colors': ['black', 'white'],
      'price': 99,
      'averageRating': 4,
      'brand': 'jordan',
      'reviews': [
        {
          'name': 'John Doe',
          'image': "",
          'description': 'Great product!',
          'rating': 5,
          'date': '2023-05-01',
        },
        {
          'name': 'Jane Smith',
          'image': "",
          'description': 'Loved the colors!',
          'rating': 4,
          'date': '2023-04-25',
        },
      ],
    },
    {
      'name': 'Product 5',
      'description': 'This is the description for Product 5',
      'images': [svgUrls[4]],
      'sizes': ["29", "30", "31"],
      'colors': ['black', 'white'],
      'price': 99,
      'averageRating': 4,
      'brand': 'jordan',
      'reviews': [
        {
          'name': 'John Doe',
          'image': "",
          'description': 'Great product!',
          'rating': 5,
          'date': '2023-05-01',
        },
        {
          'name': 'Jane Smith',
          'image': "",
          'description': 'Loved the colors!',
          'rating': 4,
          'date': '2023-04-25',
        },
      ],
    },
    {
      'name': 'Product 6',
      'description': 'This is the description for Product 6',
      'images': [svgUrls[5]],
      'sizes': ["29", "30", "31"],
      'colors': ['black', 'white'],
      'price': 99,
      'averageRating': 4,
      'brand': 'nike',
      'reviews': [
        {
          'name': 'John Doe',
          'image': "",
          'description': 'Great product!',
          'rating': 5,
          'date': '2023-05-01',
        },
        {
          'name': 'Jane Smith',
          'image': "",
          'description': 'Loved the colors!',
          'rating': 4,
          'date': '2023-04-25',
        },
      ],
    },
    {
      'name': 'Product 7',
      'description': 'This is the description for Product 7',
      'images': [svgUrls[6]],
      'sizes': ["29", "30", "31"],
      'colors': ['black', 'white'],
      'price': 99,
      'averageRating': 4,
      'brand': 'nike',
      'reviews': [
        {
          'name': 'John Doe',
          'image': "",
          'description': 'Great product!',
          'rating': 5,
          'date': '2023-05-01',
        },
        {
          'name': 'Jane Smith',
          'image': "",
          'description': 'Loved the colors!',
          'rating': 4,
          'date': '2023-04-25',
        },
      ],
    },
    {
      'name': 'Product 8',
      'description': 'This is the description for Product 8',
      'images': [svgUrls[7]],
      'sizes': ["29", "30", "31"],
      'colors': ['black', 'white'],
      'price': 99,
      'averageRating': 4,
      'brand': 'nike',
      'reviews': [
        {
          'name': 'John Doe',
          'image': "",
          'description': 'Great product!',
          'rating': 5,
          'date': '2023-05-01',
        },
        {
          'name': 'Jane Smith',
          'image': "",
          'description': 'Loved the colors!',
          'rating': 4,
          'date': '2023-04-25',
        },
      ],
    },
    {
      'name': 'Product 9',
      'description': 'This is the description for Product 9',
      'images': [svgUrls[8]],
      'sizes': ["29", "30", "31"],
      'colors': ['black', 'white'],
      'price': 99,
      'averageRating': 4,
      'brand': 'nike',
      'reviews': [
        {
          'name': 'John Doe',
          'image': "",
          'description': 'Great product!',
          'rating': 5,
          'date': '2023-05-01',
        },
        {
          'name': 'Jane Smith',
          'image': "",
          'description': 'Loved the colors!',
          'rating': 4,
          'date': '2023-04-25',
        },
      ],
    },
    {
      'name': 'Product 10',
      'description': 'This is the description for Product 10',
      'images': [svgUrls[9]],
      'sizes': ["29", "30", "31"],
      'colors': ['black', 'white'],
      'price': 99,
      'averageRating': 4,
      'brand': 'nike',
      'reviews': [
        {
          'name': 'John Doe',
          'image': "",
          'description': 'Great product!',
          'rating': 5,
          'date': '2023-05-01',
        },
        {
          'name': 'Jane Smith',
          'image': "",
          'description': 'Loved the colors!',
          'rating': 4,
          'date': '2023-04-25',
        },
      ],
    },
  ];
}

Future<void> populateDemoData() async {
  final productsCollection = FirebaseFirestore.instance.collection('Products');

  try {
    // Generate demo products with download URLs
    await generateDemoProductsWithUrls();

    // Add demo products to Firestore
    for (var product in demoProducts) {
      DocumentReference productRef = await productsCollection.add(product);
      String productId = productRef.id;

      // Add demo reviews for the product
      if (product['reviews'] != null) {
        List<Map<String, dynamic>> reviews =
            product['reviews'].cast<Map<String, dynamic>>();
        final reviewsCollection = productRef.collection('Reviews');

        for (var review in reviews) {
          await reviewsCollection.add(review);
        }
      }
    }
  } catch (e) {
    print('Error populating demo data: $e');
  }
}
