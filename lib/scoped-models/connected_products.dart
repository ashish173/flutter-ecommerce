import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../models/user.dart';

mixin ConnectedProductsModel on Model {
  final List<Product> products = [];
  int selectedProductIndex;
  User authenticatedUser;

  void addProduct(
      String title, String description, String image, double price) {
    Product newProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: authenticatedUser.email,
        userId: authenticatedUser.id);
    products.add(newProduct);

    selectedProductIndex = null;
    notifyListeners();
  }
}
