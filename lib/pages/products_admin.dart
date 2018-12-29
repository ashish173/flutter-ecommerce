import 'package:flutter/material.dart';

import './products.dart';
import './product_list.dart';
import './product_create.dart';

class ProductsAdmin extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductsPage()));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Manage Products"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Create Product',
              ),
              Tab(text: 'My Products')
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[ProductCreatePage(), ProductListPage()],
        ),
      ),
    );
  }
}
