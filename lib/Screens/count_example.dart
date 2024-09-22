import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_state_manage1/Provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context , listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context , listen: false);
    print('main Widgets');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title:  Text('Count Example'),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child){
          print('single Widgets');
          return Text(
            value.count.toString(),
            style: const TextStyle(fontSize: 45),
          );
        })
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
