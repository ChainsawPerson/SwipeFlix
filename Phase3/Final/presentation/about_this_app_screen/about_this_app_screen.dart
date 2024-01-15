import 'package:flutter/material.dart';
// import 'package:swipeflix/core/app_export.dart';
// import 'package:swipeflix/widgets/app_bar/appbar_title_image.dart';
// import 'package:swipeflix/widgets/app_bar/custom_app_bar.dart';

class AboutThisAppScreen extends StatelessWidget {
  const AboutThisAppScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage('assets/images/Logo.png'),
            ),
          ],
        ),
        backgroundColor: Color(0xFF0D2C66),
        toolbarHeight: 73.0,
        leading: BackButton(color: Colors.grey[50]),
        elevation: 0,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          'Version: 1.0.0',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        Text(
          'App Version: 1.0.0',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        Text(
          'Legal Information',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        Text(
          'This app is made for educational purposes. May the force Be with the users.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ]),
    );
  }
}
