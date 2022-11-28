import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:assessment_cc_flutter_sr_01/models/battle_response.dart';
import 'package:assessment_cc_flutter_sr_01/models/monster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MonsterService extends ChangeNotifier {
  List<Monster> _monsters = [];
  Monster? _player;
  Monster? _computer;
  String _lastComputerId = "";

  BattleResponse? _battleResponse;

  UnmodifiableListView<Monster> get monsters => UnmodifiableListView(_monsters);

  Future<List<Monster>> getMonsters() async {
    final response =
        await http.get(Uri.parse('${dotenv.env["API_URL"]}/monsters'));
    if (response.statusCode == 200) {
      late Iterable it;
      if (response.body is List<dynamic>) {
        Map<String, dynamic> results = json.decode(response.body);
        it = results['monsters'] as Iterable;
      } else {
        it = jsonDecode(response.body);
      }
      _monsters =
          List<Monster>.from(it.map((monster) => Monster.fromJson(monster)));
      notifyListeners();
      return _monsters;
    } else {
      throw Exception('Failed to load monsters');
    }
  }

  Future<BattleResponse?> startBattle() async {
    final response =
    await http.post(
      Uri.parse('${dotenv.env["API_URL"]}/battle'),
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String,String>{
        "monster1Id": player!.id,
        "monster2Id": computer!.id
      })
    );
    if (response.statusCode == 200) {
      late Iterable it;
      Map<String, dynamic> result = json.decode(response.body);
      notifyListeners();
      return _battleResponse = BattleResponse.fromJson(result);
    } else {
      late Iterable it;
      Map<String, dynamic> result = json.decode(response.body);
      _battleResponse = BattleResponse.fromJson(result);
      notifyListeners();
      throw Exception(_battleResponse!.message);
    }
  }

  void selectMonster(Monster monster) {
    _battleResponse = null;
    if (_player != null && _player?.id == monster.id) {
      //If the same monster is selected so
      //the monster is deselected
      _player = null;
      _computer = null;
    } else {
      _player = monster;
      generateCPUMonster();
    }
    notifyListeners();
  }

  set player(Monster? currentPlayer) {
    _player = currentPlayer;
    notifyListeners();
  }

  Monster? get player => _player;

  BattleResponse? get battleResponse => _battleResponse;

  Monster? get computer => _computer;

  void generateCPUMonster() {
    //copy the list of monsters
    List<Monster> possibleCPUMonsters = List.from(monsters);

    //remove the player monster of the list
    possibleCPUMonsters.removeWhere((e) => e.id == player!.id);

    if(_lastComputerId != "") {
      possibleCPUMonsters.removeWhere((e) => e.id == _lastComputerId);
    }

    //get random monster
    Random random = Random();
    int monsterIndex = random.nextInt(possibleCPUMonsters.length);
    _computer = possibleCPUMonsters[monsterIndex];
    _lastComputerId = _computer!.id;

  }
}
