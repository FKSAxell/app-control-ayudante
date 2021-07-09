part of 'widgets.dart';

class Logo extends StatelessWidget {
  final String titulo;

  const Logo({Key? key, required this.titulo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        width: 170,
        child: Column(
          children: [
            // Image(image: AssetImage('assets/logos/tag-logo.png')),
            SvgPicture.asset(
              'assets/logos/turtle1.svg',
              color: Color(0xff243165),
              width: 150,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.titulo,
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
