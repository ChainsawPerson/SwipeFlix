import 'package:flutter/material.dart';
// import 'package:swipeflix/core/app_export.dart';
// import 'package:swipeflix/widgets/app_bar/appbar_title_image.dart';
// import 'package:swipeflix/widgets/app_bar/custom_app_bar.dart';
// import 'package:swipeflix/widgets/custom_icon_button.dart';
import 'package:swipeflix/presentation/about_this_app_screen/about_this_app_screen.dart';
import 'package:swipeflix/presentation/dark_light_mode_screen/dark_light_mode_screen.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage('assets/images/Logo.png'),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0D2C66),
        toolbarHeight: 73.0,
      ),
      body: Align(
          alignment: Alignment.topCenter,
          child: PopupMenuButton(
            onSelected: (value) {
              if (value == 'Settings & Privacy') {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => DarkLightModeScreen()));
              } else if (value == 'About') {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AboutThisAppScreen()));
              }
            },
            offset: Offset(-25, 80),
            color: Colors.black,
            icon: Image.asset('assets/images/Icon button-darkSettings.png'),
            iconSize: 100,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Settings & Privacy',
                child: Text(
                  'Settings & Privacy',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const PopupMenuItem(
                value: 'About',
                child: Text(
                  'About',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}