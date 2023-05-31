import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_mangement/exports.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    displayName = userProfile != null ? userProfile!.displayName! : '';
    super.onInit();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  final _googleSignIn = GoogleSignIn();
  var displayName = '';
  User? get userProfile => auth.currentUser;

  RxBool isSignIn = false.obs;

  signInWithGoogle() async {
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
      Get.offAndToNamed(AppRoutes.goToHomeRoute());
    } catch (e) {
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
