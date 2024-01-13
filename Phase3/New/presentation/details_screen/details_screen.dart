import 'package:flutter/material.dart';
import 'package:swipeflix/core/app_export.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildEight(context),
              _buildEleven(context),
              Container(
                padding: EdgeInsets.symmetric(vertical: 7.v),
                decoration: AppDecoration.fillErrorContainer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 8.h,
                          right: 69.h,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 68.h,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.h,
                                vertical: 7.v,
                              ),
                              decoration: AppDecoration.outlineIndigo.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder8,
                              ),
                              child: Text(
                                "Sci-Fi",
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                            Container(
                              width: 117.h,
                              margin: EdgeInsets.only(left: 12.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.h,
                                vertical: 5.v,
                              ),
                              decoration: AppDecoration.outlineIndigo.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder8,
                              ),
                              child: Text(
                                "Documenatry",
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                            Container(
                              width: 74.h,
                              margin: EdgeInsets.only(left: 12.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.h,
                                vertical: 7.v,
                              ),
                              decoration: AppDecoration.outlineIndigo.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder8,
                              ),
                              child: Text(
                                "Horror",
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 9.v),
                    _buildSix(context),
                    SizedBox(height: 10.v),
                    Container(
                      height: 58.adaptSize,
                      width: 58.adaptSize,
                      decoration: AppDecoration.fillErrorContainer.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder28,
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgHome58x58,
                        height: 58.adaptSize,
                        width: 58.adaptSize,
                        radius: BorderRadius.circular(
                          29.h,
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                    SizedBox(height: 3.v),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEight(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillIndigo,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 78.v),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 97.h,
              vertical: 3.v,
            ),
            decoration: AppDecoration.fillBlueGray,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 1.v),
                Text(
                  "Title of the Movie",
                  style: theme.textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEleven(BuildContext context) {
    return SizedBox(
      height: 192.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage3,
            height: 192.v,
            width: 360.h,
            alignment: Alignment.center,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgOverflowMenu,
            height: 75.adaptSize,
            width: 75.adaptSize,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 50.v),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSix(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 123.h,
        vertical: 1.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer,
      child: Text(
        "Description:",
        style: theme.textTheme.titleLarge,
      ),
    );
  }
}
