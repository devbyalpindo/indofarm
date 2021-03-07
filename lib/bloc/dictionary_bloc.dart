import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:indofarm/model/model.dart';
import 'package:indofarm/services/services.dart';

part 'dictionary_event.dart';
part 'dictionary_state.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  DictionaryBloc() : super(DictionaryInitial());

  @override
  Stream<DictionaryState> mapEventToState(
    DictionaryEvent event,
  ) async* {
    if (event is FetchDictionary) {
      List<DictionaryModel> dictionary = await DictionaryServices.getDictionary();

      yield DictionaryLoaded(dictionary);
    }
  }
}
