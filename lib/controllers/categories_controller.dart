import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_mangement/exports.dart';
import 'package:money_mangement/models/category_model.dart';

class CategoriesController extends GetxController {
  TextEditingController categoryController = TextEditingController();
  HomeController homeController = Get.put(HomeController());
  late CollectionReference categoryReference;
  RxBool isAddingCategory = false.obs;

  FocusNode categoryFocusNode = FocusNode();
  late RxList<CategoryModel> argumentData;
  @override
  void onInit() {
    argumentData = Get.arguments;
    categoryReference = homeController.firebasefirestore.collection('category');
    super.onInit();
  }

  @override
  void onClose() {
    categoryController.dispose();
    categoryFocusNode.dispose();
    super.onClose();
  }

  addCategory() {
    isAddingCategory.value = true;
    if (categoryController.text.isNotEmpty && categoryController.text != '') {
      try {
        var result = categoryReference.add({
          'category_name': categoryController.text,
          'counter_usage': '0',
          'date': Timestamp.now(),
          'is_general': false,
          'user_id': homeController.authController.user.value!.uid,
        });
        isAddingCategory.value = false;
        Get.snackbar('Success', 'Added category successfully.',
            snackPosition: SnackPosition.BOTTOM);
        categoryController.text = '';
        return result;
      } on FirebaseException catch (e) {
        Get.snackbar('Error occurred', e.toString(),
            snackPosition: SnackPosition.BOTTOM);
        isAddingCategory.value = false;
      }
    } else {
      Get.snackbar('Error occurred', 'Add empty data.',
          snackPosition: SnackPosition.BOTTOM);
      isAddingCategory.value = false;
    }
  }

  deleteCategory(String id) {
    categoryReference.doc(id).delete().whenComplete(() => log('done'));
  }
}
