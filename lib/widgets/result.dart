import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import './monster.dart';
import '../generator/info.dart';

class ResultWidget extends StatefulWidget {
  ResultWidget({required this.info, super.key});
  final Info info;
  @override
  State<StatefulWidget> createState() => _ResultWidgetState(info: info);
}

class _ResultWidgetState extends State<ResultWidget> {
  _ResultWidgetState({required this.info});

  final Info info;
  final controller = ScreenshotController();

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
              child: Screenshot(
                controller: controller,
                child: MonsterWidget(
                  monster: info.mnstr(),
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              final bytes = await controller.capture();
              debugPrint('bytes: ${bytes!.toList()}');

              await Share.shareXFiles([
                XFile.fromData(bytes, mimeType: 'image/png', name: 'mnstr.png')
              ], text: 'Your mnstr from ATO 2023');

              // TODO: shortcode
              // final res = await post(Uri.parse('https://mnstr.at'), body: bytes);
              // final code = res.body;
              // debugPrint('shortcode: $shortcode');
              // setState(() {
              //   image = bytes;
              //   shortcode = code;
              // });
            },
            label: const Text('Share'),
            icon: const Icon(Icons.ios_share),
          )
        ],
      ),
    );
  }
}
