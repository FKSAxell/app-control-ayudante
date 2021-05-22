part of 'widgets.dart';

class Boton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const Boton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: StadiumBorder(),
        primary: Color(0xff0D47A1),
      ),
      child: Container(
        height: 55,
        width: double.infinity,
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}
