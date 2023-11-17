import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecom/common/widgets/appbar/appbar.dart';
import 'package:tecom/common/widgets/layouts/grid_layout.dart';
import 'package:tecom/common/widgets/texts/section_heading.dart';
import 'package:tecom/features/shop/screens/brand/brand_products.dart';
import 'package:tecom/utils/constants/sizes.dart';

import '../../../../common/widgets/brand/brand_card.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Heading
              const TSectionHeading(title: 'Brands', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Heading
              TGridLayout(
                itemCount: 20,
                mainAxisExtent: 80,
                itemBuilder: (_, index) => TBrandCard(showBorder: true, onTap: () => Get.to( () => const BrandProducts(),),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
