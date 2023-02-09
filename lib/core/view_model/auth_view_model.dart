import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/core/resources/colors_manager.dart';
import 'package:getx_ecommerce/view/home/home_screen.dart';
import 'package:getx_ecommerce/view/login/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();

  String? email, name, password;

  final Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  @override
  void onInit() {
    _user.bindStream(_auth.authStateChanges());
    ever(_user, _setInitialScreen);
    super.onInit();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      await _auth.signInWithCredential(credential);
    }
  }

  void facebookSignInMethod() async {
    FacebookLoginResult result = await _facebookLogin.logIn();
    final FacebookAccessToken? accessToken = result.accessToken;
    if (accessToken != null) {
      if (result.status == FacebookLoginStatus.success) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);

        await _auth.signInWithCredential(credential);
      }
    }
  }

  void emailAndPasswordSignInMethod() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
    } catch (e) {
      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: ColorsManager.blackColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void _setInitialScreen(User? user) {
    if (user == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => const LoginScreen());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => const HomeScreen());
    }
  }
}
