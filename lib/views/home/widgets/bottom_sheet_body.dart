import 'package:money_mangement/exports.dart';

class BottomSheetBody extends GetView<HomeController> {
  final String? defaultChoice;
  const BottomSheetBody(this.defaultChoice, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.focusNode.unfocus(),
      child: Container(
        alignment: Alignment.topCenter,
        height: SizeConfig.setHeight(context, 0.7),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Add Transaction',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              Row(
                children: const [
                  Text(
                    'Transaction type:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: CustomRadioButton(
                      elevation: 0,
                      absoluteZeroSpacing: true,
                      defaultSelected: defaultChoice,
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
                      margin: const EdgeInsets.only(left: 16),
                      buttonTextStyle: const ButtonTextStyle(
                          selectedColor: Colors.white,
                          unSelectedColor: Colors.black,
                          textStyle: TextStyle(fontSize: 16)),
                      radioButtonValue: (value) {
                        controller.transactionType = value;
                        controller.focusNode.unfocus();
                      },
                      selectedColor: AppColors.skipButton,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: const [
                  Text(
                    'Category:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Flexible(
                      child: CustomRadioButton(
                        elevation: 0,
                        absoluteZeroSpacing: true,
                        unSelectedColor: Colors.white,
                        unSelectedBorderColor: AppColors.skipButton,
                        autoWidth: true,
                        buttonLables: controller.allCategories
                            .map((e) => e.name!)
                            .toList(),
                        buttonValues: controller.allCategories
                            .map((e) => e.name!)
                            .toList(),
                        enableShape: true,
                        margin: const EdgeInsets.only(left: 16),
                        buttonTextStyle: const ButtonTextStyle(
                            selectedColor: Colors.white,
                            unSelectedColor: Colors.black,
                            textStyle: TextStyle(fontSize: 16)),
                        radioButtonValue: (value) {
                          controller.transactionCategory = value;
                          controller.focusNode.unfocus();
                        },
                        selectedColor: AppColors.skipButton,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: const [
                  Text(
                    'Money:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.symmetric(vertical: 16),
                height: 60,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  focusNode: controller.focusNode,
                  controller: controller.moneyController,
                  cursorColor: AppColors.skipButton,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          color: AppColors.skipButton, style: BorderStyle.none),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: AppColors.skipButton)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.red)),
                    filled: true,
                    fillColor: Colors.grey[1000],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Obx(() => controller.isAddTransactionLoading.value
                    ? const CircularProgressIndicator(
                        color: AppColors.skipButton,
                      )
                    : SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.addTransaction();
                            controller.focusNode.unfocus();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.skipButton),
                          child: const Text(
                            'Send',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
