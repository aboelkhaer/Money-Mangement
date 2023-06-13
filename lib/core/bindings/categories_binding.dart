import 'package:money_mangement/controllers/categories_controller.dart';
import 'package:money_mangement/exports.dart';

class CategoriesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(() => CategoriesController());
  }
}
