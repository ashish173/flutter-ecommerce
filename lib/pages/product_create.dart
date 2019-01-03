import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;
  final Function deleteProduct;

  ProductCreatePage(this.addProduct, this.deleteProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePage();
  }
}

class _ProductCreatePage extends State<ProductCreatePage> {
  String title;
  String description;
  int price;
  String image;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: 'Title'),
              onChanged: (String value) {
                setState(() {
                  title = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Description'),
              onChanged: (String value) {
                setState(() {
                  description = value;
                });
              },
              maxLines: 5,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                setState(() {
                  price = int.parse(value);
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Save'),
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              onPressed: () {
                final Map<String, dynamic> product = {
                  'title': title,
                  'description': description,
                  'price': price,
                  'image': 'assets/profile.jpeg'
                };
                widget.addProduct(product);
                Navigator.pushReplacementNamed(context, '/home');
              }
            )
          ],
        ));
  }
}
