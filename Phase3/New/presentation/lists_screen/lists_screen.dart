import 'package:flutter/material.dart';
import 'package:swipeflix/core/app_export.dart';
import 'package:swipeflix/database/database_manager.dart';
import 'package:swipeflix/presentation/homepage_screen/homepage_screen.dart';
import 'package:swipeflix/presentation/searchpage_screen/searchpage_screen.dart';

class ListsScreen extends StatelessWidget {
  const ListsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          int sensitivity = 0;
          if (details.primaryDelta! > sensitivity) {
            Navigator.pop(context);
          } else if (details.primaryDelta! < -sensitivity) {
            // right Swipe
          }
        },
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildFive(context),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.h, vertical: 16.v),
                        child: Column(
                          children: [
                            // Add your genre rows here
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(height: 20.v),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 0.h,
                                    vertical: 3.v,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 1.v,
                                        width: 300.v,
                                      ),
                                      Text(
                                        "Liked Movies",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.v),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.h, right: 12.h),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: FutureBuilder(
                                          future: DatabaseHelper()
                                              .getList('likedList'),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting)
                                              return const CircularProgressIndicator();
                                            else if (snapshot.hasError) {
                                              return Text(
                                                  snapshot.error.toString());
                                            }
                                            if (!snapshot.hasData)
                                              return Text('No movies');
                                            List list = [];
                                            for (var movie in snapshot.data!) {
                                              list.add(_buildMovieContainer(movie[
                                                  'title_title_primaryTitle']));
                                            }
                                            return Row(
                                              children: [
                                                for (var w in list) w,
                                              ],
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 78.v),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 0.h,
                                    vertical: 3.v,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 1.v,
                                        width: 300.v,
                                      ),
                                      Text(
                                        "Watch Later",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16.v),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.h, right: 12.h),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: FutureBuilder(
                                          future: DatabaseHelper()
                                              .getList('watchLaterList'),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting)
                                              return const CircularProgressIndicator();
                                            else if (snapshot.hasError) {
                                              return Text(
                                                  snapshot.error.toString());
                                            }
                                            if (!snapshot.hasData)
                                              return Text('No movies');
                                            List list = [];
                                            for (var movie in snapshot.data!) {
                                              list.add(_buildMovieContainer(movie[
                                                  'title_title_primaryTitle']));
                                            }
                                            return Row(
                                              children: [
                                                for (var w in list) w,
                                              ],
                                            );
                                          }),
                                    ),
                                  ),
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
              // Add empty space between genre rows and buttons
              SizedBox(height: 16.v),
              // Buttons at the very bottom of the page
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Homepage
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.home_outlined),
                      color: Theme.of(context).colorScheme.secondary,
                      iconSize: 35,
                    ),
                    //Lists
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.list_outlined),
                      color: Theme.of(context).colorScheme.secondary,
                      iconSize: 35,
                    ),
                    //SearchPage
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchpageScreen()),
                        );
                      },
                      icon: const Icon(Icons.search),
                      color: Theme.of(context).colorScheme.secondary,
                      iconSize: 35,
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
  Widget _buildMovieContainer(String movie) {
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
        movie,
        style: theme.textTheme.titleSmall,
        maxLines: 1,
        overflow: TextOverflow.visible, // Allow text overflow
      ),
    );
  }
}
