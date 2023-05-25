import 'package:get/get.dart';

import '../modules/admin/dashboard/bindings/dashboard_binding.dart';
import '../modules/admin/dashboard/views/dashboard_view.dart';
import '../modules/admin/orders/bindings/orders_binding.dart';
import '../modules/admin/orders/views/orders_views.dart';
import '../modules/admin/orders/views/todays_order_view.dart';
import '../modules/admin/products/bindings/add_product_binding.dart';
import '../modules/admin/products/bindings/all_products_binding.dart';
import '../modules/admin/products/bindings/edit_product_binding.dart';
import '../modules/admin/products/views/add_product_view.dart';
import '../modules/admin/products/views/all_products_view.dart';
import '../modules/admin/products/views/edit_product_view.dart';
import '../modules/admin/stores/bindings/stores_binding.dart';
import '../modules/admin/stores/bindings/create_stores_binding.dart';
import '../modules/admin/stores/views/create_stores_view.dart';
import '../modules/admin/stores/views/stores_view.dart';
import '../modules/admin/users/bindings/add_user_binding.dart';
import '../modules/admin/users/bindings/all_users_binding.dart';
import '../modules/admin/users/bindings/edit_user_binding.dart';
import '../modules/admin/users/bindings/user_profile_binding.dart';
import '../modules/admin/users/views/add_user_view.dart';
import '../modules/admin/users/views/all_users_view.dart';
import '../modules/admin/users/views/edit_user_view.dart';
import '../modules/admin/users/views/user_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/forgor-password/bindings/forgor_password_binding.dart';
import '../modules/login/forgor-password/views/forgor_password_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/sales_person/shopping/bindings/checkout_binding.dart';
import '../modules/sales_person/shopping/bindings/shopping_binding.dart';
import '../modules/sales_person/shopping/views/checkout_view.dart';
import '../modules/sales_person/shopping/views/shopping_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS,
      page: () => OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: _Paths.TODAYS_ORDERS,
      page: () => TodayOrders(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: _Paths.ALL_PRODUCTS,
      page: () => const AllProdcutsView(),
      binding: AllProductBinding(),
    ),
    GetPage(
      name: _Paths.ALL_PRODUCTS_QUERY,
      page: () => const AllProdcutsView(),
      binding: AllProductBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PRODUCT,
      page: () => const AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT,
      page: () => EditProductView(),
      binding: EditProductBinding(),
    ),
    GetPage(
      name: _Paths.ALL_USERS,
      page: () => AllUsersView(),
      binding: AllUsersBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => const UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_USER,
      page: () => const AddUserView(),
      binding: AddUserBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_USER,
      page: () => EditUserView(),
      binding: EditUserBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      children: [
        GetPage(
          name: _Paths.FORGOR_PASSWORD,
          page: () => const ForgorPasswordView(),
          binding: ForgorPasswordBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SHOPPING,
      page: () => const ShoppingView(),
      binding: ShoppingBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.STORES,
      page: () => const StoresView(),
      binding: StoresBinding(),
      children: [
        GetPage(
          name: _Paths.CREATE_STORES,
          page: () => const CreateStoresView(),
          binding: CreateStoresBinding(),
        ),
      ],
    ),
  ];
}
