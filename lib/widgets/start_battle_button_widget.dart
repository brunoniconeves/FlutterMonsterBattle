import 'package:assessment_cc_flutter_sr_01/services/monster_service.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class StartBattleButton extends StatefulWidget {
  const StartBattleButton({Key? key}) : super(key: key);

  @override
  State<StartBattleButton> createState() => _StartBattleButtonState();
}

class _StartBattleButtonState extends State<StartBattleButton> {
  final ButtonStyle _enableButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      const Color(0xFF10782E),
    ),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  );
  final ButtonStyle _disabledButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      const Color(0xFF799A82),
    ),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MonsterService monsterService =
        Provider.of<MonsterService>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Container(
        width: size.width * 0.85,
        height: 56,
        child:
        monsterService.battleResponse == null ?
          ElevatedButton(
            style:
                monsterService.player != null && monsterService.computer != null
                    ? _enableButtonStyle
                    : _disabledButtonStyle,
            onPressed: () => monsterService.startBattle(),
            child: const Text("Start Battle"),
          )
          :
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(17),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Colors.black, width: 2)
              ),
              primary: const Color(0xFFE1F8FF)
            ),
            onPressed: () => {},
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  "${monsterService.battleResponse!.winner!.name} wins!",
                  style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 22, color: Colors.black),
              ),
            ),
          )
      ),
    );
  }
}
