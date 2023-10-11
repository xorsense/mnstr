
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'info.dart';

class Scanner extends StatelessWidget {
  const Scanner({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      body: MobileScanner(
        onDetect: (capture) {
          var info = Info(capture);
          Navigator.of(context).pop(info);
        },
      ),
    );
  }
}
