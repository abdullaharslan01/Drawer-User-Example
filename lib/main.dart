import 'package:example_drawer_user/drawer_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Drawer Example",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.black,
            elevation: 0,
            centerTitle: true,
          ),
        ),
        home: DrawerExample());
  }
}
