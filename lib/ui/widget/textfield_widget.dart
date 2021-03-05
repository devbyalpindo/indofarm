part of 'widget.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final Icon icons;
  final TextEditingController controller;
  final Function onChanged;
  final bool obscureText;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;

  TextFieldWidget({
    this.hintText,
    this.icons,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType,
          style: blackFont.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            fillColor: purpleColor,
            filled: true,
            prefixIcon: icons,
            contentPadding: EdgeInsets.all(10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: purpleColor),
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: hintText,
            hintStyle:
                greyFont2.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
          ),
          inputFormatters: inputFormatters,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
