import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tecom/common/styles/shadows.dart';
import 'package:tecom/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tecom/common/widgets/images/t_rounded_image.dart';
import 'package:tecom/common/widgets/texts/product_title_text.dart';
import 'package:tecom/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:tecom/utils/constants/colors.dart';
import 'package:tecom/utils/constants/image_strings.dart';
import 'package:tecom/utils/constants/sizes.dart';
import 'package:tecom/utils/helpers/helper_functions.dart';
import '../../icons/t_circular_icon.dart';
import '../../texts/product_price_text.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
  final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  ///Thumbnail Image
                  const TRoundedImage(imageUrl: TImages.productImage1, applyImageRadius: true,),

                  ///Sale Tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                    ),
                  ),

                  ///Favourite Icon
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      icon: Iconsax.heart5,
                      color: TColors.favButton,
                      //backgroundColor: ,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// Details
            const Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: 'Green Nike Air Shoes', smallSize: true,),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(title: 'Nike'),

                ],
              ),
            ),

            // Add Spacer() here to keep the height of each Box same in case 1 or 2 lines of Headings
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Price
                const Padding(
                  padding: EdgeInsets.only(left: TSizes.sm),
                  child: TProductPriceText(price: '35.0'),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: TColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



