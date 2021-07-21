import 'package:app_control_ayudante/controllers/registros_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_control_ayudante/controllers/user_controller.dart';
import 'package:get/get.dart';

class EstudiantePage extends StatelessWidget {
  const EstudiantePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.find<UserController>();
    final regCtrl = Get.find<RegistrosController>();
    // Obx(
    //   () =>
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
                child: (regCtrl.registros.length != 0)
                    ? Obx(() => ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: regCtrl.registros.length,
                        itemBuilder: (context, index) {
                          List<BoxMateria> boxs = [
                            ...regCtrl.registros[index].map((e) => BoxMateria(
                                  text: e.materia.nombre,
                                ))
                          ];
                          return MateriaRow(
                            materias: boxs,
                          );
                        }))
                    : Center(
                        child: Container(
                          child: Text("Registrate en Materias"),
                        ),
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
                  userCtrl.usuario.value!.nombre,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Text(
                  (userCtrl.usuario.value!.carrera != null)
                      ? userCtrl.usuario.value!.carrera!.nombre
                      : "No tiene Carrera",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                Text(
                  (userCtrl.usuario.value!.carrera != null)
                      ? userCtrl.usuario.value!.carrera!.facultad.codigo
                      : "No Tiene Facultad",
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

class MateriaRow extends StatelessWidget {
  final List<BoxMateria> materias;
  const MateriaRow({
    Key? key,
    required this.materias,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: materias,
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
