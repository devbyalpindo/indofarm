part of 'pages.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
      builder: (_, pageState) =>
      
      (pageState is OnSplashPage)
      ? SplashPage() 
      : (pageState is OnLoginPage)
      ? LoginPage() 
      : (pageState is OnRegisterPage) 
      ? RegisterPage() 
      : (pageState is OnMainPage)
      ? MainPage(bottomNavBarIndex: pageState.bottomNavBarIndex)
      : Container()
    );
  }
} 