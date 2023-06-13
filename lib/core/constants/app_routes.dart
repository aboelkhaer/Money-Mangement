import 'package:money_mangement/core/bindings/categories_binding.dart';
import 'package:money_mangement/exports.dart';

class AppRoutes {
  static const String _homeScreen = '/homeScreen';
  static String goToHomeRoute() => _homeScreen;

  static const String _authScreen = '/authScreen';
  static String goToAuthRoute() => _authScreen;

  static const String _onboardingScreen = '/';
  static String goToOnboardingRoute() => _onboardingScreen;

  static const String _categoriesScreen = '/categories';
  static String goToCategoriesRoute() => _categoriesScreen;

  static List<GetPage> routes = [
    GetPage(
        page: () => const HomeScreen(),
        name: _homeScreen,
        transition: Transition.zoom,
        binding: HomeBinding()),
    GetPage(
        page: () => const OnboardingScreen(),
        name: _onboardingScreen,
        binding: OnboardingBinding()),
    GetPage(
        page: () => const AuthScreen(),
        name: _authScreen,
        binding: AuthBinding()),
    GetPage(
        page: () => const CategoriesScreen(),
        name: _categoriesScreen,
        // transition: Transition.size,
        binding: CategoriesBinding()),
  ];
}
