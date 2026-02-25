import 'package:flutter/material.dart';
import 'package:islami/tabs/sebha/sebha_service.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Spacer(),
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
          style: textTheme.headlineSmall!.copyWith(fontSize: 36),
        ),
        Spacer(),
        Image.asset('assets/images/head_sebha.png'),
        Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: () {
                  angle += 1 / 30;
                  SebhaService.tasbaeh();
                  setState(() {});
                },
                child: AnimatedRotation(
                  turns: angle,
                  duration: Duration(milliseconds: 300),
                  child: Image.asset('assets/images/body_sebha.png'),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    SebhaService.azkar[SebhaService.index],
                    style: textTheme.headlineSmall!.copyWith(fontSize: 36),
                  ),
                  SizedBox(height: 8),
                  Text(
                    SebhaService.sebhaCount.toString(),
                    style: textTheme.headlineSmall!.copyWith(fontSize: 36),
                  ),
                ],
              ),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }
}
