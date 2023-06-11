import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_mangement/exports.dart';

class AuthController extends GetxController {
  RxBool isAuthLoading = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void onInit() {
    user = Rx<User?>(auth.currentUser);
    user.bindStream(auth.userChanges());

    // displayName = userProfile != null ? userProfile!.displayName! : '';
    displayName = user.value != null ? user.value!.displayName! : '';
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   if (auth.currentUser != null) {
    //     Get.toNamed(AppRoutes.goToHomeRoute());
    //   }
    // });

    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  final _googleSignIn = GoogleSignIn();
  var displayName = '';
  // User? get userProfile => auth.currentUser;
  late Rx<User?> user;

  RxBool isSignIn = false.obs;

  signInWithGoogle() async {
    isAuthLoading.value = true;
    try {
      googleAccount.value = await GoogleSignIn().signIn();
      displayName = googleAccount.value!.displayName!;
      isSignIn.value = true;
      final GoogleSignInAuthentication googleAuth =
          await googleAccount.value!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      isSignIn.value = true;
      isAuthLoading.value = false;
      Get.offAndToNamed(AppRoutes.goToHomeRoute());
    } catch (e) {
      isAuthLoading.value = false;
      if (e.toString() == 'Null check operator used on a null value') {
        return Get.snackbar(
          'Authentication',
          'Authentication has been canceled.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      log(e.toString());
      Get.snackbar(
        'Error occured',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  signOut() async {
    try {
      await auth.signOut();
      await _googleSignIn.signOut();
      isSignIn.value = false;
      displayName = '';
      update();
      Get.offAllNamed(AppRoutes.goToAuthRoute());
    } catch (e) {
      Get.snackbar(
        'Error occured',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
