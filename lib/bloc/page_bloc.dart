import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:indofarm/model/model.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnSplashPage());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToRegisterPage) {
      yield OnRegisterPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage(bottomNavBarIndex: event.bottomNavBarIndex);
    } else if (event is GoToNewsDetailPage) {
      yield OnNewsDetailPage(event.news);
    } else if (event is GoToImageDetailPage) {
      yield OnImageDetailPage(event.galery);
    }
  }
}
