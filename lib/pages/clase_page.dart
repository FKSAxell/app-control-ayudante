import 'package:animate_do/animate_do.dart';
import 'package:app_control_ayudante/models/ayudantia_model.dart';
import 'package:app_control_ayudante/models/clase_model.dart';
import 'package:app_control_ayudante/models/materia_model.dart';
import 'package:app_control_ayudante/models/sesion_model.dart';
import 'package:app_control_ayudante/models/ubicacion_model.dart';
import 'package:app_control_ayudante/models/usuario_model.dart';
import 'package:app_control_ayudante/widgets/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClasePage extends StatefulWidget {
  const ClasePage({Key? key}) : super(key: key);

  @override
  _ClasePageState createState() => _ClasePageState();
}

class _ClasePageState extends State<ClasePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    //TODO: Ejemplo de una clase
    final Clase clase = new Clase(
      id: "1",
      tema: "Variables y Tipos de datos",
      descripcion:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dolor vitae felis tempus consequat. Integer accumsan convallis tellus vitae ultrices. Vivamus maximus non mauris et porta. In id pharetra nibh, non mollis nunc. Nulla in interdum quam. Ut maximus ante nec turpis fermentum fringilla. Morbi laoreet ac dolor eu ornare. Vestibulum eu diam massa.",
      enlace: "https://www.youtube.com/piogram",
      enClase: true,
      ubicacion: new Ubicacion(
        id: "1",
        codigo: "YT",
        nombre: "Youtube",
      ),
      sesion: new Sesion(
        dia: 1,
        horaInicio: 9,
        minutoInicio: 0,
        horaFin: 11,
        minutoFin: 0,
        ayudantia: new Ayudantia(
          materia: new Materia(
            nombre: "Fundamentos de Programación",
            codigo: "CCPG1043",
          ),
          usuario: new Usuario(
            email: "joealalv@espol.edu.ec",
            nombre: "Joel Alejandro Alvarado Jimenez",
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(clase.sesion!.ayudantia!.materia!.nombre!),
      ),
      body: Container(
        color: context.theme.scaffoldBackgroundColor,
        child: Column(
          children: [
            HeaderClase(clase: clase),
            Tabs(tabController: _tabController),
            Body(
              tabController: _tabController,
              clase: clase,
            ),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required TabController tabController,
    required this.clase,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final Clase clase;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: context.theme.backgroundColor,
        child: TabBarView(
          controller: _tabController,
          children: [
            Descripcion(clase: clase),
            Recursos(clase: clase),
          ],
        ),
      ),
    );
  }
}

class Recursos extends StatelessWidget {
  const Recursos({
    Key? key,
    required this.clase,
  }) : super(key: key);
  final Clase clase;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("No hay recursos"),
    );
  }
}

class Descripcion extends StatelessWidget {
  const Descripcion({
    Key? key,
    required this.clase,
  }) : super(key: key);
  final Clase clase;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Horario',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Divider(),
          Text("Hoy, 23 de Agosto"),
          SizedBox(
            height: 20,
          ),
          Text(
            'Descripción',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Divider(),
          Text(
            clase.descripcion!,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

class Tabs extends StatelessWidget {
  const Tabs({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE5E9F2),
      child: TabBar(
        controller: _tabController,
        indicatorColor: context.theme.primaryColor,
        tabs: const <Widget>[
          Tab(
            child: Text(
              "Información",
              style: TextStyle(
                color: Color(0xff47525E),
                fontSize: 16,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Recursos",
              style: TextStyle(
                color: Color(0xff47525E),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderClase extends StatelessWidget {
  const HeaderClase({
    Key? key,
    required this.clase,
  }) : super(key: key);
  final Clase clase;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: context.theme.primaryColor,
      width: double.infinity,
      height: size.height * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.45,
                  height: size.height * 0.15,
                  child: AutoSizeText(
                    clase.tema!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 4,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.3,
                height: size.height * 0.13,
                child: Center(
                  child: FadeIn(
                    child: AyudanteEnClase(
                      clase: clase,
                      width: 90,
                      radius: 40,
                      pulse: 30,
                      heightContainer: 26,
                      widthContainer: 70,
                      fontSize: 15,
                      showText: false,
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.30,
                height: size.height * 0.10,
                child: AutoSizeText(
                  clase.sesion!.ayudantia!.usuario!.nombre!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
