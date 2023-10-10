import 'package:flutter/material.dart';
import './generator/info.dart';
import './generator/scanner.dart';
import './widgets/result.dart';

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mnstr',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.cyanAccent,
      ),
      home: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('mnstr'),),
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.qr_code),
          onPressed: () async {
            final nav = Navigator.of(context);
            final info =
            await nav.push(MaterialPageRoute(
              builder: (context) => const Scanner(),
            ));
            if (info != null) {
              nav.push(MaterialPageRoute(
                builder: (context) => ResultWidget(info: info),
              ));
            }
          },
        ),
      ),
    );
  }
}
