import 'package:cpe231_nsfw_flutter/src/constants/constants.dart';
import 'package:cpe231_nsfw_flutter/src/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'cpe231_nsfw_flutter',
      theme: ThemeData(
        colorScheme: _customColorScheme(),
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
        buttonTheme: ButtonThemeData(colorScheme: _customColorScheme()),
        cardTheme: CardTheme(color: kBackground),
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(selectedItemColor: kPrimary),
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        appBarTheme: AppBarTheme(backgroundColor: kAppBarBackgroundColor),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
      ),
      //darkTheme: ThemeData.dark(),
      home: Layout(),
    );
  }

  ColorScheme _customColorScheme() => ColorScheme(
        brightness: kBrightness,
        primary: kPrimary,
        onPrimary: kOnPrimary,
        secondary: kSecondary,
        onSecondary: kOnSecondary,
        error: kError,
        onError: kOnError,
        background: kBackground,
        onBackground: kOnBackground,
        surface: kSurface,
        onSurface: kOnSurface,
      );
}
