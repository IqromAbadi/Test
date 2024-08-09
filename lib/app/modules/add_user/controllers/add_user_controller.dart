import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pt_biis_griya_nadi/app/Service/api_service.dart';
import 'package:pt_biis_griya_nadi/app/modules/user/controllers/user_controller.dart';

class AddUserController extends GetxController {
  final nameController = TextEditingController();
  final jobController = TextEditingController();
  var isLoading = false.obs;

  void addUser() async {
    isLoading(true);
    print("Add user function called");
    final user = await ApiServiceReqresin()
        .postUser(nameController.text, jobController.text);
    if (user != null) {
      Get.find<UserController>().addUser(user);
    }
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
