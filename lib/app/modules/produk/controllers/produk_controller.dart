import 'package:get/get.dart';
import 'package:pt_biis_griya_nadi/app/Service/api_service.dart';
import 'package:pt_biis_griya_nadi/app/models/produk_model.dart';

class ProdukController extends GetxController {
  var isLoading = true.obs;
  var produkList = <ProdukModel>[].obs;

  @override
  void onInit() {
    fetchProduk();
    super.onInit();
  }

  void fetchProduk() async {
    try {
      isLoading(true);
      var produk = await ApiServiceMockup().getProduk();
      if (produk.isNotEmpty) {
        produkList.assignAll(produk);
      }
    } finally {
      isLoading(false);
    }
  }

  void deleteProduk(String id) async {
    try {
      isLoading(true);
      bool success = await ApiServiceMockup().deleteProduk(id);
      if (success) {
        produkList.removeWhere((produk) => produk.id == id); // Remove from list
      }
    } finally {
      isLoading(false);
    }
  }

  void refreshProduk() async {
    fetchProduk();
  }
}
