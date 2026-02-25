import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/sura.dart';

class SuraItem extends StatelessWidget {
  Sura sura;

  SuraItem({super.key, required this.sura});
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Container(
          height: 52,
          width: 52,
          alignment: .center,
          margin: EdgeInsets.only(right: 24),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sura_num_frame.png'),
            ),
          ),
          child: Text('${sura.num}', style: textTheme.titleMedium),
        ),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(sura.englishName, style: textTheme.titleLarge),
            Text('${sura.ayatCount} Verses', style: textTheme.titleSmall),
          ],
        ),
        Spacer(),
        Text(sura.arabicName, style: textTheme.titleLarge),
      ],
    );
  }
}
