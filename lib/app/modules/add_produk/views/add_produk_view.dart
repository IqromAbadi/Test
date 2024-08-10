import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_produk_controller.dart';

class AddProdukView extends GetView<AddProdukController> {
  const AddProdukView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Produk',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.namaController,
              decoration: const InputDecoration(
                hintText: 'Nama',
              ),
            ),
            TextField(
              controller: controller.priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Harga',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[900],
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                controller.addFood();
              },
              child: const Text("Tambah Produk",
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
