import 'package:flutter/material.dart';

class EstudiantePage extends StatelessWidget {
  const EstudiantePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xffE5E9F2),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Color(0xff243165),
                height: size.height * 0.35,
              ),
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BoxMateria(
                            text: "Fundamentos de Programación",
                            color: Color(0xfffd79a8),
                          ),
                          BoxMateria(
                            text: "Algebra Lineal",
                            color: Color(0xff2ecc71),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BoxMateria(
                            text: "Física I",
                            color: Color(0xff9b59b6),
                          ),
                          BoxMateria(
                            text: "Biología",
                            color: Color(0xffe67e22),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BoxMateria(
                            text: "Química",
                            color: Color(0xffe74c3c),
                          ),
                          BoxMateria(
                            text: "Ecología",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BoxMateria(
                            text: "Ecuaciones Diferenciales",
                            color: Color(0xfff1c40f),
                          ),
                          BoxMateria(
                            text: "Cálculo I",
                            color: Color(0xff34495e),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: size.height * 0.40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.yellow,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(55),
                        child:
                            Image(image: AssetImage("assets/test/axell.jpg")),
                      )
                      // FlutterLogo(
                      //   size: 50,
                      // ),
                      ),
                ),
                Text(
                  "Axell Concha",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "Computación",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "FIEC",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "54",
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xff343F4B),
                            ),
                          ),
                          Icon(
                            Icons.class__outlined,
                            color: Colors.yellow[600],
                            size: 25,
                          )
                        ],
                      ),
                      Text(
                        "Asistencias",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff5A6978),
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.5),
                    //     spreadRadius: 1,
                    //     blurRadius: 1,
                    //     offset: Offset(0, 1), // changes position of shadow
                    //   ),
                    // ],
                  ),
                  width: size.width * 0.50,
                  height: size.height * 0.10,

                  // child:,
                )
              ],
            ),
          ),
          // Container(
          //   color: Colors.grey,
          // )
        ],
      ),
    );
  }
}

class BoxMateria extends StatelessWidget {
  final Color color;
  final String text;
  const BoxMateria({
    Key? key,
    this.color: Colors.blue,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.40,
      height: 100,
      //TODO: OJO con la clase Material
      child: Material(
        color: this.color,
        child: InkWell(
          child: Center(
            child: Text(
              this.text,
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          onTap: () {
            print("Materia ${this.text}");
          },
        ),
      ),
    );
  }
}
