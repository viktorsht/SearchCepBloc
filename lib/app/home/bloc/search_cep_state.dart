part of 'search_cep_bloc.dart';

@immutable
sealed class SearchCepState {}

final class SearchCepInitial extends SearchCepState {}

class SearchCepErrorState extends SearchCepState {
  final String message;

  SearchCepErrorState({required this.message});
}

class SearchCepSucessState extends SearchCepState {
  final Map data;

  SearchCepSucessState({required this.data});
}

class SearchCepLoadingState extends SearchCepState {
  SearchCepLoadingState();
}


