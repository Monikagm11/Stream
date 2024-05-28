import 'dart:async';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final StreamController<String> _streamController = StreamController<String>();

  void _handleButtonClick() {
    print("This is a fisrt statement");
    _streamController.add("This is a fisrt statement");

    Future.delayed(const Duration(seconds: 4), () {
      print("This is a second statement");
      _streamController.add("This is a second statement");
    });

    Future.delayed(const Duration(seconds: 4), () {
      print("This is a third statement");
      _streamController.add("This is a third statement");
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
              stream: _streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data ?? "");
                }
                return Container();
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleButtonClick,
              child: const Text('Click Me'),
            ),
          ],
        ),
      ),
    );
  }
}
