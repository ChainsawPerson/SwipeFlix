import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:swipeflix/core/app_export.dart';
import 'package:swipeflix/database/database_manager.dart';
import 'package:swipeflix/presentation/homepage_screen/homepage_screen.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key, required this.index, required this.number})
      : super(key: key);
  int index;
  final ValueNotifier<int> number;

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
          Navigator.pop(context);
        }
      },
      child: Scaffold(
          body: GestureDetector(
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
                _buildEight(context), // Movie Title
                _buildEleven(context), // Preview Trailer
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7.v),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer),
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
                                child: FutureBuilder(
                                    future: DatabaseHelper().getAllMovies(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting)
                                        return const CircularProgressIndicator();
                                      else if (snapshot.hasError) {
                                        return Text(snapshot.error.toString());
                                      }
                                      var list = snapshot.data!
                                          .elementAt(widget.number.value)[
                                              'title_genre']
                                          .split(',');
                                      List tagsList = [];
                                      for (var title in list) {
                                        tagsList
                                            .add(_buildGenreContainer(title));
                                      }
                                      return Row(
                                        children: [for (var w in tagsList) w],
                                      );
                                    })),
                          ),
                        ),
                        SizedBox(height: 9.v),
                        _buildSix(context),
                        SizedBox(height: 10.v),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: FutureBuilder(
                            future: DatabaseHelper().getAllMovies(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting)
                                return const CircularProgressIndicator();
                              else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              final url = Uri.parse(snapshot.data!.elementAt(
                                  widget.number.value)['title_imdbLink']);
                              return Link(
                                  uri: url,
                                  target: LinkTarget.defaultTarget,
                                  builder: (context, openLink) => IconButton(
                                        onPressed: () {
                                          launchUrl(url,
                                              mode: LaunchMode.inAppWebView);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(29.h),
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
                                        icon: Ink(
                                          child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgHome58x58,
                                            height: 58.adaptSize,
                                            width: 58.adaptSize,
                                            //radius: BorderRadius.circular(29.h),
                                            alignment: Alignment.center,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimaryContainer,
                                          ),
                                        ),
                                      ));
                            },
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
      )),
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
    // Movie title
    return Container(
      child: FutureBuilder(
          future: DatabaseHelper().getAllMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return const CircularProgressIndicator();
            else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Text(
              snapshot.data!
                  .elementAt(widget.number.value)['title_primaryTitle'],
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
              textAlign: TextAlign.center,
            );
          }),
      color: Theme.of(context).colorScheme.primaryContainer,
      width: MediaQuery.of(context).size.width,
    );
  }

  /// Section Widget
  Widget _buildEleven(BuildContext context) {
    // Movie Trailer
    return SizedBox(
      height: 192.v,
      width: double.maxFinite,
      child: FutureBuilder(
          future: DatabaseHelper().getAllMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return const CircularProgressIndicator();
            else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Image(
                    image: AssetImage(snapshot.data!
                        .elementAt(widget.number.value)['title_posterURL']
                        .toString())),
                CustomImageView(
                  imagePath: ImageConstant.imgOverflowMenu,
                  height: 75.adaptSize,
                  width: 75.adaptSize,
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 50.v),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            );
          }),
    );
  }

  Widget _buildSix(BuildContext context) {
    // Movie Details
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 1.v,
        ),
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.background),
        child: Align(
          alignment: Alignment.topCenter,
          child: FutureBuilder(
              future: DatabaseHelper().getAllMovies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return const CircularProgressIndicator();
                else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Text('Description:',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontSize: 18.fSize,
                                    )),
                        Text(
                          snapshot.data!
                              .elementAt(widget.number.value)['title_details'],
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                fontSize: 18.fSize,
                              ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ));
              }),
        ),
      ),
    );
  }
}
