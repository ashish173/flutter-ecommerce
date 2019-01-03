import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductManager(this.products);

  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: Products(products),
      ),
    ]);
  }
}
