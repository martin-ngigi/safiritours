import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeController extends Cubit<int>{

  int page = 0;

  WelcomeController(super.initialState);

  Future updatePage(int index) async {
    page = index;
    emit(state > 0 ? 0 : 1);
  }

}