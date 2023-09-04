part of 'search_cep_bloc.dart';

@immutable
sealed class SearchCepEvent {}

class AddSearchCepEvent extends SearchCepEvent{
  final String cep;

  AddSearchCepEvent({required this.cep});
}