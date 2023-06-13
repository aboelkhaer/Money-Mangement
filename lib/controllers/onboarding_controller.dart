import 'package:money_mangement/exports.dart';

class OnboardingController extends GetxController {
  PageController pageController = PageController();

  List<OnboardingModel> onboardingBody = <OnboardingModel>[
    OnboardingModel(
      title: 'Track your expenses',
      image: AppImages.onboarding2,
      description:
          'All your spends, credit card and E-wallet money all at one place',
    ),
    OnboardingModel(
      title: 'Set your budget',
      image: AppImages.onboarding3,
      description:
          'You can set your daily, monthly and weekly budget with this app',
    ),
    OnboardingModel(
      title: 'Mange your Bills',
      image: AppImages.onboarding4,
      description: 'You can mange your Bills easliy after scan your bills',
    ),
  ];

  int tabsLenght = 3;

  RxInt tabIndex = 0.obs;
}
