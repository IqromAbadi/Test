import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pt_biis_griya_nadi/app/Service/api_service.dart';
import 'package:pt_biis_griya_nadi/app/modules/user/controllers/user_controller.dart';

class AddUserController extends GetxController {
  final nameController = TextEditingController();
  final jobController = TextEditingController();
  var isLoading = false.obs;

  void addUser() async {
    // Validasi input
    if (nameController.text.isEmpty || jobController.text.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Name and job must be filled',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return; // Hentikan eksekusi lebih lanjut jika validasi gagal
    }

    try {
      isLoading(true);
      print("Add user function called");
      final user = await ApiServiceReqresin().postUser(
        nameController.text,
        jobController.text,
      );

      if (user != null) {
        Get.find<UserController>().addUser(user);

        Get.snackbar(
          'Success',
          'User added successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.deepPurple[900],
          colorText: Colors.white,
        );

        await Future.delayed(const Duration(seconds: 1));
        Get.back();
      } else {
        Get.snackbar(
          'Error',
          'Failed to add user',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add user',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
