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
  double price;
  String image;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(labelText: 'Title'),
      validator: (String value) {
        if(value.isEmpty || value.length < 5) {
          return 'Title is required and should be more than 5 characters';
        }
      },
      onSaved: (String value) {
        setState(() {
          title = value;
        });
      }
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description'),
      validator: (String value) {
        if(value.isEmpty || value.length < 10) {
          return 'Description is required and should be more than 10 characters';
        }
      },
      onSaved: (String value) {
        setState(() {
          description = value;
        });
      },
      maxLines: 5,
    );
  }

  Widget _buildPriceIntField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Price'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if(value.isEmpty || !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Price is require and should be number';
        }
      },
      onSaved: (String value) {
        setState(() {
          price = double.parse(value);
        });
      },
      
    );
  }

  void _submitForm() {
    _formKey.currentState.validate();
    _formKey.currentState.save();

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
      child: Form(
        key: _formKey,
        onChanged: () { print('form changed'); },
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
                onPressed: _submitForm)
          ],
        ),
      ),
    );
  }
}
