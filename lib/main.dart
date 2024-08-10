import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pt_biis_griya_nadi/app/modules/add_produk/controllers/add_produk_controller.dart';
import 'package:pt_biis_griya_nadi/app/modules/cart/controllers/cart_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.put(AddProdukController());
  Get.put(CartController());

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
