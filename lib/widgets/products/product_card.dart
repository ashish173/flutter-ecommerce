import 'package:flutter/material.dart';

import '../ui_elements/title_default.dart';
import '../ui_elements/address.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TitleDefault(product['title']),
                  SizedBox(
                    width: 8.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      '\$${product['price'].toString()}',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ]),
          ),
          Address('Pune, India'),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.pushNamed<bool>(
                      context, '/product/' + productIndex.toString());
                },
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Theme.of(context).primaryColor,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
