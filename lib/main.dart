import 'package:flutter/material.dart';
import '/screens/calculator_view.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        cardColor: const Color.fromARGB(255, 9, 16, 54),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red, onBackground: Colors.white)),
    home: const Home()));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 9, 16, 54),
          title: Text(
            "Calculator",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
        body: const CalculaterView());
  }
}
