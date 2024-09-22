import 'dart:async';

import 'package:flutter/material.dart';

class BeforeProvider extends StatefulWidget {
  const BeforeProvider({super.key});

  @override
  State<BeforeProvider> createState() => _BeforeProviderState();
}

class _BeforeProviderState extends State<BeforeProvider> {

  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {

      setState(() {
        count++;
        print('count: $count');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print('BeforeProvider build' + count.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title:  Text('Before Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                DateTime.now().hour.toString() + ':' + DateTime.now().minute.toString() + ':' + DateTime.now().second.toString(),
                style: TextStyle(fontSize: 45),
              ),
            ),
            Text(
              count.toString(),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     count++;
      //     print('count: $count');
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
