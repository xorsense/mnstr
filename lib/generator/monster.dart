import 'dart:math';
import 'dart:typed_data';

class Monster {
  const Monster({
    required this.head,
    required this.horns,
    required this.arms,
    required this.legs,
    required this.tail,
  });

  static Monster fromBytes(Uint8List bytes) {
    final gen = Random();
    const min = 3;
    final max = bytes.length;
    final int headSeed = gen.nextInt(max - min);
    final int hornsSeed = gen.nextInt(max - min);
    final int armsSeed = gen.nextInt(max - min);
    final int legsSeed = gen.nextInt(max - min);
    final int tailSeed = gen.nextInt(max - min);

    return Monster(
      head: bytes[headSeed] % 2,
      horns: bytes[hornsSeed] % 4,
      arms: bytes[armsSeed] % 2,
      legs: bytes[legsSeed] % 2,
      tail: bytes[tailSeed] % 4,
    );
  }

  final int head;
  final int horns;
  final int arms;
  final int legs;
  final int tail;
}
