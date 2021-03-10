import 'package:get/get.dart';
import 'package:getX_proj/models/product.dart';

class CartController extends GetxController {
  var cartItems = List<Product>().obs;

  int get count => cartItems.length;
  double get totalAmount => cartItems.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {
    print("add to cart");
    cartItems.add(product);
  }
}
