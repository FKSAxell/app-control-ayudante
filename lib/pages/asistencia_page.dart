import 'package:app_control_ayudante/controllers/clase_favorito_controller.dart';
import 'package:app_control_ayudante/models/clase_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AsistenciaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final claFavCtrl = Get.find<ClaseFavoritoController>();
    return Container(
      color: Color(0xffE5E9F2),
      child: Obx(
        () => (claFavCtrl.clases.length != 0)
            ? ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: Color(0xff243165),
                ),
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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.white,
      child: ListTile(
        onTap: () {},
        title: Text(
          clase.tema!,
          style: TextStyle(
            color: Color(0xff47525E),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              clase.sesion!.ayudantia!.materia!.nombre!,
              style: TextStyle(
                color: Color(0xff47525E),
              ),
            ),
            Text(
              clase.sesion!.ayudantia!.usuario!.nombre!,
              style: TextStyle(
                color: Color(0xff72777B),
              ),
            ),
          ],
        ),
        trailing: Column(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber[600],
              size: 30,
            ),
            Text(
              clase.fechaClase!
                  .toIso8601String()
                  .substring(0, 10)
                  .replaceAll("-", "/"), //TODO: formato fecha
              style: TextStyle(
                color: Color(0xff47525E),
                fontSize: 12,
              ),
            )
          ],
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
