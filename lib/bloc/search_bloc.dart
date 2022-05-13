
import 'package:bloc/bloc.dart';
import 'package:centered_interview_test/model/image_model.dart';
import 'package:centered_interview_test/repository/api_services.dart';
import 'package:centered_interview_test/utils/result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'search_event.dart';
part 'search_state.dart';

Future<SearchModel> getSearchData(apiKey,query) async {
  ApiService repository = ApiService.instance;
  SearchModel searchdata =SearchModel();
  var response= await repository.getSearchData(apiKey,query);

  if(response is SuccessState){
    searchdata = response.value;
  }
  else if(response is ErrorState){
    debugPrint("response error =${response.msg}");
  }

  return searchdata;
}

class SearchImageBloc
    extends Bloc<SearchEvent, SearchState> {
  final BuildContext context;
  SearchImageBloc({required this.context}) : super(SearchStateInitial()) {
    on<SearchEvent>((event, emit) async {
      if (event is fetchSearchList) {
        SearchModel searchdata = await getSearchData(event.apiKey,event.query);
        if(searchdata !="" && searchdata!=null){
          emit(SearchLoadedState(searchData: searchdata));
        }
       else{
          emit(SearchLoadedState(searchData: searchdata));
        }
      }


    });
  }
}



