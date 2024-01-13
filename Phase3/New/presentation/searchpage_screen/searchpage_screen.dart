// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:swipeflix/core/app_export.dart';
// import 'package:swipeflix/widgets/custom_search_view.dart';

// class SearchpageScreen extends StatelessWidget {
//   SearchpageScreen({Key? key})
//       : super(
//           key: key,
//         );

//   TextEditingController searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: theme.colorScheme.onError,
//         resizeToAvoidBottomInset: false,
//         body: SizedBox(
//           height: SizeUtils.height,
//           width: double.maxFinite,
//           child: Stack(
//             alignment: Alignment.topCenter,
//             children: [
//               Align(
//                 alignment: Alignment.center,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 92.h),
//                   decoration: AppDecoration.fillOnPrimaryContainer,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       SizedBox(height: 7.v),
//                       CustomImageView(
//                         imagePath: ImageConstant.imgTelevision,
//                         height: 58.adaptSize,
//                         width: 58.adaptSize,
//                       ),
//                       Spacer(),
//                       Padding(
//                         padding: EdgeInsets.only(left: 8.h),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             CustomImageView(
//                               imagePath: ImageConstant.imgHomeIndigo900,
//                               height: 23.v,
//                               width: 21.h,
//                               margin: EdgeInsets.only(bottom: 7.v),
//                             ),
//                             CustomImageView(
//                               imagePath: ImageConstant.imgMegaphoneIndigo900,
//                               height: 19.v,
//                               width: 24.h,
//                               margin: EdgeInsets.only(
//                                 top: 5.v,
//                                 bottom: 6.v,
//                               ),
//                             ),
//                             CustomImageView(
//                               imagePath: ImageConstant.imgSearchiconIndigo900,
//                               height: 30.v,
//                               width: 38.h,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 73.v),
//                   child: CustomSearchView(
//                     width: 359.h,
//                     controller: searchController,
//                     hintText: "Search a movie",
//                     alignment: Alignment.topCenter,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:swipeflix/core/app_export.dart';
import 'package:swipeflix/widgets/custom_search_view.dart';
import 'package:swipeflix/presentation/lists_screen/lists_screen.dart';
import 'package:swipeflix/presentation/homepage_screen/homepage_screen.dart';


class SearchpageScreen extends StatefulWidget {
  SearchpageScreen({Key? key}) : super(key: key);

  @override
  _SearchpageScreenState createState() => _SearchpageScreenState();
}

class _SearchpageScreenState extends State<SearchpageScreen> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onError,
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            // When the user taps on the search bar, request focus on the text field
            FocusScope.of(context).requestFocus(searchFocusNode);
          },
          child: SizedBox(
            height: SizeUtils.height,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 92.h),
                    decoration: AppDecoration.fillOnPrimaryContainer,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 7.v),
                        CustomImageView(
                          imagePath: ImageConstant.imgTelevision,
                          height: 58.adaptSize,
                          width: 58.adaptSize,
                        ),
                        Spacer(),
                        // Navigation Buttons
                        Row(
                          // Row of Navigation Buttons
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Home
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Homepage()),
                                );
                              },
                              icon: Icon(Icons.home_outlined),
                              color: Theme.of(context).colorScheme.secondary,
                              iconSize: 35,
                            ),
                            // List
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ListsScreen()),
                                );
                              },
                              icon: Icon(Icons.list_outlined),
                              color: Theme.of(context).colorScheme.secondary,
                              iconSize: 35,
                            ),
                            // Search
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search),
                              color: Theme.of(context).colorScheme.secondary,
                              iconSize: 35,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 73.v),
                    child: CustomSearchView(
                      width: 359.h,
                      controller: searchController,
                      hintText: "Search a movie",
                      focusNode: searchFocusNode,
                      alignment: Alignment.topCenter,
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
}
