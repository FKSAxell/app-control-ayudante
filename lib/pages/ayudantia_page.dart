import 'package:flutter/material.dart';

class AyudantiaPage extends StatelessWidget {
  const AyudantiaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Color(0xff243165),
      child: Stack(
        children: [
          Container(
            height: size.height * 0.3,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Materias",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
                Container(
                  child: Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Color(0xff8190A5),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Buscar Materia...",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff8190A5)),
                        ),
                      ],
                    ),
                  ),
                  width: size.width * 0.8,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 75,
                  // color: Colors.red,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children: [
                      AyudanteEnClase(),
                      AyudanteEnClase(),
                      AyudanteEnClase(),
                      AyudanteEnClase(),
                      AyudanteEnClase(),
                      AyudanteEnClase(),
                      AyudanteEnClase(),
                      AyudanteEnClase(),
                      AyudanteEnClase(),
                      AyudanteEnClase(),
                      AyudanteEnClase(),
                      AyudanteEnClase(),
                      AyudanteEnClase(),
                      AyudanteEnClase(),
                      AyudanteEnClase(),
                      AyudanteEnClase(),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.6,
              minChildSize: 0.6,
              expand: false,
              builder: (_, controller) {
                return Container(
                    decoration: BoxDecoration(
                      color: Color(0xffE5E9F2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: size.width * 0.2,
                          height: 3,
                          color: Color(0xff243165),
                        ),
                        Container(
                          height: 60,
                          // color: Colors.red,
                          child: ListView.builder(
                              // shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: 6,
                              // controller: controller, // set this too
                              itemBuilder: (_, i) {
                                return Row(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(45),
                                        color: Colors.amberAccent,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: 30,
                            controller: controller, // set this too
                            itemBuilder: (_, i) =>
                                ListTile(title: Text('Item $i')),
                          ),
                        ),
                      ],
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}

class AyudanteEnClase extends StatelessWidget {
  const AyudanteEnClase({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.yellow,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(image: AssetImage("assets/test/axell.jpg")),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Axell C.",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
