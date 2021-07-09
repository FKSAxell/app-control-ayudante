import 'package:app_control_ayudante/pages/ayudantia_page.dart';
import 'package:app_control_ayudante/pages/estudiante_page.dart';
import 'package:app_control_ayudante/pages/home_page.dart';
import 'package:app_control_ayudante/pages/login_page.dart';
import 'package:app_control_ayudante/pages/loading_page.dart';
import 'package:app_control_ayudante/pages/register_page.dart';
import 'package:get/get.dart';

final List<GetPage> appRoutes = [
  GetPage(name: 'loading', page: () => LoadingPage()),
  GetPage(name: 'login', page: () => LoginPage()),
  GetPage(name: 'register', page: () => RegisterPage()),
  GetPage(name: 'home', page: () => HomePage()),
  GetPage(name: 'estudiante', page: () => EstudiantePage()),
  GetPage(name: 'ayudantia', page: () => AyudantiaPage()),
];
