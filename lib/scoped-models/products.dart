import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

class ProductsModel extends Model {
  final List<Product> _products = [];
  int _selectedProductIndex;
  bool _showFavorites = false;

  List<Product> get products {
    return List.from(_products);
  }

  List<Product> get displayProducts {
    return _showFavorites
        ? _products.where((Product product) => product.isFavorite).toList()
        : _products;
  }

  bool get showFavorite {
    if (_showFavorites == null) {
      return null;
    }
    return _showFavorites;
  }

  void addProduct(Product product) {
    print('in addProduct method');
    print(product);
    _products.add(product);
    print(_products.length);
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);
    _selectedProductIndex = null;
    notifyListeners();
  }

  void updateProduct(index, product) {
    _products[index] = product;
    _selectedProductIndex = null;
    notifyListeners();
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

  void toggleIsFavoriteProduct() {
    final bool isCurrentlyFavorite = _products[selectedProductIndex].isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;

    Product updatedProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        isFavorite: newFavoriteStatus);

    _products[selectedProductIndex] = updatedProduct;
    _selectedProductIndex = null;
    notifyListeners();
  }

  void selectProduct(int productIndex) {
    _selectedProductIndex = productIndex;
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}
