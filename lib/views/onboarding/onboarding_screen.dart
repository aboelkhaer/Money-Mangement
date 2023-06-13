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
      backgroundColor: Colors.white,
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
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(
                      bottom: SizeConfig.setHeight(context, 0.17)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.setHeight(context, 0.2),
                      ),
                      Image.asset(
                        controller.onboardingBody[index].image,
                        height: SizeConfig.setHeight(context, 0.3),
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: SizeConfig.setHeight(context, 0.08)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              controller.onboardingBody[index].title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              controller.onboardingBody[index].description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 20,
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
                            color: Colors.black,
                          ),
                          const SizedBox(width: 14),
                          const Text(
                            'Explore our best feature',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
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
                          color: Colors.black54,
                          activeColor: Colors.black,
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
