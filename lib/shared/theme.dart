part of 'shared.dart';


const double defaultMargin = 24;

double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;

Color mainColor = Color(0xFF2D398D);
Color yellowColor1 = Color(0xFFFFA200);
Color yellowColor2 = Color(0xFFEDB900);
Color purpleColor = Color(0xFFA4AFFF);

TextStyle whiteFont = TextStyle(
  fontFamily: "Poppins",
  color: Colors.white,
);

TextStyle yellowFont = TextStyle(
  fontFamily: "Poppins",
  color: yellowColor1,
);

TextStyle greyFont = TextStyle(
  fontFamily: "Poppins",
  color: Color(0xFFB5B5B5),
);

TextStyle purpleFont = TextStyle(
  fontFamily: "Poppins",
  color: mainColor,
);

TextStyle blackFont = TextStyle(
  fontFamily: "Poppins",
  color: Colors.black,
);

TextStyle greyFont2 = TextStyle(
  fontFamily: "Poppins",
  color: Colors.black45,
);


