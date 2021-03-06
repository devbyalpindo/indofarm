part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}


class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnRegisterPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  final bottomNavBarIndex;

  OnMainPage({this.bottomNavBarIndex = 0});

  @override
  List<Object> get props => [bottomNavBarIndex];
}

class OnNewsDetailPage extends PageState {
  final NewsModel news;

  OnNewsDetailPage(this.news);

  @override
  List<Object> get props => [news];
}

class OnImageDetailPage extends PageState {
  final GaleryModel galery;

  OnImageDetailPage(this.galery);

  @override
  List<Object> get props => [galery];
}