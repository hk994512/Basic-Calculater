import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculaterView extends StatefulWidget {
  const CalculaterView({super.key});

  @override
  State<CalculaterView> createState() => _CalculaterViewState();
}

class _CalculaterViewState extends State<CalculaterView> {
  final _textOne = TextEditingController();
  final _textTwo = TextEditingController();
  int x = 0;
  int y = 0;
  double z = 0;
  @override
  void initState() {
    _textOne.text = x.toString();
    _textTwo.text = y.toString();
    super.initState();
  }

  double calculateResult(String n) {
    switch (n) {
      case "+":
        z = double.parse(_textOne.text) + double.parse(_textTwo.text);
        break;
      case "-":
        z = double.parse(_textOne.text) - double.parse(_textTwo.text);
        break;
      case "*":
        z = double.parse(_textOne.text) * double.parse(_textTwo.text);
        break;
      case "/":
        z = double.parse(_textOne.text) / double.parse(_textTwo.text);
        break;
      case "clear":
        _textOne.clear();
        _textTwo.clear();
        z = 0;
        break;
    }
    return z;
  }

  @override
  void dispose() {
    _textOne.dispose();
    _textTwo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Scaffold(
        body: Column(
          children: [
            Calculater(
              textOne: _textOne,
              label: "Enter first number",
            ),
            const SizedBox(
              height: 10,
            ),
            Calculater(textOne: _textTwo, label: "Enter second number"),
            const SizedBox(
              height: 20,
            ),
            Text(
              z.toString(),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 35,
                  ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  icon: CupertinoIcons.add,
                  result: () {
                    setState(() {
                      calculateResult("+");
                    });
                  },
                ),
                CustomButton(
                  icon: CupertinoIcons.minus,
                  result: () {
                    setState(() {
                      calculateResult("-");
                    });
                  },
                ),
                CustomButton(
                  icon: CupertinoIcons.multiply,
                  result: () {
                    setState(() {
                      calculateResult("*");
                    });
                  },
                ),
                CustomButton(
                  icon: CupertinoIcons.divide,
                  result: () {
                    setState(() {
                      calculateResult("/");
                    });
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.pink),
                  onPressed: () {
                    setState(() {
                      calculateResult("clear");
                    });
                  },
                  child: const Text("Clear"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



class Calculater extends StatelessWidget {
  const Calculater({super.key, required this.textOne, required this.label});

  final TextEditingController textOne;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(10))),
      controller: textOne,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
    );
  }
}
