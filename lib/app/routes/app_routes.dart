// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const ORDERS = _Paths.ORDERS;
  static const TODAYS_ORDERS = _Paths.TODAYS_ORDERS;
  static const ALL_PRODUCTS = _Paths.ALL_PRODUCTS;
  static const LOW_ON_STOCK_PRODUCT =
      _Paths.ALL_PRODUCTS + _Paths.LOW_ON_STOCK_PRODUCT;
  static const OUT_OF_STOCK_PRODUCT =
      _Paths.ALL_PRODUCTS + _Paths.OUT_OF_STOCK_PRODUCT;
  static const NEW_PRODUCT = _Paths.NEW_PRODUCT;
  static const EDIT_PRODUCT = _Paths.EDIT_PRODUCT;
  static const ALL_USERS = _Paths.ALL_USERS;
  static const USER_PROFILE = _Paths.USER_PROFILE;
  static const ADD_USER = _Paths.ADD_USER;
  static const EDIT_USER = _Paths.EDIT_USER;
  static const LOGIN = _Paths.LOGIN;
  static const SHOPPING = _Paths.SHOPPING;
  static const CHECKOUT = _Paths.CHECKOUT;
  static const FORGOR_PASSWORD = _Paths.LOGIN + _Paths.FORGOR_PASSWORD;
  static const STORES = _Paths.STORES;
  static const CREATE_STORES = _Paths.STORES + _Paths.CREATE_STORES;
  static const EDIT_STORE = _Paths.STORES + _Paths.EDIT_STORE;
  static const FIRST_PAGE = _Paths.FIRST_PAGE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const DASHBOARD = '/admin/dashboard';
  static const ORDERS = '/admin/orders';
  static const TODAYS_ORDERS = '/admin/orders/todays-order';
  static const ALL_PRODUCTS = '/admin/products/view/';
  static const ALL_PRODUCTS_QUERY = '/admin/products/view/:q';
  static const LOW_ON_STOCK_PRODUCT = 'low-on-stock';
  static const OUT_OF_STOCK_PRODUCT = 'out-of-stock';
  static const NEW_PRODUCT = '/admin/products/new';
  static const EDIT_PRODUCT = '/admin/products/edit';
  static const ALL_USERS = '/admin/users';
  static const USER_PROFILE = '/admin/users/profile';
  static const ADD_USER = '/admin/users/new';
  static const EDIT_USER = '/admin/users/edit';
  static const LOGIN = '/login';
  static const SHOPPING = '/shopping';
  static const CHECKOUT = '/checkout';
  static const FORGOR_PASSWORD = '/forgor-password';
  static const STORES = '/stores';
  static const CREATE_STORES = '/store/create-stores';
  static const EDIT_STORE = '/store/edit-store';
  static const FIRST_PAGE = '/shopping/first-page';
}
