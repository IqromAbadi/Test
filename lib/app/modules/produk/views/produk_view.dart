import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pt_biis_griya_nadi/app/modules/add_produk/views/add_produk_view.dart';
import 'package:pt_biis_griya_nadi/app/modules/edit_produk/views/edit_produk_view.dart';
import '../controllers/produk_controller.dart';

class ProdukView extends GetView<ProdukController> {
  const ProdukView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProdukView'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                controller.refreshProduk();
              },
              child: ListView.builder(
                itemCount: controller.produkList.length,
                itemBuilder: (context, index) {
                  final produk = controller.produkList[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Card(
                      color: Colors.grey[200],
                      child: ListTile(
                        title: Text(
                          produk.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          'Harga: Rp${produk.harga}',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                Get.to(() => EditProdukView(),
                                    arguments: produk);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                controller.deleteProduk(produk.id);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddProdukView());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
