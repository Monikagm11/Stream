import 'dart:async';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // StreamController controller = StreamController();
  final StreamController<String> _streamController = StreamController<String>();
  List data = [];

  // void _handleButtonClick() {
  //   Future.delayed(const Duration(seconds: 4), () {
  //     for (int i = 0; i < 4; i++) {
  //       _streamController.add("This is a  statement");
  //       _streamController.stream.listen((data) {
  //         print(data);
  //       });
  //     }
  //   });
  // }

  // _handleButtonClick() {
  //   for (int i = 0; i < 5; i++) {
  //     _streamController.add("$i");
  //     Future.delayed(const Duration(
  //       seconds: 4,
  //     ));
  //     _streamController.stream.listen((data) {
  //       print(data);
  //     });
  //   }
  //   _streamController.close();
  // }

  // Stream _handlestream () *async{
  //   for(int i=0;i<5;i++){
  //     _streamController.add("$i");
  //    await  Future.delayed(Duration(seconds: 5));
  //     _streamController.stream.listen((data) {
  //       print(data);
  //     });
  //   }

  // }
  Stream _handlestream() async* {
    for (int i = 0; i < 5; i++) {
      var streamController = "This is $i statement";

      await Future.delayed(const Duration(seconds: 4));
      yield streamController;

      // var name = "This is $i  histatement";

      // await Future.delayed(const Duration(seconds: 4));
      // yield name;
    }
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
        centerTitle: true,
      ),
      body: StreamBuilder<dynamic>(
          stream: _handlestream(),
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text(data.contains(snapshot.data)
                //     ? data.toString()
                //     : "No data"),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) => Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 237, 210, 210)),
                            padding: const EdgeInsets.all(10),
                            child: Text(data[index])),
                      )),
                ),

                // StreamBuilder<String>(
                //   stream: _streamController.stream,
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       return Text(snapshot.data ?? "");
                //     }
                //     return Container();
                //   },
                // ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _handlestream().listen((val) {
                      print(val);
                      data.add(val);
                    });
                    // print(i);
                  },
                  child: const Text('Click Me'),
                ),
              ],
            );
          }),
    );
  }
}
