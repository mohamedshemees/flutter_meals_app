import 'package:bloc/bloc.dart';
import 'package:food_store_flutter/presentation/screens/home/home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());
}

