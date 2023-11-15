import 'package:flutter/material.dart';
import 'package:tecom/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:tecom/common/widgets/layouts/grid_layout.dart';
import 'package:tecom/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:tecom/features/shop/screens/store/widgets/category_tab.dart';
import 'package:tecom/utils/constants/colors.dart';
import 'package:tecom/utils/constants/sizes.dart';
import 'package:tecom/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brand/brand_card.dart';
import '../../../../common/widgets/texts/section_heading.dart';


class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium,),
          actions: [
            TCartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled){
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ///Search bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(text: '', showBorder: true, showBackground: false, padding: EdgeInsets.zero,),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      ///Featured Brands
                      TSectionHeading(title: 'Featured Brands', onPressed: (){},),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index){
                          // return GestureDetector(
                          //   onTap: (){},
                          //   child: TRoundedContainer(
                          //     padding: const EdgeInsets.all(TSizes.sm),
                          //     showBorder: true,
                          //     backgroundColor: Colors.transparent,
                          //     child: Row(
                          //       children: [
                          //         ///Icon
                          //         Flexible(
                          //           child: TCircularImage(
                          //             isNetworkImage: false,
                          //             image: TImages.clothIcon,
                          //             backgroundColor: Colors.transparent,
                          //             overlayColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
                          //           ),
                          //         ),
                          //         const SizedBox(width: TSizes.spaceBtwItems / 2,),
                          //
                          //         /// Text
                          //         Expanded(
                          //           child: Column(
                          //             mainAxisSize: MainAxisSize.min,
                          //             crossAxisAlignment: CrossAxisAlignment.start,
                          //             children: [
                          //               const TBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large,),
                          //               Text(
                          //                 '256 Products',
                          //                 overflow: TextOverflow.ellipsis,
                          //                 style: Theme.of(context).textTheme.labelMedium,
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // );

                          return TBrandCard(showBorder: true, onTap: (){},);
                        },
                      ),

                    ],
                  ),
                ),
                ///Tabs
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture'),),
                    Tab(child: Text('Electronics'),),
                    Tab(child: Text('Clothes'),),
                    Tab(child: Text('Cosmetics'),),
                  ],
                ),

              ),
            ];
          },
          body: const TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}

