import 'package:flutter/material.dart';
import 'package:tecom/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:tecom/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:tecom/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:tecom/utils/constants/sizes.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Product Image Slider
            TProductImageSlider(),

            /// Product Details
            Padding(
              padding: EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share Button
                  TRatingAndShare(),

                  /// Price, Title, Stock & Brand
                  TProductMetaData(),

                  /// Attributes
                  /// Checkout Button
                  /// Description
                  /// Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
