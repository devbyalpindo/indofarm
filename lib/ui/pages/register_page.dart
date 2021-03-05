part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();

bool isSignUp = false;

class _RegisterPageState extends State<RegisterPage> {
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
                            'assets/kuda.png',
                            width: deviceWidth(context),
                            height: deviceHeight(context) * 0.25,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: TextFieldWidget(
                        icons: Icon(Icons.perm_identity),
                        controller: nameController,
                        hintText: "Type your username",
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: TextFieldWidget(
                        icons: Icon(Icons.alternate_email_rounded),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "Type your Email",
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: TextFieldWidget(
                        icons: Icon(Icons.mobile_friendly),
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        hintText: "Type your No Handphone",
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
                        controller: passwordController,
                        hintText: "Type your password",
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: (isSignUp)
                          ? SpinKitFadingCircle(color: mainColor)
                          : ButtonWidget(
                              "Daftar",
                              width: deviceWidth(context),
                              height: deviceHeight(context) * 0.07,
                              color: yellowColor1,
                              topLeft: 20,
                              topRight: 20,
                              bottomLeft: 20,
                              bottomRight: 20,
                              onPressed: () async {
                                if (!(nameController.text.trim() != "" &&
                                    emailController.text.trim() != "" &&
                                    passwordController.text.trim() != "" &&
                                    phoneController.text.trim() != "")) {
                                  Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Colors.redAccent,
                                    message: "Please fill all the fields",
                                  )..show(context);
                                } else if (passwordController.text.length < 6) {
                                  Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Colors.redAccent,
                                    message:
                                        "Password's length min 6 characters",
                                  )..show(context);
                                } else if (!EmailValidator.validate(
                                    emailController.text.trim())) {
                                  Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Colors.redAccent,
                                    message: "Please enter valid email",
                                  )..show(context);
                                } else {
                                  setState(() {
                                    isSignUp = true;
                                  });
                                  ResponseHandler result =
                                      await AuthServices.signUp(
                                    Auth(
                                      name: nameController.text,
                                      email: emailController.text,
                                      phoneNumber: phoneController.text,
                                      password: passwordController.text,
                                    ),
                                  );

                                  if (result.user != null) {
                                    context
                                        .read<PageBloc>()
                                        .add(GoToLoginPage());
                                  } else {
                                    setState(() {
                                      isSignUp = false;
                                    });

                                    Flushbar(
                                      duration: Duration(milliseconds: 1500),
                                      flushbarPosition: FlushbarPosition.TOP,
                                      backgroundColor: Colors.redAccent,
                                      message: result.message,
                                    )..show(context);
                                  }
                                }
                                // context.read<PageBloc>().add(GoToLoginPage());
                              },
                            ),
                    ),
                    SizedBox(
                      height: deviceHeight(context) * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sudah punya akun ?  ",
                          style: whiteFont.copyWith(fontSize: 15),
                        ),
                        GestureDetector(
                            onTap: () {
                              context.read<PageBloc>().add(GoToLoginPage());
                            },
                            child: Text("Login",
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
