import 'package:fast_form_client/screens/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BuildOnboardingBottom extends StatelessWidget {
  const BuildOnboardingBottom({
    Key? key,
    required this.isLastPage,
    required this.controller,
    required this.isFirstPage,
  }) : super(key: key);

  final bool isLastPage;
  final PageController controller;
  final bool isFirstPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLastPage
          ? Container(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                top: 0,
                bottom: 20,
              ),
              height: 120,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isFirstPage
                      ? const SizedBox(width: 45)
                      : SizedBox(
                          width: 45,
                          child: FloatingActionButton(
                            onPressed: () => controller.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 224, 231, 227),
                            child: const Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 18,
                              color: Color.fromARGB(255, 92, 218, 189),
                            ),
                          ),
                        ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const ColorTransitionEffect(
                        spacing: 16,
                        dotHeight: 8,
                        dotWidth: 8,
                        dotColor: Color.fromRGBO(49, 49, 49, 0.4),
                        activeDotColor: Color.fromRGBO(49, 49, 49, 1),
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 45,
                    child: FloatingActionButton(
                      backgroundColor: const Color.fromRGBO(92, 218, 189, 1),
                      heroTag: 'lastBtn',
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('showHome', true);

                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 0),
              height: 120,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isFirstPage
                      ? const SizedBox(width: 45)
                      : SizedBox(
                          width: 45,
                          child: FloatingActionButton(
                            onPressed: () => controller.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 224, 231, 227),
                            child: const Icon(
                              Icons.arrow_back_ios_rounded,
                              size: 18,
                              color: Color.fromARGB(255, 92, 218, 189),
                            ),
                          ),
                        ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const ColorTransitionEffect(
                        spacing: 16,
                        dotHeight: 8,
                        dotWidth: 8,
                        dotColor: Color.fromRGBO(49, 49, 49, 0.4),
                        activeDotColor: Color.fromRGBO(49, 49, 49, 1),
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 45,
                    child: FloatingActionButton(
                      backgroundColor: const Color.fromRGBO(92, 218, 189, 1),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                      ),
                      onPressed: () => controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
