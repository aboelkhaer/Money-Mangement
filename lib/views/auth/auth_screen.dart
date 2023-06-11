import 'package:money_mangement/exports.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.emailFocusNode.unfocus();
        controller.passwordFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.setHeight(context, 0.03)),
                  CustomTextFormField(
                    title: 'Email',
                    focusNode: controller.emailFocusNode,
                    textEditingController: controller.emailController,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: SizeConfig.setHeight(context, 0.01)),
                  CustomTextFormField(
                    title: 'Password',
                    focusNode: controller.passwordFocusNode,
                    textEditingController: controller.passwordController,
                    textInputType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Forget Password?',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                      bottom: 24,
                    ),
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey),
                        child: const Text('Sign In'),
                      ),
                    ),
                  ),
                  Row(
                    children: const [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text('OR'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: SizeConfig.setHeight(context, 0.025)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: SocialLoginButton(
                      buttonType: SocialLoginButtonType.facebook,
                      fontSize: 16,
                      onPressed: () {},
                    ),
                  ),
                  Obx(() {
                    return controller.isAuthLoading.value
                        ? const CircularProgressIndicator()
                        : SocialLoginButton(
                            buttonType: SocialLoginButtonType.google,
                            fontSize: 16,
                            onPressed: () {
                              controller.signInWithGoogle();
                            },
                          );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
