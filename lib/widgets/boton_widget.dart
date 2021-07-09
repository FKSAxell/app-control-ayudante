part of 'widgets.dart';

class Boton extends StatelessWidget {
  final Widget text;
  final Function? onPressed;

  const Boton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shape: StadiumBorder(),
        // primary: Color(0xff0D47A1),
        primary: Color(0xff243165),
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
