import 'package:flutter/material.dart';
import 'package:tecom/common/widgets/appbar/appbar.dart';
import 'package:tecom/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:tecom/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:tecom/utils/constants/sizes.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';


class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: const TAppBar(title: Text('Reviews & Ratings'), showBackArrow: true,),

      ///Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ratings and Reviews are verified and are from people who use the type of device that you use.'),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Overall Product Ratings
              const TOverallProductRating(),

              const TRatingBarIndicator(rating: 3.7,),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              ///User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}