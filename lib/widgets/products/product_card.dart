import 'package:flutter/material.dart';

import '../ui_elements/title_default.dart';
import '../ui_elements/address_tag.dart';
import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productId;

  ProductCard(this.product, this.productId);

  Widget _buildTitlePriceRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        TitleDefault(product.title),
        SizedBox(
          width: 8.0,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            '\$${product.price.toString()}',
            style: TextStyle(color: Colors.white),
          ),
        )
      ]),
    );
  }

  Widget _buildButtonBar(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).accentColor,
          onPressed: () {
            Navigator.pushNamed<bool>(
                context, '/product/' + product.id.toString());
          },
        ),
        // ScopedModelDescendant<MainModel>(
        //   builder: (BuildContext context, Widget child, MainModel model) {
        //     return IconButton(
        //       icon: Icon(model.allProducts[productIndex].isFavorite
        //           ? Icons.favorite
        //           : Icons.favorite_border),
        //       color: Theme.of(context).primaryColor,
        //       onPressed: () {
        //         model.selectProduct(productIndex);
        //         model.toggleIsFavoriteProduct();
        //       },
        //     );
        //   },
        // )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/profile.jpeg'), 
            height: 300.0,
            width: 300.0,
            fit: BoxFit.cover,
            image: NetworkImage(product.image)),
          _buildTitlePriceRow(context),
          AddressTag('Pune, India'),
          _buildButtonBar(context),
        ],
      ),
    );
  }
}
