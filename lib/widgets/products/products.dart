import 'package:flutter/material.dart';

// renders the products list which is recieves as arguments
// Stateless widget as it only takes in values in renders them
// doesn't modify data just replaces what comes from top

import './product_card.dart';
import './../../models/product.dart';

class Products extends StatelessWidget {
  final List<Product> products;
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct});

  @override
  Widget _buildProductList() {
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
  Widget build(BuildContext content) {
    print('Products build()');
    return _buildProductList();
  }
}
