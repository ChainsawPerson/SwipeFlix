import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:swipeflix/Provider/provider.dart';
import 'package:swipeflix/database/database_manager.dart';
//import 'package:swipeflix/lib/Provider/provider.dart'; // Adjust the import statement//

import 'core/app_export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  DatabaseHelper().deleteDatabase();
  DatabaseHelper().insertMovies();
  runApp(
    ChangeNotifierProvider(
      create: (context) => UiProvider()..init(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final DatabaseHelper database = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme:
              Provider.of<UiProvider>(context).isDark ? darkTheme : lightTheme,
          title: 'swipeflix',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.homepageScreen,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
