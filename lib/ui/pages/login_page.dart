part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

bool isSignIn = false;

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
                        icons: Icon(Icons.alternate_email),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "Type your email",
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
                      child: (isSignIn)
                          ? SpinKitFadingCircle(color: yellowColor1)
                          : ButtonWidget(
                              "Masuk",
                              width: deviceWidth(context),
                              height: deviceHeight(context) * 0.07,
                              color: yellowColor1,
                              topLeft: 20,
                              topRight: 20,
                              bottomLeft: 20,
                              bottomRight: 20,
                              onPressed: () async {
                                if (!(_emailController.text.trim() != "" &&
                                    _passwordController.text.trim() != "")) {
                                  Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Colors.redAccent,
                                    message: "Please fill all the fields",
                                  )..show(context);
                                } else if (!EmailValidator.validate(
                                    _emailController.text.trim())) {
                                  Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Colors.redAccent,
                                    message: "Please enter valid email",
                                  )..show(context);
                                } else {
                                  setState(() {
                                    isSignIn = true;
                                  });

                                  ResponseHandler result =
                                      await AuthServices.signIn(
                                    Auth(
                                        email: _emailController.text,
                                        password: _passwordController.text),
                                  );

                                  print(result.message);

                                  if (result.user != null) {
                                    context
                                        .read<PageBloc>()
                                        .add(GoToMainPage());
                                    
                                    setState(() {
                                      isSignIn = false;
                                    });
                                  } else {
                                    setState(() {
                                      isSignIn = false;
                                    });

                                    Flushbar(
                                      duration: Duration(milliseconds: 1500),
                                      flushbarPosition: FlushbarPosition.TOP,
                                      backgroundColor: Colors.redAccent,
                                      message: result.message,
                                    )..show(context);


                                  }
                                }
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
                            onTap: () {
                              context.read<PageBloc>().add(GoToRegisterPage());
                            },
                            child: Text("Daftar",
                                style: yellowFont.copyWith(
                                    fontSize: 15, fontWeight: FontWeight.bold)))
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
