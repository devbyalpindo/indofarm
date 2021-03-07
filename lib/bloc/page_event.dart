part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRegisterPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  final bottomNavBarIndex;

  GoToMainPage({this.bottomNavBarIndex = 0});

  @override
  List<Object> get props => [bottomNavBarIndex];
}

class GoToNewsDetailPage extends PageEvent {
  final NewsModel news;

  GoToNewsDetailPage(this.news);

  @override
  List<Object> get props => [news];
}

class GoToImageDetailPage extends PageEvent {
  final GaleryModel galery;

  GoToImageDetailPage(this.galery);

  @override
  List<Object> get props => [galery];
}