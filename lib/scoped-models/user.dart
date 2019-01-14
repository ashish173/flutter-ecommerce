import '../models/user.dart';
import './connected_products.dart';

mixin UserModel on ConnectedProductsModel {
  User _authenticatedUser;

  void login(String email, String password) {
    print('in user mode login method');
    _authenticatedUser = User(email: email, id: 'asdfa', password: password);
  }
}
