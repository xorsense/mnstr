import 'package:flutter/material.dart';

import '../generator/monster.dart';
import 'monster_parts.dart';

class MonsterWidget extends StatelessWidget {
  const MonsterWidget({required this.monster, super.key});

  final Monster monster;

  @override
  Widget build(context) {
    final monsterParts = MonsterParts(monster: monster).monsterParts;
    final size = MediaQuery.of(context).size;
    final middle = Size((size.width - (540 - (540 / scale))) / 7,
        (size.height - (1080 - (1080 / scale))) / 3);
    return Center(
      child: Container(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(
              child: Stack(
                children: [
                  Positioned(
                      bottom: middle.height - 90,
                      left: middle.width,
                      child: monsterParts[MonsterPart.body]!),
                  Positioned(
                      bottom: middle.height + 190,
                      left: middle.width,
                      child: monsterParts[MonsterPart.head]!),
                  if (monsterParts[MonsterPart.horns] != null)
                    Positioned(
                        bottom: middle.height + 380,
                        left: middle.width,
                        child: monsterParts[MonsterPart.horns]!),
                  if (monsterParts[MonsterPart.tail] != null)
                    Positioned(
                        bottom: middle.height - 198,
                        left: middle.width,
                        child: monsterParts[MonsterPart.tail]!),
                  Positioned(
                      bottom: middle.height + 19,
                      left: middle.width,
                      child: monsterParts[MonsterPart.arms]!),
                  if (monster.legs == 0)
                    Positioned(
                        top: middle.height + 173,
                        left: middle.width,
                        child: monsterParts[MonsterPart.legs]!),
                  if (monster.legs == 1)
                    Positioned(
                        top: middle.height + 272,
                        left: middle.width + 1,
                        child: monsterParts[MonsterPart.legs]!),
                ],
              ),
            ),
          ),
          SizedBox(
              child: Container(
            color: monster.color,
          )),
        ]),
      ),
    );
  }
}
