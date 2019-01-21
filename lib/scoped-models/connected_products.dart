import 'dart:convert';
import 'dart:async';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';
import '../models/user.dart';

mixin ConnectedProductsModel on Model {
  List<Product> _products = [];
  String _selectedProductId;
  User _authenticatedUser;
  bool _isLoading;

  Future<Null> addProduct(
      String title, String description, String image, double price) {
    _isLoading = true;
    notifyListeners();

    final Map<String, dynamic> productData = {
      'title': title,
      'description': description,
      'image':
          'https://cdn.newsapi.com.au/image/v1/551af2930c81cf6c4aaa1c5d9f1c075f',
      'price': price,
      'userEmail': _authenticatedUser.email,
      'userId': _authenticatedUser.id
    };

    return http
        .post('https://products-flutter-84512.firebaseio.com/products.json',
            body: json.encode(productData))
        .then((http.Response response) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      Product newProduct = Product(
          id: responseData['id'],
          title: title,
          description: description,
          image: image,
          price: price,
          userEmail: _authenticatedUser.email,
          userId: _authenticatedUser.id);

      _products.add(newProduct);
      _isLoading = false;
      notifyListeners();
    });
  }

  String get selectedProductId {
    return _selectedProductId;
  }
}

// Products Model
mixin ProductsModel on ConnectedProductsModel {
  bool _showFavorites = false;

  List<Product> get allProducts {
    return List.from(_products);
  }

  Product getProductById(String id) {
    Product newProduct;
    _products.toList().forEach((Product product) {
      if (product.id == id) {
        newProduct = product;
      }
    });
    return newProduct;
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

  Future<Null> deleteProduct() {
    _products.removeAt(selectedProductIndex);
    
    notifyListeners();
    return http
        .delete(
            'https://products-flutter-84512.firebaseio.com/products/${_selectedProductId}.json')
        .then((http.Response response) {
      _selectedProductId = null;
    });
  }

  Future<Null> fetchProducts() {
    _isLoading = true;
    notifyListeners();
    return http
        .get('https://products-flutter-84512.firebaseio.com/products.json')
        .then((http.Response response) {
      // create a product list
      final List<Product> fetchedProductList = [];
      final Map<String, dynamic> productListData = json.decode(response.body);

      if (productListData == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }

      productListData.forEach((String productId, dynamic productData) {
        final Product product = Product(
            id: productId,
            title: productData['title'],
            description: productData['description'],
            price: productData['price'],
            image: productData['image'],
            userEmail: productData['userEmail'],
            userId: productData['userId']);

        fetchedProductList.add(product);
      });

      _isLoading = false;
      _products = fetchedProductList;
      notifyListeners();
      _selectedProductId = null; // reset the selections before
    });
  }

  Future<Null> updateProduct(
      String title, String description, String image, double price) {
    // send a request to firebase
    _isLoading = true;
    notifyListeners();

    Map<String, dynamic> updateData = {
      'title': title,
      'description': description,
      'image':
          'https://cdn.newsapi.com.au/image/v1/551af2930c81cf6c4aaa1c5d9f1c075f',
      'price': price,
      'userEmail': selectedProduct.userEmail,
      'userId': selectedProduct.userId,
    };

    return http
        .put(
            'https://products-flutter-84512.firebaseio.com/products/${selectedProduct.id}.json',
            body: json.encode(updateData))
        .then((_) {
      print('in update product method');
      Product updatedProduct = Product(
          id: selectedProduct.id,
          title: title,
          description: description,
          image: image,
          price: price,
          userEmail: _authenticatedUser.email,
          userId: _authenticatedUser.id);

      _products[selectedProductIndex] = updatedProduct;
      _isLoading = false;
      _selectedProductId = null;
      notifyListeners();
      // make local change and notify
    });
  }

  int get selectedProductIndex {
    return _products.indexWhere((Product product) {
      return product.id == _selectedProductId;
    });
  }

  Product get selectedProduct {
    if (_selectedProductId == null) {
      return null;
    } else {
      return _products
          .firstWhere((Product product) => product.id == selectedProductId);
    }
  }

  void toggleIsFavoriteProduct() {
    final bool isCurrentlyFavorite = selectedProduct.isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;

    Product updatedProduct = Product(
        id: selectedProduct.id,
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId,
        isFavorite: newFavoriteStatus);

    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();
  }

  void selectProduct(String productId) {
    _selectedProductId = productId;
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}

// User Model
mixin UserModel on ConnectedProductsModel {
  void login(String email, String password) {
    _authenticatedUser = User(email: email, id: 'asdfa', password: password);
  }
}

mixin UtilityModel on ConnectedProductsModel {
  bool get isLoading {
    return _isLoading;
  }
}
