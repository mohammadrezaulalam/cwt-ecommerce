import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tecom/data/repositories/authentication/authentication_repository.dart';
import 'package:tecom/features/authentication/screens/password_configuration/reset_password_screen.dart';

import '../../../../loaders.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();


  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog('Processing Your Request...', TImages.docerAnimation);


      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      //Show success message
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Email Link Sent to Reset Your Password'.tr,
      );

      // Redirect
      Get.to( () => ResetPasswordScreen(email: email.text.trim()));

    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Send Reset Password Email
  resendPasswordResetEmail(String email) async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog('Processing Your Request...', TImages.docerAnimation);


      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      //Show success message
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Email Link Sent to Reset Your Password'.tr,
      );


    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }


}