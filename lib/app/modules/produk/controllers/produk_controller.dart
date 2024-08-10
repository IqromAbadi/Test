import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pt_biis_griya_nadi/app/Service/api_service.dart';
import 'package:pt_biis_griya_nadi/app/models/food.dart';
import 'package:pt_biis_griya_nadi/app/modules/cart/controllers/cart_controller.dart';

class ProdukController extends GetxController {
  var isLoading = true.obs;
  var foods = <Food>[].obs;
  final CartController cartController = Get.find<CartController>();

  @override
  void onInit() {
    super.onInit();
    fetchFood();
  }

  void fetchFood() async {
    try {
      isLoading(true);
      var foodList = await ApiServiceMockup().getFood();
      if (foodList != null && foodList.isNotEmpty) {
        foods.assignAll(foodList);
      } else {
        foods.clear();
        print('No data found');
      }
    } finally {
      isLoading(false);
    }
  }

  void addToCart(Food food, int quantity) {
    cartController.addToCart(food, quantity);
  }

  void deleteFood(String id) async {
    try {
      isLoading(true);
      await ApiServiceMockup().deleteFood(int.parse(id));
      Get.snackbar('Success', 'Food deleted successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.deepPurple[900],
          colorText: Colors.white);
      fetchFood();
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete food',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoading(false);
    }
  }

  Future<void> refreshFood() async {
    fetchFood();
  }
}
