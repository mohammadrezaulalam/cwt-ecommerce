import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tecom/features/authentication/controllers/login/login_controller.dart';
import 'package:tecom/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:tecom/features/authentication/screens/signup/signup.dart';
import 'package:tecom/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Form(
        key: loginController.loginFormKey,
        child: Column(
          children: [
            ///Email
            TextFormField(
              controller: loginController.email,
              validator: (value) => TValidator.validateEmptyText('password', value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            ///Password
            Obx(
                  () => TextFormField(
                controller: loginController.password,
                validator: (value) =>
                    TValidator.validateEmptyText('Password', value),
                obscureText: loginController.hidePassword.value,
                //expands: false,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => loginController.hidePassword.value = !loginController.hidePassword.value,
                    icon: Icon(loginController.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            ///Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Remember Me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: loginController.rememberMe.value,
                          onChanged: (value) => loginController.rememberMe
                              .value = !loginController.rememberMe.value),
                    ),
                    const Text(TTexts.rememberMe),
                  ],
                ),

                ///Forget Password
                TextButton(onPressed: () => Get.to( () => const ForgetPassword(), ),
                  child: const Text(TTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            ///SignIn Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => loginController.emailAndPasswordLogin(),
                child: const Text(TTexts.signIn),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            ///Create Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const SignUpScreen());
                },
                child: const Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
