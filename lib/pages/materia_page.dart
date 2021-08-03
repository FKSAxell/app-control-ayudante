import 'package:app_control_ayudante/controllers/materias_facultad_controller.dart';
import 'package:app_control_ayudante/controllers/sesion_registrada_controller.dart';
import 'package:app_control_ayudante/helpers/sliver_persisten_header.dart';
import 'package:app_control_ayudante/models/ayudantia_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MateriaPage extends StatefulWidget {
  const MateriaPage({Key? key}) : super(key: key);

  @override
  State<MateriaPage> createState() => _MateriaPageState();
}

class _MateriaPageState extends State<MateriaPage> {
  @override
  Widget build(BuildContext context) {
    final matFacCtrl = Get.find<MateriasFacultadController>();
    final List<String?> argumentos = Get.arguments;
    final sesRegCtrl = Get.put(SesionRegistradaController());
    return Scaffold(
      backgroundColor: Color(0xffE5E9F2),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color(0xff243165),
            backwardsCompatibility: true,
            elevation: 0,
            pinned: true,
            expandedHeight: 160.0,
            actions: [
              Obx(() => (matFacCtrl.loading.value)
                  ? IconButton(
                      onPressed: () async => {
                            await matFacCtrl
                                .setEstadoMateriaRegistarada(argumentos[0]!)
                          },
                      icon: Icon((matFacCtrl.favorito.value)
                          ? Icons.star
                          : Icons.star_outline))
                  : Container())
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                argumentos[1]!,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              minHeight: 120,
              maxHeight: 120,
              child: Container(
                color: Color(0xff243165),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: TopAyudante(
                        imagen: Icon(Icons.person),
                        nombre: "Plata 2",
                        calificacion: "4.9",
                        color: Color(0xffbfc1c1),
                        radius: 25,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: TopAyudante(
                        imagen: Icon(Icons.person),
                        nombre: "Oro 1",
                        calificacion: "5.0",
                        color: Color(0xffffbf00),
                        radius: 25,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: TopAyudante(
                        imagen: Icon(Icons.person),
                        nombre: "Bronce 3",
                        calificacion: "4.8",
                        color: Color(0xff9c5221),
                        radius: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => (matFacCtrl.loading.value)
                ? (matFacCtrl.ayudantes.isNotEmpty)
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            Ayudantia ayudante = matFacCtrl.ayudantes[index];
                            return ListTile(
                              onTap: () {
                                sesRegCtrl.obtenerEstadoSesiones(ayudante);

                                Get.toNamed("ayudante", arguments: ayudante);
                              },
                              title: Text(
                                ayudante.usuario!.nombre!,
                                style: TextStyle(
                                  color: Color(0xff47525E),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                (ayudante.avg == null)
                                    ? "⭐ -"
                                    : "⭐ " + ayudante.avg.toString(),
                                style: TextStyle(
                                  color: Color(0xff72777B),
                                ),
                              ),
                              trailing: Text(
                                "8:30",
                                style: TextStyle(
                                  color: Color(0xff47525E),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.blue,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Icon(Icons.person),
                                ),
                              ),
                            );
                          },
                          childCount: matFacCtrl.ayudantes.length,
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) => Container(
                                  height: 300,
                                  child: Center(
                                    child: Text(
                                      "No hay ayudantes...\nAsí de difícil es la materia 😢",
                                      style: TextStyle(fontSize: 20),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                ),
                            childCount: 1),
                      )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) =>
                            LinearProgressIndicator(
                              backgroundColor: Color(0xffE5E9F2),
                              color: Color(0xff243165),
                            ),
                        childCount: 1),
                  ),
          ),
        ],
      ),
    );
  }
}

class TopAyudante extends StatelessWidget {
  const TopAyudante({
    Key? key,
    required this.imagen,
    required this.nombre,
    required this.calificacion,
    required this.color,
    required this.radius,
  }) : super(key: key);
  final Widget imagen;
  final String nombre;
  final String calificacion;
  final Color color;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                spreadRadius: 2,
                offset: Offset(0, 0),
                color: this.color,
              )
            ],
          ),
          child: CircleAvatar(
            radius: this.radius,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: this.imagen,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          this.nombre,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 20,
              color: this.color,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              this.calificacion,
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    );
  }
}
