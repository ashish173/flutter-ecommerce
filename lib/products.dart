import 'package:flutter/material.dart';

// renders the products list which is recieves as arguments
// Stateless widget as it only takes in values in renders them
// doesn't modify data just replaces what comes from top

class Products extends StatelessWidget {
  final List<String> products;

  Products([this.products = const []]);

  Widget _productItemBuilder(BuildContext context, int index) {
    return Card(
          child: Column(
            children: <Widget>[
              Image.asset('assets/profile.jpeg'),
              Text(products[index])
            ],
          ),
        );
  }

  @override
  Widget build(BuildContext content) {
    Widget productCard;

    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _productItemBuilder,
        itemCount: products.length,
      );
    } else {
      productCard = Center(child: Text("No products found"),);
    }

    return productCard;
  }
}