import 'package:flutter/material.dart';
import 'package:saving_apps/pages/main_page.dart';
import 'package:saving_apps/pages/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saving App',
      routes: {
        OnboardingPage.nameRoute: (context) => const OnboardingPage(),
        MainPage.nameRoute: (context) => const MainPage(),
      },
    );
  }
}
