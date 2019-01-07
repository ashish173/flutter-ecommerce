import 'package:flutter/material.dart';

import './product_create.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductListPage(this.products);

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
                  return ProductCreatePage(product: products[index]);
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
