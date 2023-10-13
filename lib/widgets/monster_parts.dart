import 'package:flutter/material.dart';

import '../generator/monster.dart';

class MonsterParts {
  MonsterParts({required this.monster});

  Monster monster;

  Image get head {
    if (monster.head == 0) {
      return Image.asset('assets/mnstr_parts/head_1.png');
    }
    return Image.asset('assets/mnstr_parts/head_2.png');
  }

  Image? get horns {
    switch (monster.horns) {
      case 0:
        return Image.asset('assets/mnstr_parts/horns_short.png');
      case 1:
        return Image.asset('assets/mnstr_parts/horns_spiraled.png');
      case 2:
        return Image.asset('assets/mnstr_parts/horns_striped.png');
    }
    return null;
  }

  Image get arms {
    if (monster.arms == 0) {
      return Image.asset('assets/mnstr_parts/arms_two.png');
    }
    return Image.asset('assets/mnstr_parts/arms_four.png');
  }

  Image get legs {
    if (monster.legs == 0) {
      return Image.asset('assets/mnstr_parts/legs_long.png');
    }
    return Image.asset('assets/mnstr_parts/legs_short.png');
  }

  Image? get tail {
    switch (monster.horns) {
      case 0:
        return Image.asset('assets/mnstr_parts/tail_long.png');
      case 1:
        return Image.asset('assets/mnstr_parts/tail_twins.png');
      case 2:
        return Image.asset('assets/mnstr_parts/tail_stripes.png');
    }
    return null;
  }

  Image get body => Image.asset('assets/mnstr_parts/body_base.png');

  List<Image> get monsterParts {
    List<Image> parts = [];

    parts.addAll([head, arms, legs, body]);

    if (horns != null) parts.add(horns!);

    if (tail != null) parts.add(tail!);

    return parts;
  }
}
