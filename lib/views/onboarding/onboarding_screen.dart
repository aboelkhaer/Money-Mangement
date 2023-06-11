import 'package:money_mangement/exports.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Obx(
        () => Stack(
          children: [
            PageView.builder(
              itemCount: controller.tabsLenght,
              controller: controller.pageController,
              onPageChanged: (value) {
                controller.tabIndex.value = value;
              },
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      bottom: SizeConfig.setHeight(context, 0.17)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        AppImages.onboarding1,
                        height: SizeConfig.setHeight(context, 0.3),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: SizeConfig.setHeight(context, 0.08)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: const [
                            Text(
                              'Mange your\nfinances more\neasier with\nmy app.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: SizeConfig.setHeight(context, 0.1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: SizeConfig.setWidth(context, 0.05),
                            height: 2,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 14),
                          const Text(
                            'Explore our best feature',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      DotsIndicator(
                        dotsCount: controller.tabsLenght,
                        position: controller.tabIndex.value,
                        decorator: DotsDecorator(
                          size: const Size.square(7.0),
                          activeSize: const Size(18.0, 9.0),
                          color: Colors.white30,
                          activeColor: Colors.white,
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(height: SizeConfig.setHeight(context, 0.08)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      controller.tabIndex.value == controller.tabsLenght - 1
                          ? const SizedBox.shrink()
                          : Expanded(
                              child: CustomButton(
                                color: AppColors.skipButton,
                                onTap: () {
                                  controller.pageController.animateToPage(
                                    controller.tabsLenght - 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                title: 'Skip',
                              ),
                            ),
                      controller.tabIndex.value == controller.tabsLenght - 1
                          ? const SizedBox.shrink()
                          : SizedBox(
                              width: SizeConfig.setWidth(context, 0.02),
                            ),
                      Expanded(
                        child: CustomButton(
                          onTap: () {
                            controller.pageController.animateToPage(
                              controller.tabIndex.value + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            if (controller.tabIndex.value ==
                                controller.tabsLenght - 1) {
                              Get.toNamed(AppRoutes.goToAuthRoute());
                            }
                          },
                          title: controller.tabIndex.value ==
                                  controller.tabsLenght - 1
                              ? 'Done'
                              : 'Next',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.setHeight(context, 0.03),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
