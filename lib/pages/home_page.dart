import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Catalog'),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Container(
          child: Text('Welcome to my app'),
        ),
      ),
    );
  }
}
