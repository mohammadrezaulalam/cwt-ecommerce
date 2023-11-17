import 'package:flutter/material.dart';
import 'package:tecom/common/widgets/appbar/appbar.dart';
import 'package:tecom/common/widgets/images/t_rounded_image.dart';
import 'package:tecom/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:tecom/common/widgets/texts/section_heading.dart';
import 'package:tecom/utils/constants/image_strings.dart';
import 'package:tecom/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Sports'), showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              const TRoundedImage(
                width: double.infinity,
                height: null,
                imageUrl: TImages.promoBanner4,
                applyImageRadius: true,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Sub Categories
              Column(
                children: [
                  ///Heading
                  TSectionHeading(title: 'Sport Shirts', onPressed: (){},),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems,),
                      itemBuilder: (context, index) => const TProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),

              ///Sub Categories 2 [Not in tutorial, I have added extra]
              Column(
                children: [
                  ///Heading
                  TSectionHeading(title: 'Track Suits', onPressed: (){},),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems,),
                      itemBuilder: (context, index) => const TProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),

              ///Sub Categories 3 [Not in tutorial, I have added extra]
              Column(
                children: [
                  ///Heading
                  TSectionHeading(title: 'Sport Shoes', onPressed: (){},),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems,),
                      itemBuilder: (context, index) => const TProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),
            ],
          ),
        ),
      ),
    );
  }
}
