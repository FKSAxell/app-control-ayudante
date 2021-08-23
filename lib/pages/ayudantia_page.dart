import 'dart:math';

import 'package:app_control_ayudante/controllers/clase_controller.dart';
import 'package:app_control_ayudante/controllers/materias_facultad_controller.dart';
import 'package:app_control_ayudante/helpers/MyBehavior.dart';
import 'package:app_control_ayudante/helpers/colors.dart';
import 'package:app_control_ayudante/helpers/hexcolor.dart';
import 'package:app_control_ayudante/models/clase_model.dart';
import 'package:app_control_ayudante/models/materia_model.dart';
import 'package:animate_do/animate_do.dart';

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
    final claCtrl = Get.find<ClaseController>();
    final size = MediaQuery.of(context).size;

    return Container(
      color: context.theme.primaryColor,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.28,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Materias",
                    style: TextStyle(
                        fontSize: 33,
                        fontFamily: "NeueHansKendrick",
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () => showSearch(
                        context: context, delegate: MateriaSearchDelegate()),
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.search),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Buscar Materia...",
                            style: TextStyle(
                              fontSize: 16,
                              //color: Color(0xff8190A5),
                            ),
                          ),
                        ],
                      ),
                      width: size.width * 0.8,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: context.theme.backgroundColor,
                        border: Border.all(color: Color(0xff666666)),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 75,
                  alignment: Alignment.centerLeft,
                  child: Obx(
                    () => (claCtrl.clases.length != 0)
                        ? ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            padding: const EdgeInsets.all(5.0),
                            children: claCtrl.clases
                                .map(
                                  (clase) => FadeIn(
                                    child: AyudanteEnClase(
                                      clase: clase,
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        : FadeIn(
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: InkWell(
                                onTap: () => showSearch(
                                  context: context,
                                  delegate: MateriaSearchDelegate(),
                                ),
                                child: AgregarMateria(),
                              ),
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.63,
              minChildSize: 0.63,
              expand: false,
              builder: (_, controller) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff2f2f2),
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
                        height: 1,
                        color: Color(0xff000000),
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
                          () => (matFacCtrl.loadingMatFac.value)
                              ? Container(
                                  height: 40,
                                  child: TabBar(
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
                                      color: HexColor(matFacCtrl
                                              .facultadSelect.value.color ??
                                          "5b378d"),
                                    ),
                                    indicatorWeight: 0,
                                    onTap: (value) {
                                      matFacCtrl.facultadSelect.value =
                                          matFacCtrl.materiasFacultad[value];
                                    },
                                    tabs: matFacCtrl.materiasFacultad
                                        .map(
                                          (facultad) => Container(
                                            child: Tab(
                                              child: Text(
                                                facultad.codigo!,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                )
                              : CircularProgressIndicator(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: Obx(
                          () => (matFacCtrl.loadingMatFac.value)
                              ? TabBarView(
                                  controller: matFacCtrl.tabCtrl,
                                  children: matFacCtrl.materiasFacultad
                                      .map(
                                        (facultad) => Materias(
                                          controller: controller,
                                          materias: facultad.materia!,
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

class AgregarMateria extends StatelessWidget {
  const AgregarMateria({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: context.theme.backgroundColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Icon(
            Icons.add,
            color: Color(0xff47525E),
          ),
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
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
    final matFacCtrl = Get.find<MateriasFacultadController>();
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
          return Material(
            color: Colors.transparent,
            child: ListTile(
              onTap: () {
                matFacCtrl.ayudantes.value = [];
                matFacCtrl.favorito.value = false;
                matFacCtrl.obtenerAyudantesPorMateria(materias[i].id!);
                matFacCtrl.obtenerEstadoMateriaRegistarada(materias[i].id!);
                Get.toNamed("materia", arguments: [
                  materias[i].id,
                  materias[i].nombre
                ]); //TODO: Problema de tener varias class Materia1
              },
              title: Text('${materias[i].nombre}'),
            ),
          );
        },
      ),
    );
  }
}

class AyudanteEnClase extends StatelessWidget {
  final Clase clase;
  const AyudanteEnClase({
    Key? key,
    required this.clase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enClase = clase.enClase!;
    final opacity = enClase ? 0.6 : 0.0;
    final subOpacity = enClase ? 0.4 : 0.0;
    Random random = new Random();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Pulse(
                child: CircleAvatar(
                  radius: 15,
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
                width: 45,
                child: CircleAvatar(
                  radius: 20,
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
                        width: 35,
                        height: 13,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffe84da6).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "CLASE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
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
          Flexible(
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
        ],
      ),
    );
  }
}
