import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer' as dev;

import '../models/CategoryCart.dart';
import '../models/MenuOption.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<MakeSearch>((event, emit) {
      dev.log('search text : ${event.query}');
    });
    on<ItemClicked>((event, emit) {
      dev.log('search text : ${event.text} is clicked');
    });
  }
}
