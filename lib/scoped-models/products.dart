import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

class ProductsModel extends Model {
  final List<Product> _products = [];
  int _selectedProductIndex;

  List<Product> get products {
    return _products;
  }

  void addProduct(Product product) {
    print('in addProduct method');
    print(product);
    _products.add(product);
    print(_products.length);
  }

  void deleteProduct(index) {
    _products.removeAt(index);
    _selectedProductIndex = null;
  }

  void updateProduct(index, product) {
    _products[index] = product;
    _selectedProductIndex = null;
  }

  int get selectedProductIndex {
    return _selectedProductIndex;
  }

  Product get selectedProduct {
    if (_selectedProductIndex == null) {
      return null;
    } else {
      return _products[_selectedProductIndex];
    }
  }

  void selectProduct(int productIndex) {
    _selectedProductIndex = productIndex;
  }
}
