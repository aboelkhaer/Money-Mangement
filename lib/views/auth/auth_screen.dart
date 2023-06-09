import 'package:money_mangement/exports.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(child: BackgroundImage()),
              controller.isAuthLoading.value
                  ? const Expanded(
                      child: Center(
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SocialLoginButton(
                          buttonType: SocialLoginButtonType.google,
                          fontSize: 16,
                          onPressed: () {
                            controller.signInWithGoogle();
                          },
                        ),
                      ),
                    ),
              const Expanded(
                child: SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
