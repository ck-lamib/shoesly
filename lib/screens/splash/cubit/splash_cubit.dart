import 'package:bloc/bloc.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit() : super(false) {
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    emit(true);
  }
}
