import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tecom/common/widgets/appbar/appbar.dart';
import 'package:tecom/common/widgets/layouts/grid_layout.dart';
import 'package:tecom/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:tecom/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Popular Products'), showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              DropdownButtonFormField(
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort),),
                onChanged: (value){},
                items: [
                  'Name',
                  'Higher Price',
                  'Lower Price',
                  'Sale',
                  'Newest',
                  'Popularity'
                ].map((option) => DropdownMenuItem(value: option, child: Text(option)),).toList(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Products
              TGridLayout(
                itemCount: 10,
                itemBuilder: (_, index) => const TProductCardVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
