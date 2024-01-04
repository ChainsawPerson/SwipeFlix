import 'package:flutter/material.dart';
import 'package:swipeflix/core/app_export.dart';

class ListsScreen extends StatelessWidget {
  const ListsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTelevisionSection(context),
                SizedBox(height: 19.v),
                _buildMyFavouritesSection(context),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTelevisionSection(BuildContext context) {
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
          CustomImageView(
            imagePath: ImageConstant.imgTelevision,
            height: 58.adaptSize,
            width: 58.adaptSize,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildMyFavouritesSection(BuildContext context) {
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
