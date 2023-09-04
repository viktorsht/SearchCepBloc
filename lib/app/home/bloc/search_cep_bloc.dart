import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:search_cep/app/home/services/search_cep_service.dart';

part 'search_cep_event.dart';
part 'search_cep_state.dart';

class SearchCepBloc extends Bloc<SearchCepEvent, SearchCepState> {
  
  SearchCepBloc() : super(SearchCepSucessState(data: const {})) {
    on<AddSearchCepEvent> (_mapEventToState);
  }

  SearchCepService searchCepService = SearchCepService();
  
  void _mapEventToState(AddSearchCepEvent event, Emitter<SearchCepState> emit) async {
    emit(SearchCepLoadingState());
    try{
      final response = await searchCepService.fetchCep(event.cep);
      emit(SearchCepSucessState(data: response.data));
    }
    catch(e){
      emit(SearchCepErrorState(message: e.toString()));
    }
  }
}
