part of 'widget.dart';

class ButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Color color;
  final double topLeft;
  final double topRight;
  final double bottomRight;
  final double bottomLeft;
  final Function onPressed;

  ButtonWidget(this.text,
      {this.width,
      this.height,
      this.color,
      this.topLeft,
      this.topRight,
      this.bottomLeft,
      this.bottomRight,
      this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        elevation: 0,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            topRight: Radius.circular(topRight),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
          ),
        ),
        onPressed: () {
          if (onPressed != null) {
            onPressed();
          }
        },
        child: Text(
          text,
          style: purpleFont.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
