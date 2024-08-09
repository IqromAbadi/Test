import 'package:get/get.dart';

import '../modules/add_produk/bindings/add_produk_binding.dart';
import '../modules/add_produk/views/add_produk_view.dart';
import '../modules/add_user/bindings/add_user_binding.dart';
import '../modules/add_user/views/add_user_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/edit_produk/bindings/edit_produk_binding.dart';
import '../modules/edit_produk/views/edit_produk_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/produk/bindings/produk_binding.dart';
import '../modules/produk/views/produk_view.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/user_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => const UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.ADD_USER,
      page: () => const AddUserView(),
      binding: AddUserBinding(),
    ),
    GetPage(
      name: _Paths.PRODUK,
      page: () => const ProdukView(),
      binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUK,
      page: () => const AddProdukView(),
      binding: AddProdukBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUK,
      page: () => const EditProdukView(),
      binding: EditProdukBinding(),
    ),
  ];
}
