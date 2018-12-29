import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {

  final Function addProduct;

  ProductControl(this.addProduct);

  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Add product"),
      onPressed: () {
        addProduct({'title': 'Chocolate', 'image': 'assets/profile.jpeg'});
      }
    );
  }
}