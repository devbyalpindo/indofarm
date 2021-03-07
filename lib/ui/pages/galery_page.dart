part of 'pages.dart';

class GaleryPage extends StatefulWidget {
  @override
  _GaleryPageState createState() => _GaleryPageState();
}

class _GaleryPageState extends State<GaleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Galeri Peternakan"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.redAccent),
            onPressed: () {
              AuthServices.signOut();
              context.read<PageBloc>().add(GoToLoginPage());
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
              bottom: deviceHeight(context) * 0.1),
          child:
              BlocBuilder<GaleryBloc, GaleryState>(builder: (_, galeriState) {
            if (galeriState is GaleryLoaded) {
              List<GaleryModel> galery = galeriState.galery;
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: galery.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<PageBloc>()
                            .add(GoToImageDetailPage(galery[index]));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(galery[index].image),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return SpinKitFadingCircle(color: yellowColor1);
            }
          }),
        ),
      ),
    );
  }
}
