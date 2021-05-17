import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
      ),
    );
  }
}
