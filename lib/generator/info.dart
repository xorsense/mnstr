import 'dart:ffi';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'monster.dart';

class Info {
  Info(this.capture) {
    if (capture.image == null) return;
    final barcode = capture.barcodes.single;
    if (barcode.rawValue == null) return;

    List<String> input = List.generate(5, (index) => '');

    for (final (i,v) in barcode.rawValue!.split('|').indexed) {
      input[i] = v;
    }

    id = input[0];
    firstName = input[1];
    lastName = input[2];
    companyName = input[3];
  }

  late final BarcodeCapture capture;
  late final String id;
  late final String firstName;
  late final String lastName;
  late final String companyName;

  Monster mnstr() {
    return Monster.fromBytes(capture.barcodes.single.rawBytes ?? Uint8List(0));
  }
}