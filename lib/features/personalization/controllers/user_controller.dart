import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecom/data/repositories/authentication/authentication_repository.dart';
import 'package:tecom/data/repositories/user/user_repository.dart';
import 'package:tecom/features/authentication/screens/login/login.dart';
import 'package:tecom/features/personalization/models/user_model.dart';
import 'package:tecom/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:tecom/loaders.dart';
import 'package:tecom/utils/constants/sizes.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;


  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit(){
    fetchUserRecord();
    super.onInit();

  }

  /// Fetch User Record
  Future<void>fetchUserRecord() async{
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally{
      profileLoading.value = false;
    }
  }


  /// Save user records form any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if(userCredentials != null){
        // Convert Name to First and Last Name
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUserName(userCredentials.user!.displayName ?? '');

        // Map Data
        final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            userName: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // Save User Data
        await userRepository.saveUserRecord(user);

      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data Not Saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your profile.',
      );
    }

  }

  /// Delete Account Warning
  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red),),
        child: const Padding(padding: EdgeInsets.symmetric(horizontal: TSizes.lg), child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog('Processing...', TImages.docerAnimation);


      //First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        // Re Verify Auth Email
        if(provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          // Remove Loader
          TFullScreenLoader.stopLoading();
          Get.offAll( () => const LoginScreen());
        }else if(provider == 'password'){
          // Remove Loader
          TFullScreenLoader.stopLoading();
          Get.to( () => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Re-Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog('Processing...', TImages.docerAnimation);


      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if(!reAuthFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // //Show success message
      // TLoaders.successSnackBar(
      //   title: 'Email Sent',
      //   message: 'Email Link Sent to Reset Your Password'.tr,
      // );

      // Redirect
      Get.offAll( () => const LoginScreen());

    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}