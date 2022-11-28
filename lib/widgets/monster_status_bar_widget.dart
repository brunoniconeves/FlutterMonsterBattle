import 'package:flutter/cupertino.dart';

class MonsterStatusBarWidget extends StatelessWidget {
  final int statValue;
  final String statName;

  const MonsterStatusBarWidget({Key? key, required this.statValue, required this.statName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 7,),
        Text(
          statName
        ),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xFFD9D9D9)
              ),
              height: 7,
              width: 270,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xFF00FF00)
              ),
              height: 7,
              width: (statValue.toDouble()/100) * 270,
            ),
          ],
        )
      ],
    );
  }
}
