import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecom/common/styles/spacing_styles.dart';
import 'package:tecom/common/widgets/login_signup/form_divider.dart';
import 'package:tecom/common/widgets/login_signup/social_buttons.dart';
import 'package:tecom/features/authentication/screens/login/widgets/login_form.dart';
import 'package:tecom/features/authentication/screens/login/widgets/login_header.dart';
import 'package:tecom/utils/constants/sizes.dart';
import 'package:tecom/utils/constants/text_strings.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Logo, Title & Subtitle
              const LoginHeader(),

              /// Form
              const LoginForm(),

              ///Divider
              FormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),
              ///Footer
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
