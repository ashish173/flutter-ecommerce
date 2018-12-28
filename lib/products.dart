import 'package:flutter/material.dart';

// renders the products list which is recieves as arguments
// Stateless widget as it only takes in values in renders them
// doesn't modify data just replaces what comes from top

class Products extends StatelessWidget {
  final List<String> products;

  Products([this.products = const []]);

  @override
  Widget build(BuildContext content) {
    return ListView(
      children: products
        .map((element) => Card(
          child: Column(
            children: <Widget>[
              Image.asset('assets/profile.jpeg'),
              Text(element)
            ],
          ),
        ),).toList()
    );
  }
}