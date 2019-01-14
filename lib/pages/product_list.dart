import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './product_edit.dart';
import '../scoped-models/main.dart';

class ProductListPage extends StatelessWidget {
  Widget _buildEditButton(
      BuildContext context, int index, MainModel model) {
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
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, child, MainModel model) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(model.allProducts[index].image),
              title: Text(model.allProducts[index].title),
              trailing: _buildEditButton(context, index, model),
            );
          },
          itemCount: model.allProducts.length,
        );
      },
    );
  }
}
