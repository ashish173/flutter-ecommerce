import 'package:flutter/material.dart';

import './product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;

  ProductListPage(this.products, this.updateProduct);

  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(products[index]['image']),
          title: Text(products[index]['title']),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return ProductEditPage(
                      product: products[index],
                      updateProduct: updateProduct,
                      productIndex: index);
                }),
              );
            },
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
