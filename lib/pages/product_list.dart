import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './product_edit.dart';
import '../scoped-models/products.dart';

class ProductListPage extends StatelessWidget {
  Widget _buildEditButton(
      BuildContext context, int index, ProductsModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectProduct(index);
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) {
            return ProductEditPage();
          }),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, child, ProductsModel model) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(model.products[index].image),
              title: Text(model.products[index].title),
              trailing: _buildEditButton(context, index, model),
            );
          },
          itemCount: model.products.length,
        );
      },
    );
  }
}
