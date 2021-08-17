import 'package:app_control_ayudante/controllers/clase_favorito_controller.dart';
import 'package:app_control_ayudante/models/clase_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AsistenciaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final claFavCtrl = Get.find<ClaseFavoritoController>();
    return Container(
      color: Color(0xfff2f2f2),
      child: Obx(
        () => (claFavCtrl.clases.length != 0)
            ? ListView.builder(
                // separatorBuilder: (context, index) => Divider(
                //   thickness: 1.2,
                //   height: 1,
                //   color: Color(0xff5b378d),
                // ),
                itemCount: claFavCtrl.clases.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ClaseTile(
                    clase: claFavCtrl.clases[index],
                  );
                },
              )
            : Container(
                alignment: Alignment.topCenter,
                child: LinearProgressIndicator(),
              ),
      ),
    );
  }
}

class ClaseTile extends StatelessWidget {
  const ClaseTile({
    Key? key,
    required this.clase,
  }) : super(key: key);
  final Clase clase;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 2),
      // height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(1, 1),
          ),
        ],
        border: Border(
          bottom: BorderSide(
              width: 1.5, color: Color(0xff5b378d)), //TODO: COLOR DE FACULTAD
        ),
      ),
      child: ListTile(
        onTap: () {},
        title: Text(
          clase.tema!,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              clase.sesion!.ayudantia!.materia!.nombre!,
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            Text(
              clase.sesion!.ayudantia!.usuario!.nombre!,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
        trailing: Column(
          children: [
            Icon(
              (clase.asistencia != null) ? Icons.star : Icons.star_border,
              color: Colors.amber[600],
              size: 30,
            ),
            Text(
              clase.fechaClase!
                  .toIso8601String()
                  .substring(0, 10)
                  .replaceAll("-", "/"), //TODO: formato fecha
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
              ),
            )
          ],
        ),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Color(0xffeaeaea),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Icon(
              Icons.person,
              color: Color(0xff707070),
            ),
          ),
        ),
      ),
    );
  }
}
