import 'package:flutter/material.dart';
import 'package:swipeflix/core/app_export.dart';
import 'package:swipeflix/widgets/app_bar/appbar_iconbutton.dart';
import 'package:swipeflix/widgets/app_bar/appbar_title_image.dart';
import 'package:swipeflix/widgets/app_bar/custom_app_bar.dart';
import 'package:swipeflix/widgets/custom_elevated_button.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          height: 567.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage3,
                height: 567.v,
                width: 360.h,
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomElevatedButton(
                      height: 35.v,
                      text: "Spiderman",
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      buttonTextStyle: theme.textTheme.titleLarge!,
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 39.h,
                        right: 35.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgSwipebuttonleft2,
                            height: 58.adaptSize,
                            width: 58.adaptSize,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgBookmark,
                            height: 37.v,
                            width: 25.h,
                            margin: EdgeInsets.only(
                              top: 10.v,
                              bottom: 11.v,
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgLikeanimation,
                            height: 58.adaptSize,
                            width: 58.adaptSize,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 13.v),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 100.h,
                        right: 92.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgHome,
                            height: 23.v,
                            width: 21.h,
                            margin: EdgeInsets.only(bottom: 7.v),
                          ),
                          Spacer(
                            flex: 52,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgMegaphone,
                            height: 19.v,
                            width: 24.h,
                            margin: EdgeInsets.only(
                              top: 5.v,
                              bottom: 6.v,
                            ),
                          ),
                          Spacer(
                            flex: 47,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgSearchicon,
                            height: 30.v,
                            width: 38.h,
                          ),
                        ],
                      ),
                    ),
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
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitleImage(
        imagePath: ImageConstant.imgTelevision,
      ),
      actions: [
        Container(
          margin: EdgeInsets.fromLTRB(15.h, 11.v, 15.h, 22.v),
          decoration: AppDecoration.fillBlack.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder20,
          ),
          child: AppbarIconbutton(
            imagePath: ImageConstant.imgSearch,
          ),
        ),
      ],
      styleType: Style.bgFill,
    );
  }
}