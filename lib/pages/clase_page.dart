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
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sed dolor vitae felis tempus consequat. Integer accumsan convallis tellus vitae ultrices. Vivamus maximus non mauris et porta. In id pharetra nibh, non mollis nunc. Nulla in interdum quam. Ut maximus ante nec turpis fermentum fringilla. Morbi laoreet ac dolor eu ornare. Vestibulum eu diam massa.\n\nPhasellus efficitur elit eu metus elementum dignissim. Phasellus nec arcu ex. Proin a placerat elit. Proin vehicula laoreet eros, sit amet congue purus hendrerit vitae. Aliquam eget nunc ligula. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus suscipit mauris eget dolor pellentesque, id sodales eros pharetra. Vivamus vitae imperdiet nisi. Curabitur et est vel eros elementum posuere. Nullam id risus at est egestas tincidunt non luctus nisi. Vestibulum venenatis enim eget posuere ultrices. Etiam ac libero vitae nulla condimentum gravida vel et tortor.\n\nVestibulum vel gravida augue. Fusce bibendum, tortor eget interdum facilisis, ante lorem vehicula turpis, cursus feugiat arcu mi quis lorem. Phasellus rhoncus porttitor velit faucibus tristique. Nunc elementum, lorem nec convallis dapibus, purus est egestas metus, eget venenatis ligula justo at tortor. Sed consectetur, leo vitae facilisis maximus, enim nunc faucibus lacus, sed tincidunt nulla orci elementum augue. Praesent ut interdum dolor. Quisque consectetur odio vel velit tempor congue. Vivamus tincidunt justo ut dolor maximus pharetra vitae fermentum ligula. Vestibulum eu hendrerit turpis. Aliquam feugiat neque id risus molestie sagittis. Curabitur ac commodo quam. Donec at massa eget turpis cursus elementum non ac risus. In ipsum tellus, finibus quis auctor a, pulvinar sit amet nibh. Pellentesque vehicula, lorem ac aliquet vehicula, lacus arcu tempus enim, in finibus nunc lorem sit amet sapien. Nullam congue pulvinar risus, in elementum metus placerat at.",
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
      child: Text("It's rainy here"),
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
      height: size.height * 0.3,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.60,
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
        ],
      ),
    );
  }
}
