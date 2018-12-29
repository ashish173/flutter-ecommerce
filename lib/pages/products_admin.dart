import 'package:flutter/material.dart';

import 'products.dart';

class ProductsAdmin extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Choose'),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              title: Text('All Products'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => ProductsPage()
                ));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Manage Products"),
      ),
      body: Container(child: Text("Manage Products")),
    );
  }
}
