import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CombinedPage(),
    );
  }
}

// メインのページとなるStatelessWidget
class CombinedPage extends StatelessWidget {
  const CombinedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox & Slider & Stopwatch"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //   チェックボックスコンポーネント
            CustomCheckBox(),

            SizedBox(height: 30),

            // スライダーコンポーネント
            CustomSlider(),
          ],
        ),
      ),
    );
  }
}

// チェックボックスコンポーネント
class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  void _toggleCheckbox() {
    setState(() {
      isChecked = !isChecked;
    });
    print("isChecked = [$isChecked]");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 70),
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text("利用規約に同意する"),
            value: isChecked,
            onChanged: (value) {
              _toggleCheckbox();
            },
          ),
        ),
        Text(("isChecked = [$isChecked]")),
      ],
    );
  }
}

// スライダーコンポーネント
class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Slider(
          value: _currentSliderValue,
          min: 0,
          max: 100,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
            print("Value Selected : ${_currentSliderValue.round()}");
          },
        ),
        Text("Value Selected: ${_currentSliderValue.round()}"),
      ],
    );
  }
}
