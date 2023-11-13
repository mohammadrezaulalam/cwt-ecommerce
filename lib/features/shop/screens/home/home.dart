import 'package:flutter/material.dart';
import 'package:tecom/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:tecom/features/shop/screens/home/widgets/home_categories.dart';
import 'package:tecom/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:tecom/utils/constants/colors.dart';
import 'package:tecom/utils/constants/image_strings.dart';
import 'package:tecom/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Searchbar
                  TSearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Categories Section
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        ///Heading
                        TSectionHeading(title: 'Popular Categories', showActionButton: false, textColor: TColors.white,),
                        SizedBox(height: TSizes.spaceBtwItems),
                        ///Categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///Body Section
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///Popular Products
                  TGridLayout(
                    itemCount: 2,
                    itemBuilder: (_, index) => const TProductCardVertical(),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}













