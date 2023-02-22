import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/core/resources/colors_manager.dart';
import 'package:getx_ecommerce/model/user_model.dart';
import 'package:getx_ecommerce/view/home/home_screen.dart';
import 'package:getx_ecommerce/view/login/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../services/firesotore_user.dart';

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
      await _auth.signInWithCredential(credential).then(
        (user) async {
          if (user.user != null) {
            _savaUser(user);
          }
        },
      );
    }
  }

  void facebookSignInMethod() async {
    FacebookLoginResult result = await _facebookLogin.logIn(permissions: [
      FacebookPermission.email,
      FacebookPermission.publicProfile
    ]);
    final FacebookAccessToken? accessToken = result.accessToken;
    if (accessToken != null) {
      if (result.status == FacebookLoginStatus.success) {
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);

        await _auth.signInWithCredential(credential).then(
          (user) async {
            if (user.user != null) {
              _savaUser(user);
            }
          },
        );
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

  void emailAndPasswordCreateAccount() async {
    try {
      await _auth.createUserWithEmailAndPassword(
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

  void emailAndPasswordSignUpMethod() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then(
        (user) async {
          if (user.user != null) {
            _savaUser(user);
          }
        },
      );
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error sign up account',
        e.toString(),
        colorText: ColorsManager.blackColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void logout() {
    _auth.signOut();
  }

  Future<void> _savaUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user?.uid,
      username: name ?? user.user?.displayName,
      email: user.user?.email,
      image: user.user?.photoURL ?? '',
    );

    await FirestoreUser().addUserToFirestore(userModel);
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
