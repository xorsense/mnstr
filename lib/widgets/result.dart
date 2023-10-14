// import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

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
  var image;
  var shortcode = '';

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
          if (image != null) Expanded(child: Image.memory(image)),
          if (shortcode.isNotEmpty) Text('Shortcode: $shortcode', textScaleFactor: 2,),
          ElevatedButton.icon(
            onPressed: () async {
              final bytes = await controller.capture();
              debugPrint('bytes: ${bytes!.buffer.asUint8List()}');

              final res = await post(Uri.parse('https://mnstr.at'), body: bytes);
              final code = res.body;
              debugPrint('shortcode: $shortcode');
              setState(() {
                image = bytes;
                shortcode = code;
              });
            },
            label: const Text('Share'),
            icon: const Icon(Icons.ios_share),
          )
        ],
      ),
    );
  }
}
