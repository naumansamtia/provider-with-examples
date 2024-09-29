import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/slider_value_provider.dart';

class SliderColorExample extends StatefulWidget {
  const SliderColorExample({super.key});

  @override
  State<SliderColorExample> createState() => _SliderColorExampleState();
}

class _SliderColorExampleState extends State<SliderColorExample> {
  double value = 1.0;
  @override
  Widget build(BuildContext context) {
    // final sliderValueProvider = Provider.of<SliderValueProvider>(context, listen: false);
    print('main widget');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Slider Color Example'),
      ),
      body: Center(
        child: Consumer<SliderValueProvider>(builder: (context, value, child) {
          print('single widget');
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Slider(
                  value: value.value,
                  onChanged: (val){
                value.setValue(val);
                // setState(() {
                //   value.setValue(val);
                //   print('value: $value');
                // });
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red.withOpacity(value.value),
                      child: const Center(
                        child: Text(
                          'Container 1 Value',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.green.withOpacity(value.value),
                      child: const Center(
                        child: Text(
                          'Container 2 Value',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
