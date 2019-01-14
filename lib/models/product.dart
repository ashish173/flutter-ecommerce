// Product Model

class Product {
  final String title;
  final String description;
  final double price;
  final String image;
  final bool isFavorite;
  final String userEmail;
  final String userId;

  Product(
      {this.title,
      this.description,
      this.price,
      this.image,
      this.isFavorite = false,
      this.userEmail,
      this.userId});
}
