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
      appBar: AppBar(
        title: Text('$name`s mnstr'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MonsterWidget(
                monster: info.mnstr(),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {

            },
            label: const Text('Share'),
            icon: const Icon(Icons.ios_share),
          )
        ],
      ),
    );
  }
}
