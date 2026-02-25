import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/custom_indicator.dart';
import 'package:islami/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = '/IntroScreen';
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController controller = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Container(
              child: Image.asset(
                'assets/images/islami_header.png',
                height: MediaQuery.sizeOf(context).height * 0.15,
              ),
            ),
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  index = value;
                  setState(() {});
                },
                children: [
                  Column(
                    children: [
                      Image.asset('assets/images/intro_screen_1.png'),
                      Spacer(),
                      Text(
                        'Welcome To Islmi App',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: AppTheme.primary),
                      ),
                      Spacer(),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/images/intro_screen_2.png'),
                      Spacer(),
                      Text(
                        'Welcome To Islmi App',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: AppTheme.primary),
                      ),
                      Spacer(),
                      Text(
                        'We Are Very Excited To Have You In Our Community',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppTheme.primary,
                        ),
                        textAlign: .center,
                      ),
                      Spacer(),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/images/intro_screen_3.png'),
                      Spacer(),
                      Text(
                        'Welcome To Islmi App',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: AppTheme.primary),
                      ),
                      Spacer(),
                      Text(
                        'Read, and your Lord is the Most Generous',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppTheme.primary,
                        ),
                        textAlign: .center,
                      ),
                      Spacer(),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/images/intro_screen_4.png'),
                      Spacer(),
                      Text(
                        'Welcome To Islmi App',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: AppTheme.primary),
                      ),
                      Spacer(),
                      Text(
                        'Praise the name of your Lord, the Most \n High',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppTheme.primary,
                        ),
                        textAlign: .center,
                      ),
                      Spacer(),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/images/intro_screen_5.png'),
                      Spacer(),
                      Text(
                        'Welcome To Islmi App',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(color: AppTheme.primary),
                      ),
                      Spacer(),
                      Text(
                        'You can listen to the Holy Quran Radio through the application for free and easily',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppTheme.primary,
                        ),
                        textAlign: .center,
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  child: index == 0
                      ? null
                      : TextButton(
                          onPressed: () {
                            controller.animateToPage(
                              index - 1,
                              duration: Duration(milliseconds: 250),
                              curve: Curves.linear,
                            );
                            setState(() {});
                          },
                          child: Text(
                            'Back',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: AppTheme.primary),
                          ),
                        ),
                ),

                Row(
                  children: [
                    CustomIndicator(active: index == 0),
                    CustomIndicator(active: index == 1),
                    CustomIndicator(active: index == 2),
                    CustomIndicator(active: index == 3),
                    CustomIndicator(active: index == 4),
                  ],
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () async {
                    if (index == 4) {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('intro_seen', true);
                      Navigator.pushReplacementNamed(
                        context,
                        HomeScreen.routeName,
                      );
                    } else {
                      controller.animateToPage(
                        index + 1,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.linear,
                      );
                    }
                    setState(() {});
                  },
                  child: Text(
                    index == 4 ? 'Finish' : 'Next',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: AppTheme.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
