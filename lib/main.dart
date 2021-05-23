import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/pages/cart_page.dart';
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //debug banner false
      themeMode: ThemeMode.system, //using system theme
      theme: MyTheme.lightTheme(context), //using light theme from MyTheme
      darkTheme: MyTheme.darkTheme(context), //using dark theme from MyTheme
      initialRoute: MyRoute.loginRoute, //initial route
      routes: {
        //all routes
        "/": (context) => LoginPage(), //default route as login page
        MyRoute.homeRoute: (context) => HomePage(),
        MyRoute.loginRoute: (context) => LoginPage(),
        MyRoute.cartRoute: (context) => CartPage(),
      },
    );
  }
}
