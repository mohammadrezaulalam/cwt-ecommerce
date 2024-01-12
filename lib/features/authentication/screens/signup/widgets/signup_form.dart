import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tecom/features/authentication/controllers/signup/signup_controller.dart';
import 'package:tecom/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:tecom/utils/validators/validation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key,});


  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupController());
    return Form(
      key: signupController.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: signupController.firstName,
                  validator: (value) => TValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields,),
              Expanded(
                child: TextFormField(
                  controller: signupController.lastName,
                  validator: (value) => TValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields,),
          ///Username
          TextFormField(
            controller: signupController.userName,
            validator: (value) => TValidator.validateEmptyText('User Name', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields,),

          ///Email
          TextFormField(
            controller: signupController.email,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields,),

          ///Phone Number
          TextFormField(
            controller: signupController.phoneNumber,
            validator: (value) => TValidator.validateEmptyText('Phone Number', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields,),

          ///Email
          Obx(
            () => TextFormField(
              controller: signupController.password,
              validator: (value) =>
                  TValidator.validateEmptyText('Password', value),
              obscureText: signupController.hidePassword.value,
              //expands: false,
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => signupController.hidePassword.value =
                      !signupController.hidePassword.value,
                  icon: Icon(signupController.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections,),

          ///Terms&Conditions Checkbox
          const TermsAndConditionsCheckBox(),
          const SizedBox(height: TSizes.spaceBtwSections),
          ///Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => signupController.signup(),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}

