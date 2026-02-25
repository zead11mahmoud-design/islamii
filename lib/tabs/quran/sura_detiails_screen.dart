import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_service.dart';
import 'package:islami/tabs/quran/sura.dart';
import 'package:islami/widgets/loading_indicator.dart';

class SuraDetiailsScreen extends StatefulWidget {
  static const String routeName = '/SuraDetiails';

  const SuraDetiailsScreen({super.key});

  @override
  State<SuraDetiailsScreen> createState() => _SuraDetiailsScreenState();
}

class _SuraDetiailsScreenState extends State<SuraDetiailsScreen> {
  late Sura sura;
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    sura = ModalRoute.of(context)!.settings.arguments as Sura;
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenHeight = MediaQuery.sizeOf(context).height;
    if (ayat.isEmpty) {
      loadSuar();
    }
    return Scaffold(
      appBar: AppBar(title: Text(sura.englishName)),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Image.asset(
                  'assets/images/detiails_header_left.png',
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
                Text(
                  sura.arabicName,
                  style: textTheme.headlineSmall!.copyWith(
                    color: AppTheme.primary,
                  ),
                ),
                Image.asset(
                  'assets/images/detiails_header_right.png',
                  height: screenHeight * 0.1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Expanded(
            child: ayat.isEmpty
                ? LoadingIndicator()
                : ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (_, index) => Text(
                      ayat[index],
                      style: textTheme.titleLarge!.copyWith(
                        color: AppTheme.primary,
                      ),
                      textAlign: .center,
                    ),
                    separatorBuilder: (_, _) => SizedBox(height: 12),
                    itemCount: ayat.length,
                  ),
          ),
          Image.asset(
            'assets/images/detiails_footer.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  Future<void> loadSuar() async {
    String suraFileContent = await QuranService.loadSuraFlie(sura.num);
    ayat = suraFileContent.split('\r\n');
    setState(() {});
  }
}
