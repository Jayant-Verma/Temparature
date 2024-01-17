import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State createState() => _CurrencyConverterMaterialPage();
}

class _CurrencyConverterMaterialPage extends State {
  String temperature = "";
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final borderStyle = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        style: BorderStyle.solid,
        color: Color(0xffEEEEEE),
      ),
      borderRadius: BorderRadius.circular(25),
    );

    return Scaffold(
      backgroundColor: const Color(0xff222831),
      appBar: AppBar(
        backgroundColor: const Color(0xff393E46),
        title: const Text('Temparature Converter'),
        foregroundColor: const Color(0xffEEEEEE),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              temperature != "" ? '$temperature degree Celcius' : '',
              style: const TextStyle(
                  color: Color(0xffEEEEEE),
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                controller: textEditingController,
                showCursor: true,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                style: const TextStyle(color: Color(0xffEEEEEE)),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.thermostat,
                    color: Color(0xff00ADB5),
                  ),
                  hintText: "Please enter temparature in Fahrenheit",
                  hintStyle: const TextStyle(
                    color: Color(0xffEEEEEE),
                  ),
                  focusedBorder: borderStyle,
                  enabledBorder: borderStyle,
                ),
                cursorColor: const Color(0xff00ADB5),
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                elevation: MaterialStatePropertyAll(20),
                foregroundColor: MaterialStatePropertyAll(
                  Color(0xffEEEEEE),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  Color(0xff00ADB5),
                ),
              ),
              onPressed: () {
                setState(() {
                  temperature =
                      ((double.parse(textEditingController.text) - 32) *
                              (5 / 9))
                          .toStringAsFixed(2);
                });
              },
              child: const Text("Convert to Celcius"),
            )
          ],
        ),
      ),
    );
  }
}
