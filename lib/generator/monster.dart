import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class Monster {
  const Monster({
    required this.color,
    required this.head,
    required this.horns,
    required this.arms,
    required this.legs,
    required this.tail,
  });

  static Monster fromBytes(Uint8List bytes) {
    final hash = sha1.convert(bytes);
    final parts = hash.bytes;
    final color = Color.fromRGBO(parts[5], parts[10], parts[15], 100);
    final head =
        parts.sublist(0, 1).reduce((value, element) => value + element);
    final horns =
        parts.sublist(2, 6).reduce((value, element) => value + element);
    final arms =
        parts.sublist(7, 8).reduce((value, element) => value + element);
    final legs =
        parts.sublist(9, 10).reduce((value, element) => value + element);
    final tail =
        parts.sublist(11, 15).reduce((value, element) => value + element);

    return Monster(
      color: color,
      head: head % 2,
      horns: horns % 4,
      arms: arms % 2,
      legs: legs % 2,
      tail: tail % 4,
    );
  }

  final Color color;
  final int head;
  final int horns;
  final int arms;
  final int legs;
  final int tail;
}
