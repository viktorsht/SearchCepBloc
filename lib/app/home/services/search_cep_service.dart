import 'package:dio/dio.dart';

class SearchCepService{

  Future<Response> fetchCep(String cep) async {
    final response = await Dio().get('https://brasilapi.com.br/api/cep/v1/$cep');
    return response;
  }

}