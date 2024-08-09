import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_user_controller.dart';

class AddUserView extends GetView<AddUserController> {
  const AddUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddUserView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: controller.nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: controller.jobController,
                decoration: const InputDecoration(labelText: 'Job'),
              ),
              Obx(() => ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () {
                            controller.addUser();
                          },
                    child: controller.isLoading.value
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text('Add User'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
