import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Catalog'),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: Center(
        child: Container(
          child: Text('Welcome to my app'),
        ),
      ),
    );
  }
}
