import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tecom/data/repositories/user/user_repository.dart';
import 'package:tecom/features/personalization/models/user_model.dart';
import 'package:tecom/loaders.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

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
}