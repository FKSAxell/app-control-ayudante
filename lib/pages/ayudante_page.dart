import 'package:app_control_ayudante/helpers/dia.dart';
import 'package:app_control_ayudante/models/ayudantia_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyudantePage extends StatelessWidget {
  const AyudantePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Ayudantia ayudante = Get.arguments;
    final size = MediaQuery.of(context).size;
    print(ayudante.usuario!.nombre);
    print(ayudante.sesion);
    return Scaffold(
      backgroundColor: Color(0xffE5E9F2),
      appBar: AppBar(
        title: Text(ayudante.materia!.nombre!),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff243165),
      ),
      body: Container(
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
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: ayudante.sesion!.length,
                    itemBuilder: (context, index) {
                      final sesion = ayudante.sesion![index];
                      if (sesion.dia != null) {
                        return Material(
                          color: Colors.transparent,
                          child: ListTile(
                            onTap: () {},
                            title: Text(
                              "${dias[sesion.dia]!} ",
                              style: TextStyle(
                                color: Color(0xff47525E),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "Sesión ${index + 1}: ${sesion.horaInicio}:${sesion.minutoInicio} - ${sesion.horaFin}:${sesion.minutoFin}",
                              style: TextStyle(
                                color: Color(0xff47525E),
                              ),
                            ),
                            trailing: Icon(
                              Icons.star,
                              // color: Colors.amber[600],
                              size: 30,
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: Container(
                            padding: EdgeInsets.only(top: 100),
                            child: Text("No hay sesiones disponibles"),
                          ),
                        );
                      }
                    },
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
                      backgroundColor: Colors.blue,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(55),
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
                  Text(
                    ayudante.usuario!.nombre!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (ayudante.avg != null)
                                  ? ayudante.avg.toString()
                                  : "-",
                              style: TextStyle(
                                fontSize: 25,
                                color: Color(0xff343F4B),
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber[600],
                              size: 30,
                            )
                          ],
                        ),
                        Text(
                          "Calificación",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff5A6978),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    width: size.width * 0.50,
                    height: size.height * 0.10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
