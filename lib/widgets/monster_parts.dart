import 'package:flutter/material.dart';

import '../generator/monster.dart';

const scale = 1.7;

class MonsterParts {
  MonsterParts({required this.monster});

  Monster monster;

  Image get head {
    if (monster.head == 0) {
      return Image.asset(
        'assets/mnstr_parts/head_1.png',
        scale: scale,
      );
    }
    return Image.asset('assets/mnstr_parts/head_2.png', scale: scale);
  }

  Image? get horns {
    switch (monster.horns) {
      case 0:
        return Image.asset('assets/mnstr_parts/horns_short.png', scale: scale);
      case 1:
        return Image.asset('assets/mnstr_parts/horns_spiraled.png',
            scale: scale);
      case 2:
        return Image.asset('assets/mnstr_parts/horns_striped.png',
            scale: scale);
    }
    return null;
  }

  Image get arms {
    if (monster.arms == 0) {
      return Image.asset('assets/mnstr_parts/arms_two.png', scale: scale);
    }
    return Image.asset('assets/mnstr_parts/arms_four.png', scale: scale);
  }

  Image get legs {
    if (monster.legs == 0) {
      return Image.asset('assets/mnstr_parts/legs_long.png', scale: scale);
    }
    return Image.asset('assets/mnstr_parts/legs_short.png', scale: scale);
  }

  Image? get tail {
    switch (monster.horns) {
      case 0:
        return Image.asset('assets/mnstr_parts/tail_long.png', scale: scale);
      case 1:
        return Image.asset('assets/mnstr_parts/tail_twins.png', scale: scale);
      case 2:
        return Image.asset('assets/mnstr_parts/tail_stripes.png', scale: scale);
    }
    return null;
  }

  Image get body =>
      Image.asset('assets/mnstr_parts/body_base.png', scale: scale);

  Map<MonsterPart, Image?> get monsterParts {
    return {
      MonsterPart.horns: horns,
      MonsterPart.head: head,
      MonsterPart.body: body,
      MonsterPart.arms: arms,
      MonsterPart.legs: legs,
      MonsterPart.tail: tail,
    };
  }
}

enum MonsterPart {
  horns,
  head,
  body,
  arms,
  legs,
  tail;
}
