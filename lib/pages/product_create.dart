import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;
  final Function deleteProduct;
  final Map<String, dynamic> product;

  ProductCreatePage({this.addProduct, this.deleteProduct, this.product});

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePage();
  }
}

class _ProductCreatePage extends State<ProductCreatePage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/profile.jpeg'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
        autofocus: true,
        initialValue: widget.product == null ? '' : widget.product['title'],
        decoration: InputDecoration(labelText: 'Title'),
        validator: (String value) {
          if (value.isEmpty || value.length < 5) {
            return 'Title is required and should be more than 5 characters';
          }
        },
        onSaved: (String value) {
          _formData['title'] = value;
        });
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      initialValue: widget.product == null ? '' : widget.product['description'],
      decoration: InputDecoration(labelText: 'Description'),
      validator: (String value) {
        if (value.isEmpty || value.length < 10) {
          return 'Description is required and should be more than 10 characters';
        }
      },
      onSaved: (String value) {
        _formData['description'] = value;
      },
      maxLines: 5,
    );
  }

  Widget _buildPriceIntField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Price'),
      initialValue: widget.product == null ? '' : widget.product['price'].toString(),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Price is require and should be number';
        }
      },
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
    );
  }

  void _submitForm() {
    _formKey.currentState.validate();
    _formKey.currentState.save();

    widget.addProduct(_formData);
    Navigator.pushReplacementNamed(context, '/home');
  }

  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 500.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    final Widget pageContent = GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .requestFocus(FocusNode()); // pass empty node focus option
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          onChanged: () {
            print('form changed');
          },
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
      ),
    );

    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Editing Product'),
            ),
            body: pageContent,
          );
  }
}
