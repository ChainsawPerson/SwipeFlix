import 'package:flutter/material.dart';
import 'package:swipeflix/core/app_export.dart';
import 'package:swipeflix/presentation/homepage_screen/homepage_screen.dart';
import 'package:swipeflix/presentation/searchpage_screen/searchpage_screen.dart';



class ListsScreen extends StatelessWidget {
  const ListsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          // Note: Sensitivity is an integer used when you don't want to mess up vertical drag
          int sensitivity = 0;
          if (details.primaryDelta! > sensitivity) {
            // left Swipe
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          } else if (details.primaryDelta! < -sensitivity) {
            // right Swipe
          }
        },
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildFive(context),
                SizedBox(height: 19.v),
                _buildTwentyThree(context),
                SizedBox(height: 23.v),
                Text(
                  "Watch Later",
                  style: CustomTextStyles.titleLarge23,
                ),
                SizedBox(height: 11.v),
                Padding(
                  padding: EdgeInsets.only(
                    left: 42.h,
                    right: 35.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 231.v,
                        width: 226.h,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgSearchiconIndigo900,
                              height: 30.v,
                              width: 38.h,
                              alignment: Alignment.bottomRight,
                              margin: EdgeInsets.only(bottom: 19.v),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 219.h,
                                margin: EdgeInsets.only(right: 7.h),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 58.h,
                                  vertical: 25.v,
                                ),
                                decoration: AppDecoration.gradientIndigoToIndigo
                                    .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder28,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CustomImageView(
                                      imagePath: ImageConstant.imgHomeIndigo900,
                                      height: 23.v,
                                      width: 21.h,
                                      margin: EdgeInsets.only(
                                        top: 157.v,
                                        bottom: 1.v,
                                      ),
                                    ),
                                    CustomImageView(
                                      imagePath:
                                          ImageConstant.imgMegaphoneIndigo900,
                                      height: 19.v,
                                      width: 24.h,
                                      margin: EdgeInsets.only(
                                        top: 162.v,
                                        right: 13.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 231.v,
                        width: 56.h,
                        margin: EdgeInsets.only(left: 1.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            28.h,
                          ),
                          gradient: LinearGradient(
                            begin: Alignment(0.5, 0),
                            end: Alignment(0.5, 1),
                            colors: [
                              appTheme.indigo600,
                              appTheme.indigo600.withOpacity(0),
                            ],
                          ),
                        ),
                      ),
                      // Navigation Buttons
                        Row(
                          // Row of Navigation Buttons
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Home
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.home_outlined),
                              color: Theme.of(context).colorScheme.secondary,
                              iconSize: 35,
                            ),
                            // List
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Homepage()),
                                );
                              },
                              icon: Icon(Icons.list_outlined),
                              color: Theme.of(context).colorScheme.secondary,
                              iconSize: 35,
                            ),
                            // Search
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SearchpageScreen()),
                                );
                              },
                              icon: const Icon(Icons.search),
                              color: Theme.of(context).colorScheme.secondary,
                              iconSize: 35,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
    );
  }

  /// Section Widget
  Widget _buildFive(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 151.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.fillIndigo,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 1.v),
          Image(
            image: AssetImage('assets/images/Logo_update_full.png'),
            height: 58.adaptSize,
            width: 58.adaptSize,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTwentyThree(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 38.h),
      child: Column(
        children: [
          Text(
            "My Favourites",
            style: CustomTextStyles.titleLarge23,
          ),
          SizedBox(height: 13.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 231.v,
                width: 219.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    28.h,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment(0.5, 0),
                    end: Alignment(0.5, 1),
                    colors: [
                      appTheme.indigo600,
                      appTheme.indigo600.withOpacity(0),
                    ],
                  ),
                ),
              ),
              Container(
                height: 231.v,
                width: 56.h,
                margin: EdgeInsets.only(left: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    28.h,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment(0.5, 0),
                    end: Alignment(0.5, 1),
                    colors: [
                      appTheme.indigo600,
                      appTheme.indigo600.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
