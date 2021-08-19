import 'package:app_control_ayudante/controllers/materias_facultad_controller.dart';
import 'package:app_control_ayudante/models/materia_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MateriaSearchDelegate extends SearchDelegate<String> {
  final matFacCtrl = Get.find<MateriasFacultadController>();

  @override
  String get searchFieldLabel => "Buscar Materia...";

  @override
  ThemeData appBarTheme(BuildContext context) {
    return context.theme.copyWith(
      appBarTheme: context.theme.appBarTheme.copyWith(),
      textTheme: context.theme.textTheme.copyWith(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      inputDecorationTheme: context.theme.inputDecorationTheme.copyWith(
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Materia> suggestions = query.isEmpty
        ? matFacCtrl.materias
        : matFacCtrl.materias
            .where((materia) => materia.nombre!
                .toLowerCase()
                .replaceAll("á", "a")
                .replaceAll("é", "e")
                .replaceAll("í", "i")
                .replaceAll("ó", "o")
                .replaceAll("ú", "u")
                .contains(query))
            .toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (content, index) => ListTile(
        onTap: () {
          matFacCtrl.ayudantes.value = [];
          matFacCtrl.favorito.value = false;
          matFacCtrl.obtenerAyudantesPorMateria(suggestions[index].id!);
          matFacCtrl.obtenerEstadoMateriaRegistarada(suggestions[index].id!);
          Get.toNamed("materia",
              arguments: [suggestions[index].id, suggestions[index].nombre]);
        },
        trailing: Icon(Icons.arrow_right),
        title: Text(
          suggestions[index].nombre!,
          style: TextStyle(color: context.theme.primaryColor),
        ),
      ),
    );
  }
}
