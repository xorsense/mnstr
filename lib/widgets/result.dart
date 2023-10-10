import 'package:flutter/material.dart';
import '../generator/info.dart';
import './monster.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({required this.info, super.key});

  final Info info;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text('${info.firstName}`s mnstr'),),
      body: MonsterWidget(monster: info.mnstr(),),
    );
  }
}