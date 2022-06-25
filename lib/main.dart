import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/svg.dart';

import './screens/onboarding_page.dart';
import './screens/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fast Form',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
        ),
      ),
      home: AnimatedSplashScreen(
        splash: SvgPicture.asset("assets/images/flutter_logo.svg"),
        nextScreen: showHome ? const HomePage() : const OnboardingPage(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 500,
      ),
    );
  }
}
