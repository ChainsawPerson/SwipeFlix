// import 'package:flutter/material.dart';
// // import 'package:swipeflix/core/app_export.dart';
// // import 'package:swipeflix/widgets/custom_switch.dart';

// // ignore: must_be_immutable
// class DarkLightModeScreen extends StatelessWidget {
//   DarkLightModeScreen({Key? key})
//       : super(
//           key: key,
//         );

//   bool isSelectedSwitch = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Image(
//                 image: AssetImage('assets/images/Logo.png'),
//               ),
//             ],
//           ),
//           leading: const BackButton(color: Colors.black),
//           centerTitle: true,
//           backgroundColor: Colors.grey[50],
//           toolbarHeight: 73.0,
//           elevation: 0,
//         ),
//         body: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             Container(
//                 width: 310,
//                 height: 52,
//                 decoration: const BoxDecoration(color: Color(0xffd9d9d9))),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 const Text(
//                   'Dark mode',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     fontFamily: 'Roboto',
//                     letterSpacing: 0.50,
//                   ),
//                 ),
//                 Switch(
//                   value: true,
//                   onChanged: (value) {},
//                   activeColor: const Color(0xFFD9D9D9),
//                   activeTrackColor: const Color(0xFF0D2C66),
//                   inactiveThumbColor: const Color(0xFF0D2C66),
//                 ),
//               ],
//             )
//           ],
//         ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:swipeflix/presentation/dark_light_mode_screen/dark_light_mode_screen.dart';
import 'package:swipeflix/Provider/provider.dart';
import 'package:swipeflix/core/app_export.dart';

class DarkLightModeScreen extends StatelessWidget {
  DarkLightModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // ... your existing code ...
          ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 310,
            height: 52,
            decoration: const BoxDecoration(color: Color(0xffd9d9d9)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Dark mode',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              Consumer<UiProvider>(
                builder: (context, uiProvider, child) {
                  return Switch(
                    value: uiProvider.isDark,
                    onChanged: (value) => uiProvider.changeTheme(),
                    activeColor: const Color(0xFFD9D9D9),
                    activeTrackColor: const Color(0xFF0D2C66),
                    inactiveThumbColor: const Color(0xFF0D2C66),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
