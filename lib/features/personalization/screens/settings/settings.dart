import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tecom/common/widgets/appbar/appbar.dart';
import 'package:tecom/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:tecom/common/widgets/layouts/list_tiles/settings_menu_tile.dart';
import 'package:tecom/common/widgets/texts/section_heading.dart';
import 'package:tecom/data/repositories/authentication/authentication_repository.dart';
import 'package:tecom/features/authentication/controllers/signup/signup_controller.dart';
import 'package:tecom/features/personalization/screens/address/address.dart';
import 'package:tecom/features/shop/screens/order/order.dart';
import 'package:tecom/utils/constants/colors.dart';
import 'package:tecom/utils/constants/sizes.dart';
import '../../../../common/widgets/layouts/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../shop/screens/cart/cart.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _enable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),),
                  ),

                  /// User Profile Card
                  const TUserProfileTile(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace,),
              child: Column(
                children: [
                  ///Account Settings
                  const TSectionHeading(title: 'Account Settings', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery address',
                    onTap: () => Get.to( () => const UserAddressScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove products and move to checkout',
                    onTap: () => Get.to( () => const CartScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed Orders',
                    onTap: () => Get.to( () => const OrderScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: (){},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupon',
                    subTitle: 'List of all the discounted coupons',
                    onTap: (){},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification message',
                    onTap: (){},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',
                    onTap: (){},
                  ),

                  ///App Settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(title: 'App Settings', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Iconsax.cloud_lightning,
                    title: 'Change Theme',
                    subTitle: 'Change dark or light theme',
                    trailing: Switch(
                      value: _enable,
                      onChanged: (val) {
                        setState(() {
                          _enable = val;
                          if(val){
                            Get.changeThemeMode(ThemeMode.dark);
                          }else{
                            Get.changeThemeMode(ThemeMode.light);
                          }
                        });
                      },
                    ),
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload Data to your Cloud Firebase',
                    onTap: (){},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value){}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value){}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {},),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                  ///Create Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => AuthenticationRepository().logOut(),
                      child: const Text(TTexts.logOut),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
