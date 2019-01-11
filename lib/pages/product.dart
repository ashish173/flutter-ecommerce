import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../widgets/ui_elements/title_default.dart';
import '../scoped-models/products.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final int index;

  ProductPage(this.index);

  Widget _buildAddressRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Pune, India',
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        ),
        SizedBox(width: 10.0),
        Text(
          '\$' + price.toString(),
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('back button pressed');
        Navigator.pop(context);
        Future.value(false);
      },
      child: ScopedModelDescendant<ProductsModel>(
          builder: (BuildContext context, Widget child, ProductsModel model) {
        final List<Product> products = model.products;
        final Product selectedProduct = products[index];

        return Scaffold(
          appBar: AppBar(
            title: Text(selectedProduct.title),
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(selectedProduct.image),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TitleDefault(selectedProduct.title),
                ),
                _buildAddressRow(selectedProduct.price),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Text('Delete'),
                    onPressed: () {
                      print('delete button is pressed');
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
