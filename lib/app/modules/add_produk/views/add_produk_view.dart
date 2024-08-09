import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_produk_controller.dart';

class AddProdukView extends GetView<AddProdukController> {
  const AddProdukView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddProdukView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Produk',
              ),
            ),
            TextField(
              controller: controller.hargaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Harga',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.submitProduk();
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
