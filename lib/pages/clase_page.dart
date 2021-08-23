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

class ClasePage extends StatelessWidget {
  const ClasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Ejemplo de una clase
    final Clase clase = new Clase(
      id: "1",
      tema: "Variables y Tipos de datos",
      descripcion:
          "En la clase de hoy necesito que traigan lapiz pluma y un poco de imaginación, no olvidar su laptop para realizar pruebas del codigo ;) ",
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
            HeaderClase(
              clase: clase,
            )
          ],
        ),
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
                  width: size.width * 0.40,
                  height: size.height * 0.15,
                  child: AutoSizeText(
                    clase.tema!,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    maxLines: 4,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width * 0.5,
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
