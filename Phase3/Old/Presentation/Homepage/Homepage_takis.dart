import 'package:flutter/material.dart';
import 'package:swipeflix/core/app_export.dart';
import 'package:swipeflix/presentation/settings_screen/settings_screen.dart';
import 'package:swipeflix/widgets/app_bar/appbar_iconbutton.dart';
import 'package:swipeflix/widgets/app_bar/appbar_title_image.dart';
import 'package:swipeflix/widgets/app_bar/custom_app_bar.dart';
import 'package:swipeflix/widgets/custom_elevated_button.dart';
import 'package:swipeflix/widgets/watchlist_button.dart';

var name = 'Spiderman';
var link =
    'https://image.api.playstation.com/vulcan/ap/rnd/202306/1219/60eca3ac155247e21850c7d075d01ebf0f3f5dbf19ccd2a1.jpg';

class Homepage extends StatelessWidget {
  const Homepage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image(
          image: AssetImage('assets/images/Logo_update.png'),
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
        children: [
          // Movie Poster
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image(
              image: NetworkImage(link),
            ),
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
                child: Text(
                  '${name}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
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
                            int sensitivity = 2;
                            if (details.primaryDelta! < -sensitivity) {
                              // Swipe Left
                            }
                          },
                          child: const Image(
                              image: AssetImage(
                                  'assets/images/DislikeAnimation.png'))),
                      // Save
                      WatchListButton(),
                      // Like
                      GestureDetector(
                          onHorizontalDragUpdate: (details) {
                            int sensitivity = 2;
                            if (details.primaryDelta! > sensitivity) {
                              // Swipe Right
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
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.home_outlined),
                        color: Theme.of(context).colorScheme.secondary,
                        iconSize: 35,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.list_outlined),
                        color: Theme.of(context).colorScheme.secondary,
                        iconSize: 35,
                      ),
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
            ],
          ),
        ],
      ),
    );
  }
}
