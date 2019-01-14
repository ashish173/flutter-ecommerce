import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

// renders the products list which is recieves as arguments
// Stateless widget as it only takes in values in renders them
// doesn't modify data just replaces what comes from top

import './product_card.dart';
import '../../models/product.dart';
import '../../scoped-models/main.dart';

class Products extends StatelessWidget {
  @override
  Widget _buildProductList(List<Product> products) {
    print('prduct length');
    print(products.length);
    Widget productCard;

    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: (context, index) => ProductCard(products[index], index),
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
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        print('In build method of products widget');

        return _buildProductList(model.displayProducts);
      },
    );
  }
}
