import 'package:get/get.dart';
import 'package:pt_biis_griya_nadi/app/models/food.dart';

class CartController extends GetxController {
  var cartItems = <Food, int>{}.obs;
  var totalPrice = 0.obs;

  void addToCart(Food food, int quantity) {
    if (cartItems.containsKey(food)) {
      cartItems[food] = cartItems[food]! + quantity;
    } else {
      cartItems[food] = quantity;
    }
    totalPrice.value += food.price * quantity;
  }

  int get totalItemsInCart =>
      cartItems.values.fold(0, (sum, item) => sum + item);
}
