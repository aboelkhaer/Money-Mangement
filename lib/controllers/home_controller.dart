import 'package:money_mangement/exports.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AuthController authController = Get.put(AuthController());

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 4);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  RxInt bottomNavIndex = 0.obs;

  late TabController tabController;

  void modalBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            alignment: Alignment.center,
            height: SizeConfig.setHeight(context, 0.5),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomRadioButton(
                      elevation: 0,
                      absoluteZeroSpacing: true,
                      unSelectedColor: Colors.white,
                      unSelectedBorderColor: AppColors.skipButton,
                      buttonLables: const [
                        'Income',
                        'Expense',
                      ],
                      buttonValues: const [
                        'Income',
                        'Expense',
                      ],
                      enableShape: true,
                      margin: const EdgeInsets.only(left: 20),
                      buttonTextStyle: const ButtonTextStyle(
                          selectedColor: Colors.white,
                          unSelectedColor: Colors.black,
                          textStyle: TextStyle(fontSize: 16)),
                      radioButtonValue: (value) {
                        print(value);
                      },
                      selectedColor: AppColors.skipButton,
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
