part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class MakeSearch extends HomeEvent {
  final String query;

  const MakeSearch({required this.query});

  @override
  List<Object> get props => [query];
}

class ItemClicked extends HomeEvent {
  final String text;

  const ItemClicked({required this.text});

  @override
  List<Object> get props => [text];
}
