import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:tecom/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:tecom/common/widgets/products/ratings/rating_indicator.dart';
import 'package:tecom/utils/constants/colors.dart';
import 'package:tecom/utils/constants/image_strings.dart';
import 'package:tecom/utils/constants/sizes.dart';
import 'package:tecom/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage2),
                ),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge,),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert),),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        ///Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text('16 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job guys!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' Show Less',
          trimCollapsedText: ' Show More',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        ///Company Review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Mihal\'s Store', style: Theme.of(context).textTheme.titleMedium,),
                    Text('12 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),

                const SizedBox(height: TSizes.spaceBtwItems,),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job guys!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' Show Less',
                  trimCollapsedText: ' Show More',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),
      ],
    );
  }
}
