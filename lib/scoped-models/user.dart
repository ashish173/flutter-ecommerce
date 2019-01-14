import '../models/user.dart';
import './connected_products.dart';

mixin UserModel on ConnectedProductsModel {

  void login(String email, String password) {
    print('in user mode login method');
    authenticatedUser = User(email: email, id: 'asdfa', password: password);

    print('length of products');
    print(products.length);
  }
}
