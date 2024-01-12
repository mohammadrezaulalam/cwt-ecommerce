import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecom/data/repositories/authentication/authentication_repository.dart';
import 'package:tecom/data/repositories/user/user_repository.dart';
import 'package:tecom/features/authentication/screens/signup/verify_email.dart';
import 'package:tecom/loaders.dart';
import 'package:tecom/utils/constants/image_strings.dart';
import 'package:tecom/utils/popups/full_screen_loader.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../../personalization/models/user_model.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();
  //SignupController();

  ///Variables
  final hidePassword = true.obs; //Observable for hiding/showing password
  final privacyPolicy = true.obs; //Observable for privacy policy acceptance
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///SignUp
  void signup() async {
    try{
      //Start Loading
      TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.docerAnimation);

      //TFullScreen

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if(!signupFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //Privacy Policy Check
      if(!privacyPolicy.value){
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'In order to create account, you must have to read and accept Terms of use and privacy policy.'
        );
        return;
      }

      //Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          userName: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      //Show success message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue.',
      );

      //Move to verify Email Screen
      Get.to( () => VerifyEmailScreen(email: email.text.trim()));

    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      //Show some generic errors to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}