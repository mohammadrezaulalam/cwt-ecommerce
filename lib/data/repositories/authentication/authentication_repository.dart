import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tecom/features/authentication/screens/login/login.dart';
import 'package:tecom/features/authentication/screens/onboarding/onboarding.dart';
import 'package:tecom/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:tecom/utils/exceptions/firebase_exceptions.dart';
import 'package:tecom/utils/exceptions/format_exceptions.dart';
import 'package:tecom/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Call from main.dart on app launch
  @override
  void onReady(){
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to show relevant screen
  screenRedirect() async {
    //Local Storage
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true ? Get.offAll( () => const LoginScreen()) : Get.offAll( () => const OnBoardingScreen());
  }


/* ---------------------- Email & Password Sign In ---------------------- */

  /// [EmailAuthentication] - SignIn

  ///  [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///  [EmailVerification] - Mail Verification

  ///  [ReAuthenticate] - ReAuthenticate User
  ///  [EmailAuthentication] - Forget Password
  ///  [EmailAuthentication] - Register
  ///  [EmailAuthentication] - Register
  ///  [EmailAuthentication] - Register


/* ---------------------- Federated Identity & Social Sign In ---------------------- */
  /// [GoogleAuthentication] - Google

  /// [FacebookAuthentication] - Facebook

/* ---------------------- ./Federated Identity & Social Sign In ---------------------- */

  /// [LogoutUser] - Valid for any Authentication.

  /// [DeleteUser] - Remove User Auth & Firestore Account.

}