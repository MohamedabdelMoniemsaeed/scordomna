import 'package:flutter/material.dart';
import 'package:scordomna/components/Button.dart';

// ignore: must_be_immutable
class HomeSceen extends StatefulWidget {
  String name;

  HomeSceen({required this.name});

  @override
  State<HomeSceen> createState() => _HomeSceenState(name: '$name');
}

class _HomeSceenState extends State<HomeSceen> {
  String scor = "";

  String resultText = "";

  String number1 = "";
  String name;
  String operator = "";

  _HomeSceenState({required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$name",
                style: TextStyle(fontSize: 40),
              ),
              Text(
                "$number1",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(""),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          resultText,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: IconButton(
                          onPressed: () {
                            onDelete();
                          },
                          splashColor: Colors.blue,
                          splashRadius: 20,
                          iconSize: 10,
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                            size: 24,
                            weight: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ButtonNumber(num: "7", onButtonClickAll: onDigitClick),
              ButtonNumber(num: "8", onButtonClickAll: onDigitClick),
              ButtonNumber(num: "9", onButtonClickAll: onDigitClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ButtonNumber(num: "4", onButtonClickAll: onDigitClick),
              ButtonNumber(num: "5", onButtonClickAll: onDigitClick),
              ButtonNumber(num: "6", onButtonClickAll: onDigitClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ButtonNumber(num: "1", onButtonClickAll: onDigitClick),
              ButtonNumber(num: "2", onButtonClickAll: onDigitClick),
              ButtonNumber(num: "3", onButtonClickAll: onDigitClick),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ButtonNumber(num: "-", onButtonClickAll: plspls),
              ButtonNumber(num: "0", onButtonClickAll: onDigitClick),
              ButtonNumber(num: "+", onButtonClickAll: plspls),
            ],
          ),
        ),
        // Expanded(
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: [
        //       // ButtonNumber(num: "Enter", onButtonClickAll: onEqualClick),
        //       ButtonNumber(num: "Delete", onButtonClickAll: onDelete),
        //     ],
        //   ),
        // ),
      ],
    );
  }

// Button Number
  void onDigitClick(String buttText) {
    print("Click on Button $buttText");
    // if (buttText == ".") {
    //   if (resultText.contains(".")) {
    //     return;
    //   }
    // }
    setState(() {
      resultText += buttText;
    });
  }

// Button Delete
  void onDelete() {
    setState(() {
      resultText = "";
      operator = "";
    });
  }

// Button + & -
  void plspls(String buttText) {
    // if (operator.isNotEmpty) {
    //   return;
    // }
    operator = buttText;
    if (number1.isEmpty) {
      number1 = resultText;

      setState(() {
        resultText = "";
      });
      print("1");
    } else {
      int n1 = int.parse(resultText);
      int n2 = int.parse(number1);
      int res = 0;
      if (operator == "-") {
        if (n2 >= n1) {
          res = n2 - n1;
        }
      } else if (operator == "+") {
        res = n1 + n2;
      }

      setState(() {
        number1 = res.toString();
        resultText = "";
      });

      print("2");
    }
  }
}
