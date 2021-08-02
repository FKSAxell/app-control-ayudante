import 'package:app_control_ayudante/pages/asistencia_page.dart';
import 'package:app_control_ayudante/pages/ayudante_page.dart';
import 'package:app_control_ayudante/pages/ayudantia_page.dart';
import 'package:app_control_ayudante/pages/estudiante_page.dart';
import 'package:app_control_ayudante/pages/base_page.dart';
import 'package:app_control_ayudante/pages/horario_page.dart';
import 'package:app_control_ayudante/pages/login_page.dart';
import 'package:app_control_ayudante/pages/loading_page.dart';
import 'package:app_control_ayudante/pages/materia_page.dart';
import 'package:app_control_ayudante/pages/register_page.dart';
import 'package:get/get.dart';

final List<GetPage> appRoutes = [
  GetPage(name: 'loading', page: () => LoadingPage()),
  GetPage(name: 'login', page: () => LoginPage()),
  GetPage(name: 'register', page: () => RegisterPage()),
  GetPage(name: 'base', page: () => BasePage()),
  GetPage(name: 'estudiante', page: () => EstudiantePage()),
  GetPage(name: 'ayudantia', page: () => AyudantiaPage()),
  GetPage(name: 'horario', page: () => HorarioPage()),
  GetPage(name: 'asistencia', page: () => AsistenciaPage()),
  GetPage(name: 'materia', page: () => MateriaPage()),
  GetPage(name: 'ayudante', page: () => AyudantePage()),
];
