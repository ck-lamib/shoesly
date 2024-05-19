import 'package:cloud_firestore/cloud_firestore.dart';

List<Map<String, dynamic>> demoProducts = [];
// Future<String> uploadSvgToStorage(String svgFilePath) async {
//   log(svgFilePath);
//   // final storageRef =
//   //     FirebaseStorage.instance.ref().child('svgs/${basename(svgFilePath)}');

//   final storageRef =
//       FirebaseStorage.instance.ref().child('svgs/${basename(svgFilePath)}');

//   final bytes = await rootBundle.load(svgFilePath);
//   final metadata = SettableMetadata(contentType: 'image/svg+xml');
//   // Convert ByteData to Uint8List
//   final uploadData =
//       bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

//   final uploadTask = storageRef.putData(uploadData, metadata);
//   final snapshot = await uploadTask.whenComplete(() {});
//   final downloadUrl = await snapshot.ref.getDownloadURL();
//   return downloadUrl;
// }

Future<void> generateDemoProductsWithUrls() async {
  // final svgFilePaths = [
  //   'assets/svgs/adidas1.svg',
  //   'assets/svgs/adidas2.svg',
  //   'assets/svgs/adidas3.svg',
  //   'assets/svgs/jordan1.svg',
  //   'assets/svgs/jordan2.svg',
  //   'assets/svgs/nike1.svg',
  //   'assets/svgs/nike2.svg',
  //   'assets/svgs/nike3.svg',
  //   'assets/svgs/nike4.svg',
  //   'assets/svgs/nike5.svg',
  // ];

  // final svgUrls = await Future.wait(svgFilePaths.map((v) async {
  //   return uploadSvgToStorage(v);
  // }));

  // demoProducts = [
  //   {
  //     'name': 'Product 1',
  //     'description': 'This is the description for Product 1',
  //     'images': ["", "", ""],
  //     'sizes': ["29", "30", "31"],
  //     'colors': ['black', 'white'],
  //     'price': 99.0,
  //     'averageRating': 4.0,
  //     'brand': 'adidas',
  //     'dateAdded': '2023-04-25',
  //     'gender': "unisex",
  //     'reviews': [
  //       {
  //         'name': 'John Doe',
  //         'image': "",
  //         'description': 'Great product!',
  //         'rating': 5,
  //         'date': '2023-05-01',
  //       },
  //       {
  //         'name': 'Jane Smith',
  //         'image': "",
  //         'description': 'Loved the colors!',
  //         'rating': 4,
  //         'date': '2023-04-25',
  //       },
  //     ],
  //   },
  //   {
  //     'name': 'Product 2',
  //     'description': 'This is the description for Product 2',
  //     'images': ["", "", ""],
  //     'sizes': ["29", "30", "31"],
  //     'colors': ['black', 'white'],
  //     'price': 999,
  //     'averageRating': 4,
  //     'brand': 'adidas',
  //     'dateAdded': '2023-04-25',
  //     'gender': "unisex",
  //     'reviews': [
  //       {
  //         'name': 'John Doe',
  //         'image': "",
  //         'description': 'Great product!',
  //         'rating': 5,
  //         'date': '2023-05-01',
  //       },
  //       {
  //         'name': 'Jane Smith',
  //         'image': "",
  //         'description': 'Loved the colors!',
  //         'rating': 4,
  //         'date': '2023-04-25',
  //       },
  //     ],
  //   },
  //   {
  //     'name': 'Product 3',
  //     'description': 'This is the description for Product 3',
  //     'images': ["", "", ""],
  //     'sizes': ["29", "30", "31"],
  //     'colors': ['black', 'white'],
  //     'price': 99,
  //     'averageRating': 4,
  //     'brand': 'adidas',
  //     'dateAdded': '2023-04-25',
  //     'gender': "unisex",
  //     'reviews': [
  //       {
  //         'name': 'John Doe',
  //         'image': "",
  //         'description': 'Great product!',
  //         'rating': 5,
  //         'date': '2023-05-01',
  //       },
  //       {
  //         'name': 'Jane Smith',
  //         'image': "",
  //         'description': 'Loved the colors!',
  //         'rating': 4,
  //         'date': '2023-04-25',
  //       },
  //     ],
  //   },
  //   {
  //     'name': 'Product 4',
  //     'description': 'This is the description for Product4',
  //     'images': ["", "", ""],
  //     'sizes': ["29", "30", "31"],
  //     'colors': ['black', 'white'],
  //     'price': 99,
  //     'averageRating': 4,
  //     'brand': 'jordan',
  //     'dateAdded': '2023-04-25',
  //     'gender': "unisex",
  //     'reviews': [
  //       {
  //         'name': 'John Doe',
  //         'image': "",
  //         'description': 'Great product!',
  //         'rating': 5,
  //         'date': '2023-05-01',
  //       },
  //       {
  //         'name': 'Jane Smith',
  //         'image': "",
  //         'description': 'Loved the colors!',
  //         'rating': 4,
  //         'date': '2023-04-25',
  //       },
  //     ],
  //   },
  //   {
  //     'name': 'Product 5',
  //     'description': 'This is the description for Product 5',
  //     'images': ["", "", ""],
  //     'sizes': ["29", "30", "31"],
  //     'colors': ['black', 'white'],
  //     'price': 99,
  //     'averageRating': 4,
  //     'brand': 'jordan',
  //     'dateAdded': '2023-04-25',
  //     'gender': "unisex",
  //     'reviews': [
  //       {
  //         'name': 'John Doe',
  //         'image': "",
  //         'description': 'Great product!',
  //         'rating': 5,
  //         'date': '2023-05-01',
  //       },
  //       {
  //         'name': 'Jane Smith',
  //         'image': "",
  //         'description': 'Loved the colors!',
  //         'rating': 4,
  //         'date': '2023-04-25',
  //       },
  //     ],
  //   },
  //   {
  //     'name': 'Product 6',
  //     'description': 'This is the description for Product 6',
  //     'images': ["", "", ""],
  //     'sizes': ["29", "30", "31"],
  //     'colors': ['black', 'white'],
  //     'price': 99,
  //     'averageRating': 4,
  //     'brand': 'nike',
  //     'dateAdded': '2023-04-25',
  //     'gender': "unisex",
  //     'reviews': [
  //       {
  //         'name': 'John Doe',
  //         'image': "",
  //         'description': 'Great product!',
  //         'rating': 5,
  //         'date': '2023-05-01',
  //       },
  //       {
  //         'name': 'Jane Smith',
  //         'image': "",
  //         'description': 'Loved the colors!',
  //         'rating': 4,
  //         'date': '2023-04-25',
  //       },
  //     ],
  //   },
  //   {
  //     'name': 'Product 7',
  //     'description': 'This is the description for Product 7',
  //     'images': ["", "", ""],
  //     'sizes': ["29", "30", "31"],
  //     'colors': ['black', 'white'],
  //     'price': 99,
  //     'averageRating': 4,
  //     'brand': 'nike',
  //     'dateAdded': '2023-04-25',
  //     'gender': "unisex",
  //     'reviews': [
  //       {
  //         'name': 'John Doe',
  //         'image': "",
  //         'description': 'Great product!',
  //         'rating': 5,
  //         'date': '2023-05-01',
  //       },
  //       {
  //         'name': 'Jane Smith',
  //         'image': "",
  //         'description': 'Loved the colors!',
  //         'rating': 4,
  //         'date': '2023-04-25',
  //       },
  //     ],
  //   },
  //   {
  //     'name': 'Product 8',
  //     'description': 'This is the description for Product 8',
  //     'images': ["", "", ""],
  //     'sizes': ["29", "30", "31"],
  //     'colors': ['black', 'white'],
  //     'price': 99,
  //     'averageRating': 4,
  //     'brand': 'nike',
  //     'dateAdded': '2023-04-25',
  //     'gender': "unisex",
  //     'reviews': [
  //       {
  //         'name': 'John Doe',
  //         'image': "",
  //         'description': 'Great product!',
  //         'rating': 5,
  //         'date': '2023-05-01',
  //       },
  //       {
  //         'name': 'Jane Smith',
  //         'image': "",
  //         'description': 'Loved the colors!',
  //         'rating': 4,
  //         'date': '2023-04-25',
  //       },
  //     ],
  //   },
  //   {
  //     'name': 'Product 9',
  //     'description': 'This is the description for Product 9',
  //     'images': ["", "", ""],
  //     'sizes': ["29", "30", "31"],
  //     'colors': ['black', 'white'],
  //     'price': 99,
  //     'averageRating': 4,
  //     'brand': 'nike',
  //     'dateAdded': '2023-04-25',
  //     'gender': "unisex",
  //     'reviews': [
  //       {
  //         'name': 'John Doe',
  //         'image': "",
  //         'description': 'Great product!',
  //         'rating': 5,
  //         'date': '2023-05-01',
  //       },
  //       {
  //         'name': 'Jane Smith',
  //         'image': "",
  //         'description': 'Loved the colors!',
  //         'rating': 4,
  //         'date': '2023-04-25',
  //       },
  //     ],
  //   },
  //   {
  //     'name': 'Product 10',
  //     'description': 'This is the description for Product 10',
  //     'images': ["", "", ""],
  //     'sizes': ["29", "30", "31"],
  //     'colors': ['black', 'white'],
  //     'price': 99,
  //     'averageRating': 4,
  //     'brand': 'nike',
  //     'dateAdded': '2023-04-25',
  //     'gender': "unisex",
  //     'reviews': [
  //       {
  //         'name': 'John Doe',
  //         'image': "",
  //         'description': 'Great product!',
  //         'rating': 5,
  //         'date': '2023-05-01',
  //       },
  //       {
  //         'name': 'Jane Smith',
  //         'image': "",
  //         'description': 'Loved the colors!',
  //         'rating': 4,
  //         'date': '2023-04-25',
  //       },
  //     ],
  //   },
  // ];

//adidas jordan nike puma
  // demoProducts = [
  //   {
  //     "name": "Adidas Running Shoes",
  //     "description": "This is the description for Adidas Running Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["7", "8", "9"],
  //     "colors": ["black", "white", "red"],
  //     "price": 99.00,
  //     "averageRating": 4.00,
  //     "brand": "adidas",
  //     "dateAdded": "2023-04-25",
  //     "gender": "unisex",
  //     "reviews": [
  //       {
  //         "name": "John Doe",
  //         "image": "",
  //         "description": "Great product!",
  //         "rating": 5,
  //         "date": "2023-05-01"
  //       },
  //       {
  //         "name": "Jane Smith",
  //         "image": "",
  //         "description": "Loved the colors!",
  //         "rating": 4,
  //         "date": "2023-04-25"
  //       },
  //       {
  //         "name": "Alice Johnson",
  //         "image": "",
  //         "description": "Very comfortable.",
  //         "rating": 4,
  //         "date": "2023-05-05"
  //       },
  //       {
  //         "name": "Bob Brown",
  //         "image": "",
  //         "description": "Good value for the price.",
  //         "rating": 5,
  //         "date": "2023-05-07"
  //       },
  //       {
  //         "name": "Charlie Davis",
  //         "image": "",
  //         "description": "Stylish and durable.",
  //         "rating": 4,
  //         "date": "2023-05-10"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Adidas Casual Sneakers",
  //     "description": "This is the description for Adidas Casual Sneakers",
  //     "images": ["", "", ""],
  //     "sizes": ["10", "11", "12"],
  //     "colors": ["black", "white", "blue"],
  //     "price": 199.00,
  //     "averageRating": 4.50,
  //     "brand": "adidas",
  //     "dateAdded": "2023-04-25",
  //     "gender": "unisex",
  //     "reviews": [
  //       {
  //         "name": "John Doe",
  //         "image": "",
  //         "description": "Great product!",
  //         "rating": 5,
  //         "date": "2023-05-01"
  //       },
  //       {
  //         "name": "Jane Smith",
  //         "image": "",
  //         "description": "Loved the colors!",
  //         "rating": 4,
  //         "date": "2023-04-25"
  //       },
  //       {
  //         "name": "Emily White",
  //         "image": "",
  //         "description": "High quality.",
  //         "rating": 4,
  //         "date": "2023-05-02"
  //       },
  //       {
  //         "name": "David Green",
  //         "image": "",
  //         "description": "Comfortable fit.",
  //         "rating": 5,
  //         "date": "2023-05-06"
  //       },
  //       {
  //         "name": "Sophia Hill",
  //         "image": "",
  //         "description": "Worth the price.",
  //         "rating": 4,
  //         "date": "2023-05-08"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Adidas Sports Shoes",
  //     "description": "This is the description for Adidas Sports Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["9", "10", "11"],
  //     "colors": ["black", "grey", "red"],
  //     "price": 150.00,
  //     "averageRating": 4.20,
  //     "brand": "adidas",
  //     "dateAdded": "2023-04-25",
  //     "gender": "man",
  //     "reviews": [
  //       {
  //         "name": "Chris Blue",
  //         "image": "",
  //         "description": "Great support for sports activities.",
  //         "rating": 5,
  //         "date": "2023-05-12"
  //       },
  //       {
  //         "name": "Maria Green",
  //         "image": "",
  //         "description": "Very stylish and comfortable.",
  //         "rating": 4,
  //         "date": "2023-05-14"
  //       },
  //       {
  //         "name": "James Black",
  //         "image": "",
  //         "description": "Good value for the money.",
  //         "rating": 4,
  //         "date": "2023-05-15"
  //       },
  //       {
  //         "name": "Anna White",
  //         "image": "",
  //         "description": "Love the design.",
  //         "rating": 4,
  //         "date": "2023-05-16"
  //       },
  //       {
  //         "name": "Steve Brown",
  //         "image": "",
  //         "description": "Very durable shoes.",
  //         "rating": 5,
  //         "date": "2023-05-17"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Adidas Tennis Shoes",
  //     "description": "This is the description for Adidas Tennis Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["6", "7", "8"],
  //     "colors": ["white", "blue", "red"],
  //     "price": 130.00,
  //     "averageRating": 4.30,
  //     "brand": "adidas",
  //     "dateAdded": "2023-04-25",
  //     "gender": "woman",
  //     "reviews": [
  //       {
  //         "name": "Sarah Connor",
  //         "image": "",
  //         "description": "Perfect for tennis.",
  //         "rating": 5,
  //         "date": "2023-05-12"
  //       },
  //       {
  //         "name": "Kyle Reese",
  //         "image": "",
  //         "description": "Comfortable and stylish.",
  //         "rating": 4,
  //         "date": "2023-05-14"
  //       },
  //       {
  //         "name": "John Connor",
  //         "image": "",
  //         "description": "Great for long sessions.",
  //         "rating": 5,
  //         "date": "2023-05-15"
  //       },
  //       {
  //         "name": "T-800",
  //         "image": "",
  //         "description": "Solid build.",
  //         "rating": 4,
  //         "date": "2023-05-16"
  //       },
  //       {
  //         "name": "T-1000",
  //         "image": "",
  //         "description": "Good value.",
  //         "rating": 4,
  //         "date": "2023-05-17"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Adidas Training Shoes",
  //     "description": "This is the description for Adidas Training Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["9", "10", "11"],
  //     "colors": ["black", "white", "blue"],
  //     "price": 120.00,
  //     "averageRating": 4.10,
  //     "brand": "adidas",
  //     "dateAdded": "2023-04-25",
  //     "gender": "unisex",
  //     "reviews": [
  //       {
  //         "name": "Dwayne Johnson",
  //         "image": "",
  //         "description": "Great for gym workouts.",
  //         "rating": 5,
  //         "date": "2023-05-12"
  //       },
  //       {
  //         "name": "Kevin Hart",
  //         "image": "",
  //         "description": "Comfortable and durable.",
  //         "rating": 4,
  //         "date": "2023-05-14"
  //       },
  //       {
  //         "name": "Jason Statham",
  //         "image": "",
  //         "description": "Excellent grip.",
  //         "rating": 4,
  //         "date": "2023-05-15"
  //       },
  //       {
  //         "name": "Gal Gadot",
  //         "image": "",
  //         "description": "Great design.",
  //         "rating": 5,
  //         "date": "2023-05-16"
  //       },
  //       {
  //         "name": "Chris Evans",
  //         "image": "",
  //         "description": "Very supportive.",
  //         "rating": 4,
  //         "date": "2023-05-17"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Jordan Basketball Shoes",
  //     "description": "This is the description for Jordan Basketball Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["8", "9", "10"],
  //     "colors": ["black", "red", "grey"],
  //     "price": 99.00,
  //     "averageRating": 4.00,
  //     "brand": "jordan",
  //     "dateAdded": "2023-04-25",
  //     "gender": "unisex",
  //     "reviews": [
  //       {
  //         "name": "John Doe",
  //         "image": "",
  //         "description": "Great product!",
  //         "rating": 5,
  //         "date": "2023-05-01"
  //       },
  //       {
  //         "name": "Jane Smith",
  //         "image": "",
  //         "description": "Loved the colors!",
  //         "rating": 4,
  //         "date": "2023-04-25"
  //       },
  //       {
  //         "name": "Michael Scott",
  //         "image": "",
  //         "description": "Excellent build.",
  //         "rating": 5,
  //         "date": "2023-05-03"
  //       },
  //       {
  //         "name": "Dwight Schrute",
  //         "image": "",
  //         "description": "Amazing comfort.",
  //         "rating": 4,
  //         "date": "2023-05-09"
  //       },
  //       {
  //         "name": "Pam Beesly",
  //         "image": "",
  //         "description": "High quality.",
  //         "rating": 4,
  //         "date": "2023-05-11"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Jordan Running Shoes",
  //     "description": "This is the description for Jordan Running Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["9", "10", "11"],
  //     "colors": ["white", "grey", "blue"],
  //     "price": 150.00,
  //     "averageRating": 4.50,
  //     "brand": "jordan",
  //     "dateAdded": "2023-04-25",
  //     "gender": "man",
  //     "reviews": [
  //       {
  //         "name": "Leslie Knope",
  //         "image": "",
  //         "description": "Perfect for running.",
  //         "rating": 5,
  //         "date": "2023-05-10"
  //       },
  //       {
  //         "name": "Ron Swanson",
  //         "image": "",
  //         "description": "Very durable.",
  //         "rating": 4,
  //         "date": "2023-05-12"
  //       },
  //       {
  //         "name": "Tom Haverford",
  //         "image": "",
  //         "description": "Stylish and comfortable.",
  //         "rating": 4,
  //         "date": "2023-05-14"
  //       },
  //       {
  //         "name": "April Ludgate",
  //         "image": "",
  //         "description": "Good value for money.",
  //         "rating": 5,
  //         "date": "2023-05-15"
  //       },
  //       {
  //         "name": "Andy Dwyer",
  //         "image": "",
  //         "description": "Love the design.",
  //         "rating": 4,
  //         "date": "2023-05-16"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Jordan Casual Shoes",
  //     "description": "This is the description for Jordan Casual Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["10", "11", "12"],
  //     "colors": ["black", "blue", "red"],
  //     "price": 130.00,
  //     "averageRating": 4.30,
  //     "brand": "jordan",
  //     "dateAdded": "2023-04-25",
  //     "gender": "woman",
  //     "reviews": [
  //       {
  //         "name": "Jim Halpert",
  //         "image": "",
  //         "description": "Comfortable and stylish.",
  //         "rating": 5,
  //         "date": "2023-05-12"
  //       },
  //       {
  //         "name": "Pam Beesly",
  //         "image": "",
  //         "description": "Great value.",
  //         "rating": 4,
  //         "date": "2023-05-14"
  //       },
  //       {
  //         "name": "Michael Scott",
  //         "image": "",
  //         "description": "Very comfortable.",
  //         "rating": 5,
  //         "date": "2023-05-15"
  //       },
  //       {
  //         "name": "Dwight Schrute",
  //         "image": "",
  //         "description": "Solid build.",
  //         "rating": 4,
  //         "date": "2023-05-16"
  //       },
  //       {
  //         "name": "Angela Martin",
  //         "image": "",
  //         "description": "Good design.",
  //         "rating": 4,
  //         "date": "2023-05-17"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Jordan Sports Shoes",
  //     "description": "This is the description for Jordan Sports Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["8", "9", "10"],
  //     "colors": ["grey", "blue", "red"],
  //     "price": 120.00,
  //     "averageRating": 4.40,
  //     "brand": "jordan",
  //     "dateAdded": "2023-04-25",
  //     "gender": "unisex",
  //     "reviews": [
  //       {
  //         "name": "Jake Peralta",
  //         "image": "",
  //         "description": "Great for sports.",
  //         "rating": 5,
  //         "date": "2023-05-12"
  //       },
  //       {
  //         "name": "Amy Santiago",
  //         "image": "",
  //         "description": "Comfortable fit.",
  //         "rating": 4,
  //         "date": "2023-05-14"
  //       },
  //       {
  //         "name": "Terry Jeffords",
  //         "image": "",
  //         "description": "Very durable.",
  //         "rating": 5,
  //         "date": "2023-05-15"
  //       },
  //       {
  //         "name": "Rosa Diaz",
  //         "image": "",
  //         "description": "Love the design.",
  //         "rating": 4,
  //         "date": "2023-05-16"
  //       },
  //       {
  //         "name": "Charles Boyle",
  //         "image": "",
  //         "description": "Good value.",
  //         "rating": 4,
  //         "date": "2023-05-17"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Jordan Training Shoes",
  //     "description": "This is the description for Jordan Training Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["9", "10", "11"],
  //     "colors": ["black", "white", "grey"],
  //     "price": 99.00,
  //     "averageRating": 4.20,
  //     "brand": "jordan",
  //     "dateAdded": "2023-04-25",
  //     "gender": "unisex",
  //     "reviews": [
  //       {
  //         "name": "Raymond Holt",
  //         "image": "",
  //         "description": "Great for gym workouts.",
  //         "rating": 5,
  //         "date": "2023-05-12"
  //       },
  //       {
  //         "name": "Gina Linetti",
  //         "image": "",
  //         "description": "Comfortable and stylish.",
  //         "rating": 4,
  //         "date": "2023-05-14"
  //       },
  //       {
  //         "name": "Hitchcock",
  //         "image": "",
  //         "description": "Good value for the money.",
  //         "rating": 4,
  //         "date": "2023-05-15"
  //       },
  //       {
  //         "name": "Scully",
  //         "image": "",
  //         "description": "Excellent grip.",
  //         "rating": 5,
  //         "date": "2023-05-16"
  //       },
  //       {
  //         "name": "Kevin Cozner",
  //         "image": "",
  //         "description": "Very supportive.",
  //         "rating": 4,
  //         "date": "2023-05-17"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Nike Running Shoes",
  //     "description": "This is the description for Nike Running Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["9", "10", "11"],
  //     "colors": ["black", "white", "blue"],
  //     "price": 99.00,
  //     "averageRating": 4.00,
  //     "brand": "nike",
  //     "dateAdded": "2023-04-25",
  //     "gender": "unisex",
  //     "reviews": [
  //       {
  //         "name": "John Doe",
  //         "image": "",
  //         "description": "Great product!",
  //         "rating": 5,
  //         "date": "2023-05-01"
  //       },
  //       {
  //         "name": "Jane Smith",
  //         "image": "",
  //         "description": "Loved the colors!",
  //         "rating": 4,
  //         "date": "2023-04-25"
  //       },
  //       {
  //         "name": "Michael Scott",
  //         "image": "",
  //         "description": "Excellent build.",
  //         "rating": 5,
  //         "date": "2023-05-03"
  //       },
  //       {
  //         "name": "Dwight Schrute",
  //         "image": "",
  //         "description": "Amazing comfort.",
  //         "rating": 4,
  //         "date": "2023-05-09"
  //       },
  //       {
  //         "name": "Pam Beesly",
  //         "image": "",
  //         "description": "High quality.",
  //         "rating": 4,
  //         "date": "2023-05-11"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Nike Casual Shoes",
  //     "description": "This is the description for Nike Casual Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["7", "8", "9"],
  //     "colors": ["black", "white", "red"],
  //     "price": 150.00,
  //     "averageRating": 4.50,
  //     "brand": "nike",
  //     "dateAdded": "2023-04-25",
  //     "gender": "man",
  //     "reviews": [
  //       {
  //         "name": "John Doe",
  //         "image": "",
  //         "description": "Great product!",
  //         "rating": 5,
  //         "date": "2023-05-01"
  //       },
  //       {
  //         "name": "Jane Smith",
  //         "image": "",
  //         "description": "Loved the colors!",
  //         "rating": 4,
  //         "date": "2023-04-25"
  //       },
  //       {
  //         "name": "Emily White",
  //         "image": "",
  //         "description": "High quality.",
  //         "rating": 4,
  //         "date": "2023-05-02"
  //       },
  //       {
  //         "name": "David Green",
  //         "image": "",
  //         "description": "Comfortable fit.",
  //         "rating": 5,
  //         "date": "2023-05-06"
  //       },
  //       {
  //         "name": "Sophia Hill",
  //         "image": "",
  //         "description": "Worth the price.",
  //         "rating": 4,
  //         "date": "2023-05-08"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Nike Sports Shoes",
  //     "description": "This is the description for Nike Sports Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["8", "9", "10"],
  //     "colors": ["grey", "blue", "red"],
  //     "price": 130.00,
  //     "averageRating": 4.30,
  //     "brand": "nike",
  //     "dateAdded": "2023-04-25",
  //     "gender": "woman",
  //     "reviews": [
  //       {
  //         "name": "Jim Halpert",
  //         "image": "",
  //         "description": "Comfortable and stylish.",
  //         "rating": 5,
  //         "date": "2023-05-12"
  //       },
  //       {
  //         "name": "Pam Beesly",
  //         "image": "",
  //         "description": "Great value.",
  //         "rating": 4,
  //         "date": "2023-05-14"
  //       },
  //       {
  //         "name": "Michael Scott",
  //         "image": "",
  //         "description": "Very comfortable.",
  //         "rating": 5,
  //         "date": "2023-05-15"
  //       },
  //       {
  //         "name": "Dwight Schrute",
  //         "image": "",
  //         "description": "Solid build.",
  //         "rating": 4,
  //         "date": "2023-05-16"
  //       },
  //       {
  //         "name": "Angela Martin",
  //         "image": "",
  //         "description": "Good design.",
  //         "rating": 4,
  //         "date": "2023-05-17"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Nike Training Shoes",
  //     "description": "This is the description for Nike Training Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["9", "10", "11"],
  //     "colors": ["black", "white", "grey"],
  //     "price": 120.00,
  //     "averageRating": 4.10,
  //     "brand": "nike",
  //     "dateAdded": "2023-04-25",
  //     "gender": "unisex",
  //     "reviews": [
  //       {
  //         "name": "Jake Peralta",
  //         "image": "",
  //         "description": "Great for sports.",
  //         "rating": 5,
  //         "date": "2023-05-12"
  //       },
  //       {
  //         "name": "Amy Santiago",
  //         "image": "",
  //         "description": "Comfortable fit.",
  //         "rating": 4,
  //         "date": "2023-05-14"
  //       },
  //       {
  //         "name": "Terry Jeffords",
  //         "image": "",
  //         "description": "Very durable.",
  //         "rating": 5,
  //         "date": "2023-05-15"
  //       },
  //       {
  //         "name": "Rosa Diaz",
  //         "image": "",
  //         "description": "Love the design.",
  //         "rating": 4,
  //         "date": "2023-05-16"
  //       },
  //       {
  //         "name": "Charles Boyle",
  //         "image": "",
  //         "description": "Good value.",
  //         "rating": 4,
  //         "date": "2023-05-17"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Nike Tennis Shoes",
  //     "description": "This is the description for Nike Tennis Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["9", "10", "11"],
  //     "colors": ["black", "white", "blue"],
  //     "price": 99.00,
  //     "averageRating": 4.00,
  //     "brand": "nike",
  //     "dateAdded": "2023-04-25",
  //     "gender": "unisex",
  //     "reviews": [
  //       {
  //         "name": "John Doe",
  //         "image": "",
  //         "description": "Great product!",
  //         "rating": 5,
  //         "date": "2023-05-01"
  //       },
  //       {
  //         "name": "Jane Smith",
  //         "image": "",
  //         "description": "Loved the colors!",
  //         "rating": 4,
  //         "date": "2023-04-25"
  //       },
  //       {
  //         "name": "Michael Scott",
  //         "image": "",
  //         "description": "Excellent build.",
  //         "rating": 5,
  //         "date": "2023-05-03"
  //       },
  //       {
  //         "name": "Dwight Schrute",
  //         "image": "",
  //         "description": "Amazing comfort.",
  //         "rating": 4,
  //         "date": "2023-05-09"
  //       },
  //       {
  //         "name": "Pam Beesly",
  //         "image": "",
  //         "description": "High quality.",
  //         "rating": 4,
  //         "date": "2023-05-11"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Puma Running Shoes",
  //     "description": "This is the description for Puma Running Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["9", "10", "11"],
  //     "colors": ["black", "white", "blue"],
  //     "price": 99.00,
  //     "averageRating": 4.00,
  //     "brand": "puma",
  //     "dateAdded": "2023-04-25",
  //     "gender": "unisex",
  //     "reviews": [
  //       {
  //         "name": "John Doe",
  //         "image": "",
  //         "description": "Great product!",
  //         "rating": 5,
  //         "date": "2023-05-01"
  //       },
  //       {
  //         "name": "Jane Smith",
  //         "image": "",
  //         "description": "Loved the colors!",
  //         "rating": 4,
  //         "date": "2023-04-25"
  //       },
  //       {
  //         "name": "Michael Scott",
  //         "image": "",
  //         "description": "Excellent build.",
  //         "rating": 5,
  //         "date": "2023-05-03"
  //       },
  //       {
  //         "name": "Dwight Schrute",
  //         "image": "",
  //         "description": "Amazing comfort.",
  //         "rating": 4,
  //         "date": "2023-05-09"
  //       },
  //       {
  //         "name": "Pam Beesly",
  //         "image": "",
  //         "description": "High quality.",
  //         "rating": 4,
  //         "date": "2023-05-11"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Puma Casual Shoes",
  //     "description": "This is the description for Puma Casual Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["10", "11", "12"],
  //     "colors": ["black", "white", "blue"],
  //     "price": 199.00,
  //     "averageRating": 4.50,
  //     "brand": "puma",
  //     "dateAdded": "2023-04-25",
  //     "gender": "unisex",
  //     "reviews": [
  //       {
  //         "name": "John Doe",
  //         "image": "",
  //         "description": "Great product!",
  //         "rating": 5,
  //         "date": "2023-05-01"
  //       },
  //       {
  //         "name": "Jane Smith",
  //         "image": "",
  //         "description": "Loved the colors!",
  //         "rating": 4,
  //         "date": "2023-04-25"
  //       },
  //       {
  //         "name": "Emily White",
  //         "image": "",
  //         "description": "High quality.",
  //         "rating": 4,
  //         "date": "2023-05-02"
  //       },
  //       {
  //         "name": "David Green",
  //         "image": "",
  //         "description": "Comfortable fit.",
  //         "rating": 5,
  //         "date": "2023-05-06"
  //       },
  //       {
  //         "name": "Sophia Hill",
  //         "image": "",
  //         "description": "Worth the price.",
  //         "rating": 4,
  //         "date": "2023-05-08"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Puma Sports Shoes",
  //     "description": "This is the description for Puma Sports Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["8", "9", "10"],
  //     "colors": ["grey", "blue", "red"],
  //     "price": 150.00,
  //     "averageRating": 4.20,
  //     "brand": "puma",
  //     "dateAdded": "2023-04-25",
  //     "gender": "man",
  //     "reviews": [
  //       {
  //         "name": "Chris Blue",
  //         "image": "",
  //         "description": "Great support for sports activities.",
  //         "rating": 5,
  //         "date": "2023-05-12"
  //       },
  //       {
  //         "name": "Maria Green",
  //         "image": "",
  //         "description": "Very stylish and comfortable.",
  //         "rating": 4,
  //         "date": "2023-05-14"
  //       },
  //       {
  //         "name": "James Black",
  //         "image": "",
  //         "description": "Good value for the money.",
  //         "rating": 4,
  //         "date": "2023-05-15"
  //       },
  //       {
  //         "name": "Anna White",
  //         "image": "",
  //         "description": "Excellent design.",
  //         "rating": 5,
  //         "date": "2023-05-16"
  //       },
  //       {
  //         "name": "Brian Grey",
  //         "image": "",
  //         "description": "Very durable.",
  //         "rating": 4,
  //         "date": "2023-05-17"
  //       }
  //     ]
  //   },
  //   {
  //     "name": "Puma Training Shoes",
  //     "description": "This is the description for Puma Training Shoes",
  //     "images": ["", "", ""],
  //     "sizes": ["9", "10", "11"],
  //     "colors": ["black", "white", "grey"],
  //     "price": 120.00,
  //     "averageRating": 4.40,
  //     "brand": "puma",
  //     "dateAdded": "2023-04-25",
  //     "gender": "woman",
  //     "reviews": [
  //       {
  //         "name": "Emma Brown",
  //         "image": "",
  //         "description": "Perfect for training sessions.",
  //         "rating": 5,
  //         "date": "2023-05-12"
  //       },
  //       {
  //         "name": "Oliver White",
  //         "image": "",
  //         "description": "Very comfortable.",
  //         "rating": 4,
  //         "date": "2023-05-14"
  //       },
  //       {
  //         "name": "Sophia Black",
  //         "image": "",
  //         "description": "Great grip.",
  //         "rating": 5,
  //         "date": "2023-05-15"
  //       },
  //       {
  //         "name": "William Grey",
  //         "image": "",
  //         "description": "Good design and fit.",
  //         "rating": 4,
  //         "date": "2023-05-16"
  //       },
  //       {
  //         "name": "Emily White",
  //         "image": "",
  //         "description": "Worth the price.",
  //         "rating": 4,
  //         "date": "2023-05-17"
  //       }
  //     ]
  //   }
  // ];
  demoProducts = [
    {
      "name": "Puma Running Shoes",
      "description": "This is the description for Puma Running Shoes",
      "images": ["", "", ""],
      "sizes": ["9", "10", "11"],
      "colors": ["black", "white", "blue"],
      "price": 99.00,
      "averageRating": 4.00,
      "brand": "puma",
      "dateAdded": "2023-04-25",
      "gender": "unisex",
      "reviews": [
        {
          "name": "John Doe",
          "image": "",
          "description": "Great product!",
          "rating": 5,
          "date": "2023-05-01"
        },
        {
          "name": "Jane Smith",
          "image": "",
          "description": "Loved the colors!",
          "rating": 4,
          "date": "2023-04-25"
        },
        {
          "name": "Michael Scott",
          "image": "",
          "description": "Excellent build.",
          "rating": 5,
          "date": "2023-05-03"
        },
        {
          "name": "Dwight Schrute",
          "image": "",
          "description": "Amazing comfort.",
          "rating": 4,
          "date": "2023-05-09"
        },
        {
          "name": "Pam Beesly",
          "image": "",
          "description": "High quality.",
          "rating": 4,
          "date": "2023-05-11"
        }
      ]
    },
    {
      "name": "Puma Casual Shoes",
      "description": "This is the description for Puma Casual Shoes",
      "images": ["", "", ""],
      "sizes": ["10", "11", "12"],
      "colors": ["black", "white", "blue"],
      "price": 199.00,
      "averageRating": 4.50,
      "brand": "puma",
      "dateAdded": "2023-04-25",
      "gender": "unisex",
      "reviews": [
        {
          "name": "John Doe",
          "image": "",
          "description": "Great product!",
          "rating": 5,
          "date": "2023-05-01"
        },
        {
          "name": "Jane Smith",
          "image": "",
          "description": "Loved the colors!",
          "rating": 4,
          "date": "2023-04-25"
        },
        {
          "name": "Emily White",
          "image": "",
          "description": "High quality.",
          "rating": 4,
          "date": "2023-05-02"
        },
        {
          "name": "David Green",
          "image": "",
          "description": "Comfortable fit.",
          "rating": 5,
          "date": "2023-05-06"
        },
        {
          "name": "Sophia Hill",
          "image": "",
          "description": "Worth the price.",
          "rating": 4,
          "date": "2023-05-08"
        }
      ]
    },
    {
      "name": "Puma Sports Shoes",
      "description": "This is the description for Puma Sports Shoes",
      "images": ["", "", ""],
      "sizes": ["8", "9", "10"],
      "colors": ["grey", "blue", "red"],
      "price": 150.00,
      "averageRating": 4.20,
      "brand": "puma",
      "dateAdded": "2023-04-25",
      "gender": "man",
      "reviews": [
        {
          "name": "Chris Blue",
          "image": "",
          "description": "Great support for sports activities.",
          "rating": 5,
          "date": "2023-05-12"
        },
        {
          "name": "Maria Green",
          "image": "",
          "description": "Very stylish and comfortable.",
          "rating": 4,
          "date": "2023-05-14"
        },
        {
          "name": "James Black",
          "image": "",
          "description": "Good value for the money.",
          "rating": 4,
          "date": "2023-05-15"
        },
        {
          "name": "Anna White",
          "image": "",
          "description": "Excellent design.",
          "rating": 5,
          "date": "2023-05-16"
        },
        {
          "name": "Brian Grey",
          "image": "",
          "description": "Very durable.",
          "rating": 4,
          "date": "2023-05-17"
        }
      ]
    },
    {
      "name": "Puma Training Shoes",
      "description": "This is the description for Puma Training Shoes",
      "images": ["", "", ""],
      "sizes": ["9", "10", "11"],
      "colors": ["black", "white", "grey"],
      "price": 120.00,
      "averageRating": 4.40,
      "brand": "puma",
      "dateAdded": "2023-04-25",
      "gender": "woman",
      "reviews": [
        {
          "name": "Emma Brown",
          "image": "",
          "description": "Perfect for training sessions.",
          "rating": 5,
          "date": "2023-05-12"
        },
        {
          "name": "Oliver White",
          "image": "",
          "description": "Very comfortable.",
          "rating": 4,
          "date": "2023-05-14"
        },
        {
          "name": "Sophia Black",
          "image": "",
          "description": "Great grip.",
          "rating": 5,
          "date": "2023-05-15"
        },
        {
          "name": "William Grey",
          "image": "",
          "description": "Good design and fit.",
          "rating": 4,
          "date": "2023-05-16"
        },
        {
          "name": "Emily White",
          "image": "",
          "description": "Worth the price.",
          "rating": 4,
          "date": "2023-05-17"
        }
      ]
    },
    {
      "name": "Reebok Running Shoes",
      "description": "This is the description for Reebok Running Shoes",
      "images": ["", "", ""],
      "sizes": ["9", "10", "11"],
      "colors": ["black", "white", "blue"],
      "price": 110.00,
      "averageRating": 4.30,
      "brand": "reebok",
      "dateAdded": "2023-04-25",
      "gender": "unisex",
      "reviews": [
        {
          "name": "John Doe",
          "image": "",
          "description": "Great product!",
          "rating": 5,
          "date": "2023-05-01"
        },
        {
          "name": "Jane Smith",
          "image": "",
          "description": "Loved the colors!",
          "rating": 4,
          "date": "2023-04-25"
        },
        {
          "name": "Michael Scott",
          "image": "",
          "description": "Excellent build.",
          "rating": 5,
          "date": "2023-05-03"
        },
        {
          "name": "Dwight Schrute",
          "image": "",
          "description": "Amazing comfort.",
          "rating": 4,
          "date": "2023-05-09"
        },
        {
          "name": "Pam Beesly",
          "image": "",
          "description": "High quality.",
          "rating": 4,
          "date": "2023-05-11"
        }
      ]
    },
    {
      "name": "Reebok Casual Shoes",
      "description": "This is the description for Reebok Casual Shoes",
      "images": ["", "", ""],
      "sizes": ["10", "11", "12"],
      "colors": ["black", "white", "blue"],
      "price": 125.00,
      "averageRating": 4.50,
      "brand": "reebok",
      "dateAdded": "2023-04-25",
      "gender": "unisex",
      "reviews": [
        {
          "name": "John Doe",
          "image": "",
          "description": "Great product!",
          "rating": 5,
          "date": "2023-05-01"
        },
        {
          "name": "Jane Smith",
          "image": "",
          "description": "Loved the colors!",
          "rating": 4,
          "date": "2023-04-25"
        },
        {
          "name": "Emily White",
          "image": "",
          "description": "High quality.",
          "rating": 4,
          "date": "2023-05-02"
        },
        {
          "name": "David Green",
          "image": "",
          "description": "Comfortable fit.",
          "rating": 5,
          "date": "2023-05-06"
        },
        {
          "name": "Sophia Hill",
          "image": "",
          "description": "Worth the price.",
          "rating": 4,
          "date": "2023-05-08"
        }
      ]
    },
    {
      "name": "Reebok Sports Shoes",
      "description": "This is the description for Reebok Sports Shoes",
      "images": ["", "", ""],
      "sizes": ["8", "9", "10"],
      "colors": ["grey", "blue", "red"],
      "price": 140.00,
      "averageRating": 4.20,
      "brand": "reebok",
      "dateAdded": "2023-04-25",
      "gender": "man",
      "reviews": [
        {
          "name": "Chris Blue",
          "image": "",
          "description": "Great support for sports activities.",
          "rating": 5,
          "date": "2023-05-12"
        },
        {
          "name": "Maria Green",
          "image": "",
          "description": "Very stylish and comfortable.",
          "rating": 4,
          "date": "2023-05-14"
        },
        {
          "name": "James Black",
          "image": "",
          "description": "Good value for the money.",
          "rating": 4,
          "date": "2023-05-15"
        },
        {
          "name": "Anna White",
          "image": "",
          "description": "Excellent design.",
          "rating": 5,
          "date": "2023-05-16"
        },
        {
          "name": "Brian Grey",
          "image": "",
          "description": "Very durable.",
          "rating": 4,
          "date": "2023-05-17"
        }
      ]
    },
    {
      "name": "Reebok Training Shoes",
      "description": "This is the description for Reebok Training Shoes",
      "images": ["", "", ""],
      "sizes": ["9", "10", "11"],
      "colors": ["black", "white", "grey"],
      "price": 130.00,
      "averageRating": 4.40,
      "brand": "reebok",
      "dateAdded": "2023-04-25",
      "gender": "woman",
      "reviews": [
        {
          "name": "Emma Brown",
          "image": "",
          "description": "Perfect for training sessions.",
          "rating": 5,
          "date": "2023-05-12"
        },
        {
          "name": "Oliver White",
          "image": "",
          "description": "Very comfortable.",
          "rating": 4,
          "date": "2023-05-14"
        },
        {
          "name": "Sophia Black",
          "image": "",
          "description": "Great grip.",
          "rating": 5,
          "date": "2023-05-15"
        },
        {
          "name": "William Grey",
          "image": "",
          "description": "Good design and fit.",
          "rating": 4,
          "date": "2023-05-16"
        },
        {
          "name": "Emily White",
          "image": "",
          "description": "Worth the price.",
          "rating": 4,
          "date": "2023-05-17"
        }
      ]
    },
    {
      "name": "Vans Classic Shoes",
      "description": "This is the description for Vans Classic Shoes",
      "images": ["", "", ""],
      "sizes": ["8", "9", "10"],
      "colors": ["black", "white", "blue"],
      "price": 80.00,
      "averageRating": 4.10,
      "brand": "vans",
      "dateAdded": "2023-04-25",
      "gender": "unisex",
      "reviews": [
        {
          "name": "Chris Blue",
          "image": "",
          "description": "Great for casual wear.",
          "rating": 4,
          "date": "2023-05-01"
        },
        {
          "name": "Maria Green",
          "image": "",
          "description": "Stylish and comfy.",
          "rating": 5,
          "date": "2023-04-25"
        },
        {
          "name": "James Black",
          "image": "",
          "description": "Good value.",
          "rating": 4,
          "date": "2023-05-03"
        },
        {
          "name": "Anna White",
          "image": "",
          "description": "Nice design.",
          "rating": 4,
          "date": "2023-05-09"
        },
        {
          "name": "Brian Grey",
          "image": "",
          "description": "Durable material.",
          "rating": 5,
          "date": "2023-05-11"
        }
      ]
    },
    {
      "name": "Vans Skater Shoes",
      "description": "This is the description for Vans Skater Shoes",
      "images": ["", "", ""],
      "sizes": ["9", "10", "11"],
      "colors": ["grey", "blue", "red"],
      "price": 85.00,
      "averageRating": 4.20,
      "brand": "vans",
      "dateAdded": "2023-04-25",
      "gender": "man",
      "reviews": [
        {
          "name": "Chris Blue",
          "image": "",
          "description": "Perfect for skating.",
          "rating": 5,
          "date": "2023-05-12"
        },
        {
          "name": "Maria Green",
          "image": "",
          "description": "Very comfortable.",
          "rating": 4,
          "date": "2023-05-14"
        },
        {
          "name": "James Black",
          "image": "",
          "description": "Nice grip.",
          "rating": 4,
          "date": "2023-05-15"
        },
        {
          "name": "Anna White",
          "image": "",
          "description": "Great quality.",
          "rating": 5,
          "date": "2023-05-16"
        },
        {
          "name": "Brian Grey",
          "image": "",
          "description": "Good support.",
          "rating": 4,
          "date": "2023-05-17"
        }
      ]
    },
    {
      "name": "Vans Slip-On Shoes",
      "description": "This is the description for Vans Slip-On Shoes",
      "images": ["", "", ""],
      "sizes": ["7", "8", "9"],
      "colors": ["black", "white", "red"],
      "price": 75.00,
      "averageRating": 4.30,
      "brand": "vans",
      "dateAdded": "2023-04-25",
      "gender": "woman",
      "reviews": [
        {
          "name": "Chris Blue",
          "image": "",
          "description": "Very easy to wear.",
          "rating": 4,
          "date": "2023-05-12"
        },
        {
          "name": "Maria Green",
          "image": "",
          "description": "Very comfortable.",
          "rating": 5,
          "date": "2023-05-14"
        },
        {
          "name": "James Black",
          "image": "",
          "description": "Nice design.",
          "rating": 4,
          "date": "2023-05-15"
        },
        {
          "name": "Anna White",
          "image": "",
          "description": "Great fit.",
          "rating": 5,
          "date": "2023-05-16"
        },
        {
          "name": "Brian Grey",
          "image": "",
          "description": "Stylish and comfy.",
          "rating": 4,
          "date": "2023-05-17"
        }
      ]
    }
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
      // String productId = productRef.id;

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
    // print('Error populating demo data: $e');
  }
}
