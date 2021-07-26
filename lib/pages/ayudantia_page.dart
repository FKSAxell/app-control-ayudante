import 'package:app_control_ayudante/controllers/materias_facultad_controller.dart';
import 'package:app_control_ayudante/helpers/MyBehavior.dart';

import 'package:app_control_ayudante/models/materias_facultad_response.dart';
import 'package:app_control_ayudante/search/search_delegate.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AyudantiaPage extends StatefulWidget {
  const AyudantiaPage({Key? key}) : super(key: key);

  @override
  _AyudantiaPageState createState() => _AyudantiaPageState();
}

class _AyudantiaPageState extends State<AyudantiaPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final matFacCtrl = Get.find<MateriasFacultadController>();
    final size = MediaQuery.of(context).size;

    return Container(
      color: Color(0xff243165),
      child: Stack(
        children: [
          Container(
            height: size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Materias",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () => showSearch(
                      context: context, delegate: MateriaSearchDelegate()),
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
                    width: size.width * 0.8,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 75,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed("materia"),
                        child: AyudanteEnClase(),
                      ),
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
              initialChildSize: 0.61,
              minChildSize: 0.61,
              expand: false,
              builder: (_, controller) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(0xffE5E9F2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
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
                      SizedBox(
                        height: 15,
                      ),
                      Theme(
                        data: ThemeData(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                        ),
                        child: Obx(
                          () => (matFacCtrl.materiasFacultad.length != 0)
                              ? TabBar(
                                  isScrollable: true,
                                  physics: BouncingScrollPhysics(),
                                  controller: matFacCtrl.tabCtrl,
                                  labelColor: Colors.white,
                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  unselectedLabelColor: Color(0xff47525E),
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Color(0xff243165),
                                  ),
                                  onTap: (value) {},
                                  tabs: matFacCtrl.materiasFacultad
                                      .map(
                                        (facultad) => Tab(
                                          child: Text(
                                            facultad.codigo,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                )
                              : CircularProgressIndicator(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: Obx(
                          () => (matFacCtrl.materiasFacultad.length != 0)
                              ? TabBarView(
                                  controller: matFacCtrl.tabCtrl,
                                  children: matFacCtrl.materiasFacultad
                                      .map(
                                        (facultad) => Materias(
                                          controller: controller,
                                          materias: facultad.materia,
                                        ),
                                      )
                                      .toList(),
                                )
                              : Container(),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class Materias extends StatelessWidget {
  const Materias({
    Key? key,
    required this.controller,
    required this.materias,
  }) : super(key: key);
  final ScrollController controller;
  final List<Materia> materias;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          height: 1,
          thickness: 0.2,
        ),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: materias.length,
        controller: controller,
        itemBuilder: (_, i) {
          return ListTile(
            onTap: () {},
            title: Text('${materias[i].nombre}'),
          );
        },
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
