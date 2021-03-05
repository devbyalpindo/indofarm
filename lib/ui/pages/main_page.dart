part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int bottomNavBarIndex;

  MainPage({this.bottomNavBarIndex});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    // _loadData();

    bottomNavBarIndex = widget.bottomNavBarIndex;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  bottomNavBarIndex = index;
                });
              },
              children: <Widget>[
                HomePage(),
                GaleryPage(),
                DictionaryPage(),
                NewsPage(),
                // HomePage(tabBarIndex: 0),
                // GaleryPage(tabBarIndex: 0),
                // DictionaryPage(),
                // NewsPage(),
              ],
            ),
            customBottomNavbar(),
          ],
        ),
      ),
    );
  }

  Widget customBottomNavbar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 60,
        color: mainColor,
        child: BottomNavyBar(
          selectedIndex: bottomNavBarIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) => setState(() {
            bottomNavBarIndex = index;
            pageController.jumpToPage(index);
          }),
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.home, color: mainColor),
              title: Text(
                'Dashboard',
                style: purpleFont.copyWith(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
              activeColor: yellowColor1,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.insert_photo, color: mainColor),
              title: Text(
                'Galeri',
                style: purpleFont.copyWith(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
              activeColor: yellowColor1,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.auto_stories, color: mainColor),
              title: Text(
                'Kamus',
                style: purpleFont.copyWith(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
              activeColor: yellowColor1,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.article, color: mainColor),
              title: Text(
                'Berita',
                style: purpleFont.copyWith(
                    fontSize: 15, fontWeight: FontWeight.bold),
              ),
              activeColor: yellowColor1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
