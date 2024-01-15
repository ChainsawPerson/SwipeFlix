import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swipeflix/database/database_manager.dart';
import 'package:swipeflix/presentation/homepage_screen/Homepage_takis.dart';
import 'package:flutter/src/foundation/change_notifier.dart';

class WatchListButton extends StatefulWidget {
  DatabaseHelper db;
  int index;
  final ValueNotifier<int> number;

  WatchListButton(
      {Key? key, required this.db, required this.index, required this.number})
      : super(key: key);

  @override
  _WatchListButtonState createState() => _WatchListButtonState();
}

class _WatchListButtonState extends State<WatchListButton> {
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.db.getAllMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return const CircularProgressIndicator();
          else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return FutureBuilder(
              future: widget.db.getList('watchLaterList'),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snap.hasError) {
                  return Text(snap.error.toString());
                }
                return IconButton(
                  onPressed: () {
                    setState(() {
                      if (snap.data == null)
                        _isSaved = false;
                      else {
                        for (var movie in snap.data!.toList()) {
                          if (movie['title_id'] == widget.index) {
                            _isSaved = true;
                            break;
                          }
                        }
                      }
                      if (!_isSaved) {
                        print('Saved to watchList');
                        widget.db.addMovieToList(
                            'watchLaterList', widget.number.value);
                      } else {
                        print('Removed from watchList');
                        widget.db
                            .deleteMovie('watchLaterList', widget.number.value);
                      }
                      widget.db
                          .getList('watchLaterList')
                          .then((value) => print(value));
                      widget.number.value++;
                    });
                  },
                  icon: (_isSaved
                      ? Icon(Icons.bookmark)
                      : Icon(Icons.bookmark_add_outlined)),
                  color: Theme.of(context).colorScheme.secondary,
                  iconSize: 50,
                );
              });
        });
  }
}
