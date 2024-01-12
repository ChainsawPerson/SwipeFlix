import 'package:flutter/material.dart';

class WatchListButton extends StatefulWidget {
  @override
  State<WatchListButton> createState() => _WatchListButtonState();
}

class _WatchListButtonState extends State<WatchListButton> {
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSaved = !(_isSaved);
          if (_isSaved) {
            print('Saved to watchList');
          } else {
            print('Removed from watchList');
          }
        });
      },
      icon:
          (_isSaved ? Icon(Icons.bookmark) : Icon(Icons.bookmark_add_outlined)),
      color: Theme.of(context).colorScheme.secondary,
      iconSize: 50,
    );
  }
}
