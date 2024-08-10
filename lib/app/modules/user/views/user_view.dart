import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pt_biis_griya_nadi/app/modules/user/controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lis Pengguna',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.users.isEmpty) {
          return const Center(child: Text('Tidak ada data pengguna.'));
        } else {
          return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              final user = controller.users[index];
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Card(
                  color: Colors.grey[700],
                  child: ListTile(
                    title: Text(
                      'Nama : ${user.name}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      'Job : ${user.job}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[900],
        onPressed: () {
          Get.toNamed('/add-user');
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
