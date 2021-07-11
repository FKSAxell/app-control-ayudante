part of 'widgets.dart';

class Boton extends StatelessWidget {
  final Widget text;
  final Function? onPressed;
  final int color;
  const Boton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: StadiumBorder(),
        // primary: Color(0xff0D47A1),
        primary: Color(color),
      ),
      child: Container(
        height: 55,
        width: double.infinity,
        child: Center(child: this.text),
      ),
      onPressed: this.onPressed as void Function()?,
    );
  }
}
