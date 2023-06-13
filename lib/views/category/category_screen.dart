import 'dart:developer';

import 'package:money_mangement/controllers/categories_controller.dart';
import 'package:money_mangement/exports.dart';

class CategoriesScreen extends GetView<CategoriesController> {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => controller.categoryFocusNode.unfocus(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CustomTextFormField(
                  title: 'Category',
                  textInputType: TextInputType.text,
                  textEditingController: controller.categoryController,
                  focusNode: controller.categoryFocusNode,
                ),
                Obx(
                  () => controller.isAddingCategory.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            controller.addCategory();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.skipButton),
                          child: const Text(
                            'Add Category',
                          ),
                        ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 50, bottom: 20),
                  child: const Text(
                    'Your categories:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.argumentData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Container(
                              margin: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(controller.argumentData[index].name!),
                                  GestureDetector(
                                    onTap: () {
                                      controller.deleteCategory(
                                          controller.argumentData[index].id!);
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
