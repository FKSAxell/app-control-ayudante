part of 'widgets.dart';

class Etiqueta extends StatelessWidget {
  final String ruta;
  final String mensaje;
  final String textVinculo;

  const Etiqueta(
      {Key? key,
      required this.ruta,
      required this.mensaje,
      required this.textVinculo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            this.mensaje,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Get.offAllNamed(this.ruta);

              //Navigator.pushReplacementNamed(context, this.ruta);
            },
            child: Text(
              this.textVinculo,
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
