import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:indofarm/model/model.dart';
import 'package:indofarm/services/services.dart';

part 'galery_event.dart';
part 'galery_state.dart';

class GaleryBloc extends Bloc<GaleryEvent, GaleryState> {
  GaleryBloc() : super(GaleryInitial());

  @override
  Stream<GaleryState> mapEventToState(
    GaleryEvent event,
  ) async* {
    if (event is FetchGalery) {
      List<GaleryModel> galery = await GaleryServices.getGalery();

      yield GaleryLoaded(galery);
    }
  }
}
