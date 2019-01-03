import 'package:flutter/material.dart';

// renders the products list which is recieves as arguments
// Stateless widget as it only takes in values in renders them
// doesn't modify data just replaces what comes from top

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct});

  Widget _productItemBuilder(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    products[index]['title'],
                    style: TextStyle(fontFamily: 'Oswald', fontSize: 26.0),
                  ),
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
                      '\$${products[index]['price'].toString()}',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ]),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(6.0)),
            child: Text('Pune, India'),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () {
                  Navigator.pushNamed<bool>(
                          context, '/product/' + index.toString())
                      .then((bool delete) {
                    if (delete) {
                      deleteProduct(index);
                    }
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard;

    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _productItemBuilder,
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
