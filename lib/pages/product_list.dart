import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './product_edit.dart';
import '../scoped-models/main.dart';

class ProductListPage extends StatefulWidget {
  final MainModel model;

  ProductListPage(this.model);

  @override
    State<StatefulWidget> createState() {
      return _ProductListPageState();
    }
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  initState() {
    widget.model.fetchProducts(); // products might have changed or something
    super.initState();
  }

  Widget _buildEditButton(
      BuildContext context, int index, MainModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectProduct(model.allProducts[index].id);
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) {
            return ProductEditPage();
          }),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, child, MainModel model) {
        return 
        ListView.builder(
          itemCount: model.allProducts.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(model.allProducts[index].id),
              background: Container(color: Colors.red),
              onDismissed: (DismissDirection direction) {
                print('we have dismissed');
                if (direction == DismissDirection.endToStart) {
                  model.selectProduct(model.allProducts[index].id);
                  model.deleteProduct();
                } else if (direction == DismissDirection.startToEnd) {
                  print('dismiss from end to start');
                } else {
                  print('other dismiss');
                }
              },
              child: ListTile(
                leading: CircleAvatar( 
                  backgroundImage: NetworkImage(model.allProducts[index].image)
                ),
                title: Text(model.allProducts[index].title),
                trailing: _buildEditButton(context, index, model),
              )
            );
          },
        );
      },
    );
  }
}
