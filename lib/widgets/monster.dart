import 'dart:developer';

import 'package:flutter/material.dart';
import '../generator/monster.dart';

class MonsterWidget extends StatelessWidget {
  const MonsterWidget({required this.monster, super.key});

  final Monster monster;

  @override
  Widget build(context) {
    return Center(
      child: Container(
        color: monster.color,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('head: ${monster.head}'),
              Text('horns: ${monster.horns}'),
              Text('arms: ${monster.arms}'),
              Text('legs: ${monster.legs}'),
              Text('tail: ${monster.tail}'),
            ],
          ),
        ),
      ),
    );
  }
}