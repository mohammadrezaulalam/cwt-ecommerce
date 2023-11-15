import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tecom/features/shop/screens/home/home.dart';
import 'package:tecom/features/shop/screens/store/store.dart';
import 'package:tecom/features/shop/screens/wishlist/wishlist.dart';
import 'package:tecom/utils/constants/colors.dart';
import 'package:tecom/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          selectedIndex: navigationController.selectedIndex.value,
          elevation: 0,
          onDestinationSelected: (index) => navigationController.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : Colors.white,
          indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx( () => navigationController.screens[navigationController.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final RxInt selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavouriteScreen(),
    Container(color: Colors.blue),
  ];
}
