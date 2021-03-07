part of 'pages.dart';

class DetailImagePage extends StatelessWidget {
  final GaleryModel images;

  DetailImagePage(this.images);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage(bottomNavBarIndex: 0));
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: mainColor,
            ),
            SafeArea(
              child: Container(
                color: Colors.white,
              ),
            ),
            ListView(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        // BACKDROP
                        Stack(
                          children: [
                            Container(
                              height: 270,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(images.image),
                                ),
                              ),
                            ),
                            Container(
                              height: 271,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0, 1),
                                  end: Alignment(0, 0.06),
                                  colors: [
                                    Colors.white,
                                    Colors.white.withOpacity(0),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        // BACK ICON
                        Container(
                          margin: EdgeInsets.only(
                            top: 20,
                            left: defaultMargin,
                          ),
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black.withOpacity(0.04),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<PageBloc>()
                                  .add(GoToMainPage(bottomNavBarIndex: 0));
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 16, defaultMargin, 6),
                      child: Text(
                        images.name,
                        textAlign: TextAlign.center,
                        style: blackFont.copyWith(fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 0, defaultMargin, 30),
                      child: Text(
                        images.description,
                        style: greyFont.copyWith(
                          height: 1.42,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
