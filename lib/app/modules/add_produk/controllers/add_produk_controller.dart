import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pt_biis_griya_nadi/app/Service/api_service.dart';
import 'package:pt_biis_griya_nadi/app/models/produk_model.dart';

class AddProdukController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  void submitProduk() async {
    String name = nameController.text;
    int harga = int.parse(hargaController.text);

    if (name.isEmpty || hargaController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Name and harga cannot be empty',
      );
      return;
    }

    ProdukModel? produk = await ApiServiceMockup().postProduk(name, harga);

    if (produk != null) {
      nameController.clear();
      hargaController.clear();
      Get.back();
      Get.snackbar(
        'Success',
        'Produk added successfully',
      );
    } else {
      Get.snackbar(
        'Error',
        'Failed to add produk',
      );
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    hargaController.dispose();
    super.onClose();
  }
}
