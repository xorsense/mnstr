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
    final middle = Size((size.width - 32) / 2, (size.height - 64) / 2);
    final half = 15;
    return Center(
      child: Container(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Stack(
                children: [
                  Positioned(
                      bottom: middle.height - 30,
                      left: middle.width - half,
                      child: monsterParts[MonsterPart.head]!),
                  if (monsterParts[MonsterPart.horns] != null)
                    Positioned(
                        bottom: middle.height - 12,
                        left: middle.width - half,
                        child: monsterParts[MonsterPart.horns]!),
                  Positioned(
                      bottom: middle.height - 60,
                      left: middle.width - half,
                      child: monsterParts[MonsterPart.body]!),
                  Positioned(
                      bottom: middle.height - 47,
                      left: middle.width - half,
                      child: monsterParts[MonsterPart.arms]!),
                  if (monsterParts[MonsterPart.tail] != null)
                    Positioned(
                        bottom: middle.height - 70,
                        left: middle.width - half,
                        child: monsterParts[MonsterPart.tail]!),
                  Positioned(
                      bottom: middle.height - 69,
                      left: middle.width - half,
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
