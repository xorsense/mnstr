import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'info.dart';

class Scanner extends StatelessWidget {
  const Scanner({super.key});

  @override
  Widget build(context) {
    final controller = MobileScannerController(torchEnabled: false);
    return Scaffold(
      appBar:
          AppBar(title: const Text('Scanning'), centerTitle: true, actions: [
        IconButton(
            onPressed: () {
              controller.toggleTorch();
            },
            icon: const Icon(Icons.fireplace_rounded)),
        IconButton(
            onPressed: () {
              controller.switchCamera();
            },
            icon: const Icon(Icons.flip_camera_ios_rounded))
      ]),
      body: MobileScanner(
        controller: controller,
        onDetect: (capture) {
          var info = Info(capture);
          Navigator.of(context).pop(info);
        },
      ),
    );
  }
}
