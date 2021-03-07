part of 'dictionary_bloc.dart';

abstract class DictionaryState extends Equatable {
  const DictionaryState();
}

class DictionaryInitial extends DictionaryState {
  @override
  List<Object> get props => [];
}

class DictionaryLoaded extends DictionaryState{
  final List<DictionaryModel> dictionary;

  DictionaryLoaded(this.dictionary);

  @override
  List<Object> get props => [dictionary];
}