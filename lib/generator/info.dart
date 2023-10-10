import 'dart:typed_data';

import 'package:mobile_scanner/mobile_scanner.dart';

import 'monster.dart';

class Info {
  Info(this.capture) {
    if (capture.image == null) return;
    final barcode = capture.barcodes.single;
    final values = barcode.rawValue?.split('|');
    if (values == null) return;
    id = values[0];
    firstName = values[1];
    lastName = values[2] ?? '';
    companyName = values[3] ?? '';
  }

  late final BarcodeCapture capture;
  late final String id;
  late final String firstName;
  late final String lastName;
  late final String companyName;

  Monster mnstr() {
    return Monster.fromBytes(capture.image ?? Uint8List(3));
  }
}