import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../utils/constants/sizes.dart';
import 'package:tecom/common/widgets/texts/product_price_text.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections,),
      itemBuilder: (_, index) => Column(
        children: [
          const TCartItem(),
          if(showAddRemoveButton) const SizedBox(height: TSizes.spaceBtwItems),

          ///Add Remove Button Row with total Price
          if(showAddRemoveButton)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ///Extra Space
                  SizedBox(width: 70),

                  ///Add Remove Buttons
                  TProductQuantityWithAddRemove(),
                ],
              ),
              ///Product Total Price
              TProductPriceText(price: '256'),
            ],
          ),
        ],
      ),
    );
  }
}
