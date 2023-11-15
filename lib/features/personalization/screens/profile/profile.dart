import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tecom/common/widgets/appbar/appbar.dart';
import 'package:tecom/common/widgets/images/t_circular_image.dart';
import 'package:tecom/common/widgets/texts/section_heading.dart';
import 'package:tecom/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:tecom/utils/constants/image_strings.dart';
import 'package:tecom/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(
                      image: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),

              ///Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                title: 'Profile Information', showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'Name', value: 'Arman Sadi', onPressed: (){},),
              TProfileMenu(title: 'Username', value: 'armanSadi', onPressed: (){},),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Heading Personal Info
              const TSectionHeading(title: 'Personal Information', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'User ID', value: '26103', icon: Iconsax.copy, onPressed: (){},),
              TProfileMenu(title: 'E-mail', value: 'me@armansadi.xyz', onPressed: (){},),
              TProfileMenu(title: 'Phone Number', value: '01792 555555', onPressed: (){},),
              TProfileMenu(title: 'Gender', value: 'Male', onPressed: (){},),
              TProfileMenu(title: 'Date of Birth', value: '26 June 2008', onPressed: (){},),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              
              Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text('Close Account', style: TextStyle(color: Colors.red),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
