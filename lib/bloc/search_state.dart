

part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchStateInitial extends SearchState {
  SearchStateInitial() : super();
}

class SearchLoadingState extends SearchState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SearchLoadedState extends SearchState {
  final SearchModel searchData;


  SearchLoadedState({required this.searchData})
      : super();

  List<Object> get props => [this.searchData];
}


class SearchErrorState extends SearchState {
  final String message;

  SearchErrorState({required this.message}) : super();

  @override
  // TODO: implement props
  List<Object> get props => [];
}



















