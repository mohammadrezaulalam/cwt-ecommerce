import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tecom/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:tecom/features/authentication/controllers/login/login_controller.dart';
import 'package:tecom/utils/constants/sizes.dart';
import 'package:tecom/utils/validators/validation.dart';

import '../../../../utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    final loginController = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Headings
            Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(TTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwSections * 2),

            ///Input Field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right), labelText: TTexts.email,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //for resetting the loginFormKey value to a new value by Ratan
                  loginController.loginFormKey = GlobalKey<FormState>();
                  //print(loginController.loginFormKey);
                  controller.sendPasswordResetEmail();
                },
                child: const Text(TTexts.submit),
              ),
            ),

            ///Headings
          ],
        ),
      ),
    );
  }
}
