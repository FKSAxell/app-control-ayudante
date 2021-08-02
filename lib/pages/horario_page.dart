import 'package:app_control_ayudante/controllers/sesion_controller.dart';
import 'package:app_control_ayudante/helpers/dia.dart';
import 'package:app_control_ayudante/models/sesion_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorarioPage extends StatefulWidget {
  @override
  _HorarioPageState createState() => _HorarioPageState();
}

class _HorarioPageState extends State<HorarioPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final sesCtrl = Get.find<SesionController>();
    // Find first date and last date of THIS WEEK
    DateTime today = DateTime.now();
    int lunes = findFirstDateOfTheWeek(today).day;
    // print(findLastDateOfTheWeek(today));

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                "Julio",
                style: TextStyle(
                  color: Color(0xff47525E),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Theme(
                data: ThemeData(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                ),
                child: Obx(
                  () => (sesCtrl.loading.value)
                      ? TabBar(
                          isScrollable: true,
                          physics: BouncingScrollPhysics(),
                          controller: sesCtrl.tabCtrl,
                          labelColor: Colors.white,
                          labelStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelColor: Color(0xff47525E),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              25.0,
                            ),
                            color: Color(0xff243165),
                          ),
                          tabs: <Widget>[
                            Tab(
                              child: Text((lunes).toString()),
                              icon: Text("Lun"),
                            ),
                            Tab(
                              child: Text((lunes + 1).toString()),
                              icon: Text("Mar"),
                            ),
                            Tab(
                              child: Text((lunes + 2).toString()),
                              icon: Text("Mie"),
                            ),
                            Tab(
                              child: Text((lunes + 3).toString()),
                              icon: Text("Juv"),
                            ),
                            Tab(
                              child: Text((lunes + 4).toString()),
                              icon: Text("Vie"),
                            ),
                            Tab(
                              child: Text((lunes + 5).toString()),
                              icon: Text("Sab"),
                            ),
                            Tab(
                              child: Text((lunes + 6).toString()),
                              icon: Text("Dog"),
                            ),
                          ],
                        )
                      : Container(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Obx(
            () => (sesCtrl.loading.value)
                ? TabBarView(
                    controller: sesCtrl.tabCtrl,
                    children: sesCtrl.sesiones
                        .map((sesiones) => Dia(sesiones: sesiones.sesion))
                        .toList(),
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        )
      ],
    );
  }
}

class Dia extends StatelessWidget {
  const Dia({
    Key? key,
    required this.sesiones,
  }) : super(key: key);
  final List<Sesion> sesiones;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE5E9F2),
      child: ListView.builder(
        itemCount: sesiones.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Clase(
            sesion: sesiones[index],
          );
        },
      ),
    );
  }
}

class Clase extends StatelessWidget {
  const Clase({
    Key? key,
    required this.sesion,
  }) : super(key: key);
  final Sesion sesion;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: ListTile(
        onTap: () {},
        title: Text(
          sesion.ayudantia!.materia!.nombre!,
          style: TextStyle(
            color: Color(0xff47525E),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          sesion.ayudantia!.usuario!.nombre!,
          style: TextStyle(
            color: Color(0xff72777B),
          ),
        ),
        trailing: Text(
          "${sesion.horaInicio}:${sesion.minutoInicio}",
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
      ),
    );
  }
}
