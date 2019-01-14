import '../models/product.dart';
import './connected_products.dart';

mixin ProductsModel on ConnectedProductsModel {
  bool _showFavorites = false;

  List<Product> get allProducts {
    return List.from(products);
  }

  List<Product> get displayProducts {
    return _showFavorites
        ? products.where((Product product) => product.isFavorite).toList()
        : products;
  }

  bool get showFavorite {
    if (_showFavorites == null) {
      return null;
    }
    return _showFavorites;
  }

  void deleteProduct() {
    products.removeAt(selectedProductIndex);
    selectedProductIndex = null;
    notifyListeners();
  }

  void updateProduct(
      String title, String description, String image, double price) {
    Product updatedProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: authenticatedUser.email,
        userId: authenticatedUser.id);
        
    products[selectedProductIndex] = updatedProduct;
    selectedProductIndex = null;
    notifyListeners();
  }

  // int get selectedProductIndex {
  //   return ;
  // }

  Product get selectedProduct {
    if (selectedProductIndex == null) {
      return null;
    } else {
      return products[selectedProductIndex];
    }
  }

  void toggleIsFavoriteProduct() {
    final bool isCurrentlyFavorite = products[selectedProductIndex].isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;

    Product updatedProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId,
        isFavorite: newFavoriteStatus);

    products[selectedProductIndex] = updatedProduct;
    selectedProductIndex = null;
    notifyListeners();
  }

  void selectProduct(int productIndex) {
    selectedProductIndex = productIndex;
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}
