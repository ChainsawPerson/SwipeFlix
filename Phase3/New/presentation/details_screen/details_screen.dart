import 'package:flutter/material.dart';
import 'package:swipeflix/core/app_export.dart';
import 'package:swipeflix/presentation/homepage_screen/homepage_screen.dart';


class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double containerPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        // Detect downward swipe
        if (details.primaryDelta! > 8) {
          // Navigate to another page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
          );
        }
      },
    child: GestureDetector(
      onHorizontalDragUpdate: (details) {
        // Update the container position based on drag
        setState(() {
          containerPosition += details.primaryDelta!;
        });
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              _buildEight(context),
              _buildEleven(context),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 7.v),
                  decoration: AppDecoration.fillErrorContainer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.h, right: 12.h),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _buildGenreContainer("Sci-Fi"),
                                _buildGenreContainer("Documentary"),
                                _buildGenreContainer("Horror"),
                                _buildGenreContainer("Insane"),
                                _buildGenreContainer("Takis"),
                                _buildGenreContainer("Avgi"),
                                // Add more genres as needed
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildSix(context),
                      SizedBox(height: 10.v),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () {
                            // Your action when the button (image) is pressed
                            print("Button (image) pressed!");
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(29.h),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(29.h),
                              color: AppDecoration.fillErrorContainer.color,
                            ),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgHome58x58,
                              height: 58.adaptSize,
                              width: 58.adaptSize,
                              radius: BorderRadius.circular(29.h),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                    ], // Add this closing brace
                  ),
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
  
  Widget _buildGenreContainer(String genre) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 7.v,
      ),
      margin: EdgeInsets.only(left: 12.h),
      decoration: AppDecoration.outlineIndigo.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Text(
        genre,
        style: theme.textTheme.titleSmall,
        maxLines: 1,
        overflow: TextOverflow.visible, // Allow text overflow
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
              horizontal: 16.h,
              vertical: 3.v,
            ),
            decoration: AppDecoration.fillBlueGray,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 1.v,
                width: 300.v,),
                Text(
                  "Title of the Movie",
                  style: theme.textTheme.titleLarge,
                  maxLines: 1, // Set maxLines to 1
                  overflow: TextOverflow.ellipsis,
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

    Widget _buildSix(BuildContext context) {
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.h,
            vertical: 1.v,
          ),
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Description:\n hfjkdsksyfydjkslodjilaksxksaklsxkxkxkxkxkkxkxkxkxkkxxkxkxkxlz\n fhcdskjxsklz\n edhksjak",
              style: theme.textTheme.titleLarge,
            ),
          ),
        ),
      );
    }

}
