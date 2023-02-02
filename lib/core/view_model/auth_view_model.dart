import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/core/resources/colors_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();

  String? email, name, password;

  final Rx<User?> _user = Rx<User?>(null);

  String? get user => _user.value?.email;

  @override
  void onInit() {
    _user.bindStream(_auth.authStateChanges());
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
      print(e.toString());

      Get.snackbar(
        'Error login account',
        e.toString(),
        colorText: ColorsManager.blackColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
