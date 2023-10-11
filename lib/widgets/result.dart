import 'package:flutter/material.dart';
import '../generator/info.dart';
import './monster.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({required this.info, super.key});

  final Info info;

  @override
  Widget build(context) {
    final name = info.firstName.isNotEmpty ? info.firstName : 'User';
    return Scaffold(
      appBar: AppBar(title: Text('$name`s mnstr'),),
      body: MonsterWidget(monster: info.mnstr(),),
    );
  }
}