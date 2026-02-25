import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/intro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:islami/tabs/quran/quran_service.dart';
import 'package:islami/tabs/quran/sura_detiails_screen.dart';
import 'package:islami/tabs/hadeth/hadeth_details_screen.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool isIntroSeen = prefs.getBool('intro_seen') ?? false;
  QuranService.getMostRecentlySuras();
  runApp(IslamiApp(isIntroSeen: isIntroSeen));
}

class IslamiApp extends StatelessWidget {
  final bool isIntroSeen;
  IslamiApp({required this.isIntroSeen});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        IntroScreen.routeName: (_) => IntroScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetiailsScreen.routeName: (_) => SuraDetiailsScreen(),
        HadethDetiailsScreen.routeName: (_) => HadethDetiailsScreen(),
      },
      initialRoute: isIntroSeen ? HomeScreen.routeName : IntroScreen.routeName,
    );
  }
}
