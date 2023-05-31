import 'package:money_mangement/exports.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: BackgroundImage()),
            Expanded(
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
            Expanded(
              child: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
