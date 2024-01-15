import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:swipeflix/core/app_export.dart';
import 'package:swipeflix/database/database_manager.dart';
import 'package:swipeflix/database/database_models.dart';
import 'package:swipeflix/presentation/settings_screen/settings_screen.dart';
import 'package:swipeflix/widgets/app_bar/appbar_iconbutton.dart';
import 'package:swipeflix/widgets/app_bar/appbar_title_image.dart';
import 'package:swipeflix/widgets/app_bar/custom_app_bar.dart';
import 'package:swipeflix/widgets/custom_elevated_button.dart';
import 'package:swipeflix/widgets/watchlist_button.dart';
import 'package:swipeflix/presentation/lists_screen/lists_screen.dart';
import 'package:swipeflix/presentation/searchpage_screen/searchpage_screen.dart';
import 'package:swipeflix/presentation/details_screen/details_screen.dart';
//import 'package:swipeflix/database/database_manager.dart';

var name = 'Spiderman';
var link =
    'https://image.api.playstation.com/vulcan/ap/rnd/202306/1219/60eca3ac155247e21850c7d075d01ebf0f3f5dbf19ccd2a1.jpg';

class Homepage extends StatelessWidget {
  Homepage({Key? key})
      : super(
          key: key,
        );
  DatabaseHelper db = DatabaseHelper();
  var index;
  final number = new ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image(
          image: AssetImage('assets/images/Logo_update_full.png'),
          height: 58.adaptSize,
          width: 58.adaptSize,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
            icon: Image(
              image: AssetImage('assets/images/Icon button-darkSettings.png'),
            ),
          ),
        ],
        backgroundColor: Color(0xFF0D2C66),
        toolbarHeight: 73.0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Movie Poster
          FittedBox(
            fit: BoxFit.fill,
            child: ValueListenableBuilder<int>(
                valueListenable: number,
                builder: (context, value, child) {
                  return FutureBuilder(
                      future: db.getAllMovies(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return const CircularProgressIndicator();
                        if (snapshot.hasError)
                          return Text(snapshot.error.toString());
                        index = number.value;
                        if (index >= snapshot.data!.length)
                          index = snapshot.data!.length - 1;
                        return ElevatedButton(
                          onPressed: () {
                            // Navigate to a different page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                        index: index,
                                        number: number,
                                      )),
                            );
                          },
                          child: Image(
                            image: AssetImage(snapshot.data!
                                .elementAt(index)['title_posterURL']
                                .toString()),
                          ),
                        );
                      });
                }),
          ),
          Column(
            // Column Of Title -> (Like/Dislike & Navigation Buttons)
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // Movie Title
                color: Theme.of(context).colorScheme.primaryContainer,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: ValueListenableBuilder<int>(
                  builder: (context, value, child) {
                    return FutureBuilder(
                      future: db.getAllMovies(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return const CircularProgressIndicator();
                        if (snapshot.hasError)
                          return Text(snapshot.error.toString());
                        index = number.value;
                        if (index >= snapshot.data!.length)
                          index = snapshot.data!.length - 1;
                        return Text(
                          snapshot.data!
                              .elementAt(index)['title_primaryTitle']
                              .toString(),
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                        );
                      },
                    );
                  },
                  valueListenable: number,
                ),
              ),
              Column(
                // Column of Swipe and Navigation
                children: [
                  // Swipe And Bookmark
                  Row(
                    // Row of Swipe & Bookmark
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Dislike
                      GestureDetector(
                          onHorizontalDragUpdate: (details) {
                            int sensitivity = 7;
                            if (details.primaryDelta! < -sensitivity) {
                              // Swipe Left
                              db.addMovieToList('dislikedList', number.value);
                              number.value++;
                            }
                          },
                          child: const Image(
                              image: AssetImage(
                                  'assets/images/DislikeAnimation.png'))),
                      // Save
                      WatchListButton(
                        db: db,
                        index: 0,
                        number: number,
                      ),
                      // Like
                      GestureDetector(
                          onHorizontalDragUpdate: (details) {
                            int sensitivity = 7;
                            if (details.primaryDelta! > sensitivity) {
                              // Swipe Right
                              db.addMovieToList('likedList', number.value);
                              number.value++;
                            }
                          },
                          child: const Image(
                              image: AssetImage(
                                  'assets/images/LikeAnimation.png'))),
                    ],
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
                            MaterialPageRoute(
                                builder: (context) => ListsScreen()),
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
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
