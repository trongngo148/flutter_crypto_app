import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/config/theme.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'config/routes.dart';
import 'home/providers/home_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [Provider(create: (context) => HomeProvider())],
      child: Consumer(
        builder: (context, value, child) => GetMaterialApp(
          darkTheme: themeData(context),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.home,
          getPages: Routes.getPages,
        ),
      ),
    ),
  );
}
