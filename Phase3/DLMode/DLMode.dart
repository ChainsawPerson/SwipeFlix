import 'package:flutter/material.dart';
// import 'package:swipeflix/core/app_export.dart';
// import 'package:swipeflix/widgets/custom_switch.dart';



class DarkLightModeScreen extends StatelessWidget {
  DarkLightModeScreen({Key? key})
      : super(
          key: key,
        );

  bool isSelectedSwitch = false;

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
          leading: const BackButton(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.grey[50],
          toolbarHeight: 73.0,
          elevation: 0,
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
                width: 310,
                height: 52,
                decoration: const BoxDecoration(color: Color(0xffd9d9d9))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Dark mode',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.50,
                  ),
                ),
                Switch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: const Color(0xFFD9D9D9),
                  activeTrackColor: const Color(0xFF0D2C66),
                  inactiveThumbColor: const Color(0xFF0D2C66),
                ),
              ],
            )
          ],
        ));
  }
}
