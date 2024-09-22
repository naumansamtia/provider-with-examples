import 'package:flutter/material.dart';

import 'Provider/count_provider.dart';
import 'Provider/slider_value_provider.dart';
import 'Screens/count_example.dart';
import 'package:provider/provider.dart';
import 'Screens/slider_color_example.dart';
import 'before_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SliderValueProvider()),
        ChangeNotifierProvider(create: (context) => CountProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SliderColorExample(),
      ),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const CountExample(),
    // );
  }
}

