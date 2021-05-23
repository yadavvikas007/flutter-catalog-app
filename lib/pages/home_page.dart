import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  //Called when this object is inserted into the tree.
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"]; //products -> map
    CatalogModel.items = List.from(productsData) //creating list of items
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //Vxstore -> The coordinating widget that keeps track of mutations and the notify the same to the listening widgets.
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().p16().expand()
              else //while data isnt loaded yet or still loading
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      floatingActionButton: VxBuilder(
        mutations: {
          AddMutation,
          RemoveMutation
        }, //updates when something added or removed from cart
        builder: (context, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoute.cartRoute),
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
          backgroundColor: context.theme.buttonColor,
        ).badge(
            color: Vx.red500,
            count: _cart.items.length,
            textStyle: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
            size: 22),
      ),
    );
  }
}
