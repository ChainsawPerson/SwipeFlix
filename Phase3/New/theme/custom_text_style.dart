import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargeIndigo900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.indigo900,
      );
  // Headline text style
  static get headlineSmallBlack900 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black900,
      );
  // Title text style
  static get titleLarge23 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 23.fSize,
      );
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
      );
}

// extension on TextStyle {
//   TextStyle get roboto {
//     return copyWith(
//       fontFamily: 'Roboto',
//     );
//   }

//   TextStyle get inter {
//     return copyWith(
//       fontFamily: 'Inter',
//     );
//   }
// }
