import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/app/app.dart';
import 'package:shoesly/app/bloc_observer.dart';
import 'package:shoesly/app/init_dependencies.dart';

void main() async {
  initDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(const ShoeslyApp());
}
