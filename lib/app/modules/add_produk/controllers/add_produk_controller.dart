import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pt_biis_griya_nadi/app/Service/api_service.dart';

class AddProdukController extends GetxController {
  final namaController = TextEditingController();
  final priceController = TextEditingController();
  var isLoading = false.obs;

  void addFood() async {
    if (namaController.text.isEmpty || priceController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Name and Harga harus diisi',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    final price = int.tryParse(priceController.text);
    if (price == null) {
      Get.snackbar(
        'Error',
        'Harga harus berupa angka',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading(true);
      await ApiServiceMockup().postFood(
        namaController.text,
        price,
      );

      Get.snackbar(
        'Berhasil',
        'Produk berhasil ditambahkan',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.deepPurple[900],
        colorText: Colors.white,
      );

      await Future.delayed(const Duration(seconds: 1));
      Get.back();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal menambahkan produk',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    namaController.dispose();
    priceController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    namaController.clear();
    priceController.clear();
  }
}
