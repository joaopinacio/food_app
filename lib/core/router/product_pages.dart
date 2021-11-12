import 'package:food_app/pages/product/product_pages/product_add_page/product_add_page.dart';
import 'package:food_app/pages/product/product_pages/product_add_page/product_add_page_bindings.dart';
import 'package:food_app/pages/product/product_pages/product_edit_page/product_edit_page.dart';
import 'package:food_app/pages/product/product_pages/product_edit_page/product_edit_page_bindings.dart';
import 'package:get/get.dart';

mixin ProductPages {
  final productAdd = '/product_add';
  final productEdit = '/product_edit';

  get productAddPage => GetPage(
        name: productAdd,
        page: () => ProductAddPage(),
        binding: ProductAddPageBindings(),
        transition: Transition.cupertino,
      );

  get productEditPage => GetPage(
        name: productEdit,
        page: () => ProductEditPage(),
        binding: ProductEditPageBindings(),
        transition: Transition.cupertino,
      );

  List<GetPage<dynamic>> get getProductPagesList => [
        productAddPage,
        productEditPage,
      ];
}
