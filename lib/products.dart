import 'package:flutter/material.dart';

import './pages/product.dart';

// renders the products list which is recieves as arguments
// Stateless widget as it only takes in values in renders them
// doesn't modify data just replaces what comes from top

class Products extends StatelessWidget {
  final List<Map<String, String>> products;

  Products([this.products = const []]);

  Widget _productItemBuilder(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ProductPage(products[index]['title'], products[index]['image']),
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard;

    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _productItemBuilder,
        itemCount: products.length,
      );
    } else {
      productCard = Center(
        child: Text("No products found"),
      );
    }

    return productCard;
  }

  @override
  Widget build(BuildContext content) {
    return _buildProductList();
  }
}
