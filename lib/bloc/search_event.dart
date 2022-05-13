part of 'search_bloc.dart';


abstract class SearchEvent {
  const SearchEvent();

  @override
  List<Object> get props => [];
}



class fetchSearchList extends SearchEvent {
  final String apiKey;
  final String query;

  const fetchSearchList(this.apiKey,this.query);
}