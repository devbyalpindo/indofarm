part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

TextEditingController _usernameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColor,
          ),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Column(
                        children: [
                          SizedBox(height: deviceHeight(context) * 0.06),
                          Image.asset(
                            'assets/sapi2.png',
                            width: deviceWidth(context),
                            height: deviceHeight(context) * 0.30,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.1,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: TextFieldWidget(
                        icons: Icon(Icons.perm_identity),
                        controller: _usernameController,
                        hintText: "Type your username",
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: TextFieldWidget(
                        icons: Icon(Icons.lock),
                        obscureText: true,
                        controller: _passwordController,
                        hintText: "Type your password",
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.05,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: ButtonWidget(
                        "Masuk",
                        width: deviceWidth(context),
                        height: deviceHeight(context) * 0.07,
                        color: yellowColor1,
                        topLeft: 20,
                        topRight: 20,
                        bottomLeft: 20,
                        bottomRight: 20,
                        onPressed: () {
                          context.read<PageBloc>().add(GoToMainPage());
                        },
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Belum punya akun ?  ",
                          style: whiteFont.copyWith(fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: (){
                            context.read<PageBloc>().add(GoToRegisterPage());
                          },
                          child: Text("Daftar", style: yellowFont.copyWith(fontSize: 15, fontWeight: FontWeight.bold))
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
