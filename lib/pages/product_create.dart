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

  Widget _buildTitleTextField() {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(labelText: 'Title'),
      onChanged: (String value) {
        setState(() {
          title = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextField(
              decoration: InputDecoration(labelText: 'Description'),
              onChanged: (String value) {
                setState(() {
                  description = value;
                });
              },
              maxLines: 5,
            );
  }

  Widget _buildPriceIntField() {
    return TextField(
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                setState(() {
                  price = int.parse(value);
                });
              },
            );
  }

  void _submitForm() {
    final Map<String, dynamic> product = {
      'title': title,
      'description': description,
      'price': price,
      'image': 'assets/profile.jpeg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/home');
  }

  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width; 
    final double targetWidth = deviceWidth > 500.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;

    return Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
          children: <Widget>[
            _buildTitleTextField(),
            _buildDescriptionTextField(),
            _buildPriceIntField(),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
                child: Text('Save'),
                textColor: Colors.white,
                onPressed: _submitForm
            )
          ],
        ));
  }
}
