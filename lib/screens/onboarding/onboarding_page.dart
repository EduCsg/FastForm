import 'package:flutter/material.dart';

import './components/bottom.dart';
import './components/onboarding_1.dart';
import './components/onboarding_2.dart';
import './components/onboarding_3.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;
  bool isFirstPage = true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
            setState(() => isFirstPage = index == 0);
          },
          children: const [
            BuildOnboarding1(),
            BuildOnboarding2(),
            BuildOnboarding3(),
          ],
        ),
      ),
      bottomSheet: BuildOnboardingBottom(
        isLastPage: isLastPage,
        controller: controller,
        isFirstPage: isFirstPage,
      ),
    );
  }
}
