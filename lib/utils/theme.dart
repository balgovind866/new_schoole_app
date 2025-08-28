import "package:flutter/material.dart";
class CustomTextTheme {
  // Define custom font family (replace with your desired font)
  static const String _fontFamily = 'Inter';

  // Base text style with custom font
  static TextStyle _baseTextStyle(
      Color color,
      double fontSize,
      FontWeight fontWeight,
      {double? letterSpacing,
        TextDecoration? decoration}
      ) {
    return TextStyle(
      fontFamily: _fontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  // Light Mode Text Theme
  static TextTheme createLightTextTheme(ColorScheme colorScheme) {
    return TextTheme(
      // Display Styles (Large, Prominent Headings)
      displayLarge: _baseTextStyle(
          colorScheme.onSurface,
          57,
          FontWeight.w400
      ).copyWith(
        fontWeight: FontWeight.bold,
        letterSpacing: -0.25,
      ),
      displayMedium: _baseTextStyle(
          colorScheme.onSurface,
          45,
          FontWeight.w400
      ).copyWith(
        fontWeight: FontWeight.w600,
      ),
      displaySmall: _baseTextStyle(
          colorScheme.onSurface,
          36,
          FontWeight.w400
      ),

      // Headline Styles
      headlineLarge: _baseTextStyle(
          colorScheme.primary,
          32,
          FontWeight.w400
      ).copyWith(
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: _baseTextStyle(
          colorScheme.primary,
          28,
          FontWeight.w400
      ),
      headlineSmall: _baseTextStyle(
          colorScheme.primary,
          24,
          FontWeight.w400
      ).copyWith(
        fontWeight: FontWeight.w500,
      ),

      // Title Styles
      titleLarge: _baseTextStyle(
          colorScheme.onSurface,
          22,
          FontWeight.w700
      ).copyWith(
        letterSpacing: 0.15,
      ),
      titleMedium: _baseTextStyle(
          colorScheme.secondary,
          16,
          FontWeight.w700
      ).copyWith(
        letterSpacing: 0.15,
      ),
      titleSmall: _baseTextStyle(
          colorScheme.tertiary,
          14,
          FontWeight.w700
      ).copyWith(
        letterSpacing: 0.1,
      ),

      // Body Styles
      bodyLarge: _baseTextStyle(
          colorScheme.onSurfaceVariant,
          16,
          FontWeight.w400
      ).copyWith(
        letterSpacing: 0.5,
      ),
      bodyMedium: _baseTextStyle(
          colorScheme.onSurfaceVariant,
          14,
          FontWeight.w400
      ).copyWith(
        letterSpacing: 0.25,
      ),
      bodySmall: _baseTextStyle(
          colorScheme.onSurfaceVariant,
          12,
          FontWeight.w400
      ).copyWith(
        letterSpacing: 0.4,
      ),

      // Label Styles
      labelLarge: _baseTextStyle(
          colorScheme.primary,
          14,
          FontWeight.w500
      ).copyWith(
        letterSpacing: 0.1,
      ),
      labelMedium: _baseTextStyle(
          colorScheme.secondary,
          12,
          FontWeight.w500
      ).copyWith(
        letterSpacing: 0.5,
      ),
      labelSmall: _baseTextStyle(
          colorScheme.tertiary,
          11,
          FontWeight.w500
      ).copyWith(
        letterSpacing: 0.5,
      ),
    );
  }

  // Dark Mode Text Theme
  static TextTheme createDarkTextTheme(ColorScheme colorScheme) {
    return TextTheme(
      // Display Styles (Large, Prominent Headings)
      displayLarge: _baseTextStyle(
          colorScheme.onSurface,
          57,
          FontWeight.w400
      ).copyWith(
        fontWeight: FontWeight.bold,
        letterSpacing: -0.25,
      ),
      displayMedium: _baseTextStyle(
          colorScheme.onSurface,
          45,
          FontWeight.w400
      ).copyWith(
        fontWeight: FontWeight.w600,
      ),
      displaySmall: _baseTextStyle(
          colorScheme.onSurface,
          36,
          FontWeight.w400
      ),

      // Headline Styles
      headlineLarge: _baseTextStyle(
          colorScheme.primary,
          32,
          FontWeight.w400
      ).copyWith(
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: _baseTextStyle(
          colorScheme.primary,
          28,
          FontWeight.w400
      ),
      headlineSmall: _baseTextStyle(
          colorScheme.primary,
          24,
          FontWeight.w400
      ).copyWith(
        fontWeight: FontWeight.w500,
      ),

      // Title Styles
      titleLarge: _baseTextStyle(
          colorScheme.onSurface,
          22,
          FontWeight.w700
      ).copyWith(
        letterSpacing: 0.15,
      ),
      titleMedium: _baseTextStyle(
          colorScheme.secondary,
          16,
          FontWeight.w700
      ).copyWith(
        letterSpacing: 0.15,
      ),
      titleSmall: _baseTextStyle(
          colorScheme.tertiary,
          14,
          FontWeight.w700
      ).copyWith(
        letterSpacing: 0.1,
      ),

      // Body Styles
      bodyLarge: _baseTextStyle(
          colorScheme.onSurfaceVariant,
          16,
          FontWeight.w400
      ).copyWith(
        letterSpacing: 0.5,
      ),
      bodyMedium: _baseTextStyle(
          colorScheme.onSurfaceVariant,
          14,
          FontWeight.w400
      ).copyWith(
        letterSpacing: 0.25,
      ),
      bodySmall: _baseTextStyle(
          colorScheme.onSurfaceVariant,
          12,
          FontWeight.w400
      ).copyWith(
        letterSpacing: 0.4,
      ),

      // Label Styles
      labelLarge: _baseTextStyle(
          colorScheme.primary,
          14,
          FontWeight.w500
      ).copyWith(
        letterSpacing: 0.1,
      ),
      labelMedium: _baseTextStyle(
          colorScheme.secondary,
          12,
          FontWeight.w500
      ).copyWith(
        letterSpacing: 0.5,
      ),
      labelSmall: _baseTextStyle(
          colorScheme.tertiary,
          11,
          FontWeight.w500
      ).copyWith(
        letterSpacing: 0.5,
      ),
    );
  }

  // Update MaterialTheme to use custom text themes
  static ThemeData createLightTheme(ColorScheme colorScheme, TextTheme textTheme) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      textTheme: createLightTextTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.background,
      canvasColor: colorScheme.surface,
    );
  }

  static ThemeData createDarkTheme(ColorScheme colorScheme, TextTheme textTheme) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      textTheme: createDarkTextTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.background,
      canvasColor: colorScheme.surface,
    );
  }
}

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);
  ThemeData light() {
    return CustomTextTheme.createLightTheme(MaterialTheme.lightScheme(), textTheme);
  }
  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }
  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }
  ThemeData dark() {
    return CustomTextTheme.createDarkTheme(MaterialTheme.darkScheme(), textTheme);
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: colorScheme.brightness == Brightness.light
        ? createLightTextTheme(colorScheme)
        : createDarkTextTheme(colorScheme),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );

  // Helper methods to create theme-specific text themes directly in this class
  TextTheme createLightTextTheme(ColorScheme colorScheme) {
    return CustomTextTheme.createLightTextTheme(colorScheme);
  }

  TextTheme createDarkTextTheme(ColorScheme colorScheme) {
    return CustomTextTheme.createDarkTextTheme(colorScheme);
  }





  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006876),
      surfaceTint: Color(0xff006876),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa1efff),
      onPrimaryContainer: Color(0xff004e59),
      secondary: Color(0xff4a6268),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcde7ed),
      onSecondaryContainer: Color(0xff334a50),
      tertiary: Color(0xff545d7e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffdbe1ff),
      onTertiaryContainer: Color(0xff3c4665),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff5fafc),
      onSurface: Color(0xff171d1e),
      onSurfaceVariant: Color(0xff3f484a),
      outline: Color(0xff6f797b),
      outlineVariant: Color(0xffbfc8ca),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff83d3e3),
      primaryFixed: Color(0xffa1efff),
      onPrimaryFixed: Color(0xff001f25),
      primaryFixedDim: Color(0xff83d3e3),
      onPrimaryFixedVariant: Color(0xff004e59),
      secondaryFixed: Color(0xffcde7ed),
      onSecondaryFixed: Color(0xff051f23),
      secondaryFixedDim: Color(0xffb1cbd1),
      onSecondaryFixedVariant: Color(0xff334a50),
      tertiaryFixed: Color(0xffdbe1ff),
      onTertiaryFixed: Color(0xff101a37),
      tertiaryFixedDim: Color(0xffbcc5eb),
      onTertiaryFixedVariant: Color(0xff3c4665),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafc),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9eb),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }


  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003c45),
      surfaceTint: Color(0xff006876),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1a7786),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff223a3f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff597176),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2c3553),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff636c8d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafc),
      onSurface: Color(0xff0c1213),
      onSurfaceVariant: Color(0xff2f383a),
      outline: Color(0xff4b5456),
      outlineVariant: Color(0xff656f71),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff83d3e3),
      primaryFixed: Color(0xff1a7786),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff005e6a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff597176),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff41595e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff636c8d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4a5473),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc2c7c9),
      surfaceBright: Color(0xfff5fafc),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe3e9eb),
      surfaceContainerHigh: Color(0xffd8dedf),
      surfaceContainerHighest: Color(0xffcdd3d4),
    );
  }



  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003139),
      surfaceTint: Color(0xff006876),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00515c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff183034),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff354d52),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff212b48),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff3f4867),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafc),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff252e30),
      outlineVariant: Color(0xff424b4d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff83d3e3),
      primaryFixed: Color(0xff00515c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003841),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff354d52),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1e363b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff3f4867),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff28314f),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb4babb),
      surfaceBright: Color(0xfff5fafc),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffecf2f3),
      surfaceContainer: Color(0xffdee3e5),
      surfaceContainerHigh: Color(0xffd0d5d7),
      surfaceContainerHighest: Color(0xffc2c7c9),
    );
  }



  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff83d3e3),
      surfaceTint: Color(0xff83d3e3),
      onPrimary: Color(0xff00363e),
      primaryContainer: Color(0xff004e59),
      onPrimaryContainer: Color(0xffa1efff),
      secondary: Color(0xffb1cbd1),
      onSecondary: Color(0xff1c3439),
      secondaryContainer: Color(0xff334a50),
      onSecondaryContainer: Color(0xffcde7ed),
      tertiary: Color(0xffbcc5eb),
      onTertiary: Color(0xff262f4d),
      tertiaryContainer: Color(0xff3c4665),
      onTertiaryContainer: Color(0xffdbe1ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e1416),
      onSurface: Color(0xffdee3e5),
      onSurfaceVariant: Color(0xffbfc8ca),
      outline: Color(0xff899295),
      outlineVariant: Color(0xff3f484a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff006876),
      primaryFixed: Color(0xffa1efff),
      onPrimaryFixed: Color(0xff001f25),
      primaryFixedDim: Color(0xff83d3e3),
      onPrimaryFixedVariant: Color(0xff004e59),
      secondaryFixed: Color(0xffcde7ed),
      onSecondaryFixed: Color(0xff051f23),
      secondaryFixedDim: Color(0xffb1cbd1),
      onSecondaryFixedVariant: Color(0xff334a50),
      tertiaryFixed: Color(0xffdbe1ff),
      onTertiaryFixed: Color(0xff101a37),
      tertiaryFixedDim: Color(0xffbcc5eb),
      onTertiaryFixedVariant: Color(0xff3c4665),
      surfaceDim: Color(0xff0e1416),
      surfaceBright: Color(0xff343a3c),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
    );
  }



  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff99e9f9),
      surfaceTint: Color(0xff83d3e3),
      onPrimary: Color(0xff002a31),
      primaryContainer: Color(0xff4a9cab),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc7e1e7),
      onSecondary: Color(0xff11292e),
      secondaryContainer: Color(0xff7c959b),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffd3dbff),
      onTertiary: Color(0xff1b2441),
      tertiaryContainer: Color(0xff8690b2),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1416),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd5dee0),
      outline: Color(0xffaab4b6),
      outlineVariant: Color(0xff899294),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff00505b),
      primaryFixed: Color(0xffa1efff),
      onPrimaryFixed: Color(0xff001418),
      primaryFixedDim: Color(0xff83d3e3),
      onPrimaryFixedVariant: Color(0xff003c45),
      secondaryFixed: Color(0xffcde7ed),
      onSecondaryFixed: Color(0xff001418),
      secondaryFixedDim: Color(0xffb1cbd1),
      onSecondaryFixedVariant: Color(0xff223a3f),
      tertiaryFixed: Color(0xffdbe1ff),
      onTertiaryFixed: Color(0xff050f2c),
      tertiaryFixedDim: Color(0xffbcc5eb),
      onTertiaryFixedVariant: Color(0xff2c3553),
      surfaceDim: Color(0xff0e1416),
      surfaceBright: Color(0xff3f4547),
      surfaceContainerLowest: Color(0xff040809),
      surfaceContainerLow: Color(0xff191f20),
      surfaceContainer: Color(0xff23292a),
      surfaceContainerHigh: Color(0xff2e3435),
      surfaceContainerHighest: Color(0xff393f40),
    );
  }



  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd1f6ff),
      surfaceTint: Color(0xff83d3e3),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff7fcfdf),
      onPrimaryContainer: Color(0xff000d11),
      secondary: Color(0xffdbf5fb),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffaec7cd),
      onSecondaryContainer: Color(0xff000d11),
      tertiary: Color(0xffedefff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffb8c1e7),
      onTertiaryContainer: Color(0xff010926),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0e1416),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe8f2f4),
      outlineVariant: Color(0xffbbc4c7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff00505b),
      primaryFixed: Color(0xffa1efff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff83d3e3),
      onPrimaryFixedVariant: Color(0xff001418),
      secondaryFixed: Color(0xffcde7ed),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb1cbd1),
      onSecondaryFixedVariant: Color(0xff001418),
      tertiaryFixed: Color(0xffdbe1ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffbcc5eb),
      onTertiaryFixedVariant: Color(0xff050f2c),
      surfaceDim: Color(0xff0e1416),
      surfaceBright: Color(0xff4b5153),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1b2122),
      surfaceContainer: Color(0xff2b3133),
      surfaceContainerHigh: Color(0xff363c3e),
      surfaceContainerHighest: Color(0xff424849),
    );
  }


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}