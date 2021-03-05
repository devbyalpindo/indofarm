part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: mainColor,
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: deviceHeight(context) * 0.05,
            ),
            Center(
                child: Image.asset('assets/sapi.png', width: 268, height: deviceHeight(context) * 0.32 )),
            SizedBox(height: deviceHeight(context) * 0.07),
            Center(
              child: Text("Berternak Jadi Lebih Mudah",
                  style: whiteFont.copyWith(fontSize: 22)),
            ),
            SizedBox(height: deviceHeight(context) * 0.01),
            Center(
              child: Text(
                "Dapatkan semua tentang cara beternak,\n berita perternakan dan semua tentang\n peternakan dari 1 aplikasi !",
                textAlign: TextAlign.center,
                style: greyFont.copyWith(fontSize: 14),
              ),
            ),
            SizedBox(height: deviceHeight(context) * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonWidget(
                  "Masuk",
                  width: deviceWidth(context) * 0.70,
                  height: deviceHeight(context) * 0.07,
                  color: yellowColor1,
                  topLeft: 20,
                  topRight: 0,
                  bottomLeft: 20,
                  bottomRight: 0,
                  onPressed: () {
                    context.read<PageBloc>().add(GoToLoginPage());
                  },
                ),
              ]
            ),
            SizedBox(height: deviceHeight(context) * 0.06),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ButtonWidget(
                  "Daftar",
                  width: deviceWidth(context) * 0.70,
                  height: deviceHeight(context) * 0.07,
                  color: yellowColor1,
                  topLeft: 0,
                  topRight: 20,
                  bottomLeft: 0,
                  bottomRight: 20,
                  onPressed: () {
                    context.read<PageBloc>().add(GoToRegisterPage());
                  },
                ),
              ]
            ),
            
          ]),
        ),
      ),
    );
  }
}
