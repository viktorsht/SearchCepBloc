import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_cep/app/antigo/search_state.dart';
import 'package:search_cep/app/home/services/search_cep_service.dart';

class SearchCepBlocLib extends Bloc<String, SearchCepState> {
  final Dio dio;
  SearchCepBlocLib(this.dio) : super(const SearchCepSucess({}));

  SearchCepService searchCepService = SearchCepService();

  Stream<SearchCepState> mapEventToState(String event) async* {
    yield const SearchCepLoading();
    try {
      final response = await searchCepService.fetchCep(event);//await dio.get('https://brasilapi.com.br/api/cep/v1/$event');
      yield SearchCepSucess(response.data);
    } catch (e) {
      yield const SearchCepError('Erro na pesquisa');
    }
  }
}
