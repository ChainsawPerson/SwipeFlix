import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipeflix/Provider/provider.dart';
import 'package:swipeflix/presentation/dark_light_mode_screen/dark_light_mode_screen.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Consumer<UiProvider>(
        builder: (context, UiProvider notifier, child) {
          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text("Dark theme"),
                trailing: Switch(
                  value: notifier.isDark,
                  onChanged: (value) => notifier.changeTheme(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the DarkLightModeScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DarkLightModeScreen(),
                    ),
                  );
                },
                child: const Text('Go to DarkLightModeScreen'),
              ),
            ],
          );
        },
      ),
    );
  }
}
