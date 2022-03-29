import 'package:flutter_crypto_app/home/screens/home_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String splash = '/';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String root = '/root';
  static const String auth = '/auth';

  static final List<GetPage> getPages = [
    GetPage(name: home, page: () => HomeScreen()),
  ];
}
