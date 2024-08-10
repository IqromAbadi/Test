import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pt_biis_griya_nadi/app/modules/add_produk/views/add_produk_view.dart';
import '../controllers/produk_controller.dart';

class ProdukView extends GetView<ProdukController> {
  const ProdukView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Produk',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            color: Colors.deepPurple[900],
            onPressed: () async {
              await controller.refreshFood();
            },
          ),
          Obx(() {
            return Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  iconSize: 30,
                  color: Colors.deepPurple[900],
                  onPressed: () {
                    Get.toNamed('/cart');
                  },
                ),
                if (controller.cartController.totalItemsInCart > 0)
                  Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        controller.cartController.totalItemsInCart.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            );
          }),
        ],
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.foods.isEmpty) {
            return const Center(child: Text('Tidak ada produk'));
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.foods.length,
                    itemBuilder: (context, index) {
                      final food = controller.foods[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Card(
                          color: Colors.grey[700],
                          child: GestureDetector(
                            onTap: () {
                              controller.addToCart(food, 1);
                            },
                            onDoubleTap: () {
                              controller.addToCart(food, 2);
                            },
                            child: ListTile(
                              title: Text(
                                food.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text(
                                'Rp.${food.price}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                color: Colors.white,
                                onPressed: () {
                                  controller.deleteFood(food.id);
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Tap untuk menambahkan item\nkedalam keranjang',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[900],
        onPressed: () {
          Get.to(() => const AddProdukView());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
