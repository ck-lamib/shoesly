import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/app/app.dart';
import 'package:shoesly/app/bloc_observer.dart';
import 'package:shoesly/app/init_dependencies.dart';

void main() async {
  await initDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(const ShoeslyApp());
}




// {
//   "id":"",
//   "name":"",
//   "description":"",
//   "images":[""],
//   "sizes":[2,3,4],
//   "colors":[""],
//   "price":100,
//   "averageRating":0.0,
//   "reviews":{
//     "reviewsCount":1.0,
//     "reviews":[
//       {
//         "id":"",
//         "name":"",
//         "image":"",
//         "description":"",
//         "rating":0.0,
//         "date":"",
//       }
//     ]

    
//   }
// }