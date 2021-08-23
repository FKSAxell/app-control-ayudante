part of 'widgets.dart';

class AyudanteEnClase extends StatelessWidget {
  final Clase clase;
  const AyudanteEnClase({
    Key? key,
    required this.clase,
    this.pulse: 15,
    this.radius: 20,
    this.width: 45,
    this.padding: 8,
    this.widthContainer: 35,
    this.heightContainer: 13,
    this.fontSize: 10,
    this.showText: true,
  }) : super(key: key);
  final double pulse;
  final double radius;
  final double width;
  final double padding;
  final double widthContainer;
  final double heightContainer;
  final double fontSize;
  final bool showText;

  @override
  Widget build(BuildContext context) {
    final enClase = clase.enClase!;
    final opacity = enClase ? 0.6 : 0.0;
    final subOpacity = enClase ? 0.4 : 0.0;
    Random random = new Random();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: this.padding),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Pulse(
                child: CircleAvatar(
                  radius: this.pulse,
                  backgroundColor: Color(0xffe84da6).withOpacity(opacity),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(),
                  ),
                ),
                infinite: true,
                duration: Duration(milliseconds: 2000),
              ),
              Container(
                width: this.width,
                child: CircleAvatar(
                  radius: this.radius,
                  backgroundColor: colors[random.nextInt(8)],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xffe84da6).withOpacity(subOpacity),
                    width: 2.0,
                  ),
                ),
              ),
              enClase
                  ? Positioned(
                      bottom: 0,
                      child: Container(
                        width: this.widthContainer, //35
                        height: this.heightContainer, //13
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffe84da6).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "CLASE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: this.fontSize, //10
                            fontWeight: FontWeight.bold,
                            fontFamily: "norwester",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          SizedBox(
            height: 5,
          ),
          this.showText
              ? Flexible(
                  child: Container(
                    alignment: Alignment.center,
                    width: 80,
                    child: Text(
                      this.clase.sesion!.ayudantia!.usuario!.nombre!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
