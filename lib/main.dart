import 'package:flutter/material.dart';
import 'dart:async'; //ストップウォッチ用のインポート

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

            SizedBox(height: 50),

            // スライダーコンポーネント
            CustomSlider(),

            SizedBox(height: 50),

            // ストップウォッチコンポーネント
            CustomStopWatch(),
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

// ストップウォッチコンポーネント
class CustomStopWatch extends StatefulWidget {
  const CustomStopWatch({super.key});

  @override
  State<CustomStopWatch> createState() => _CustomStopWatchState();
}

class _CustomStopWatchState extends State<CustomStopWatch> {
  Timer _timer = Timer(Duration.zero, () {});
  final Stopwatch _stopwatch = Stopwatch();
  String _time = "00:00:000";

  void _startTimer() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
        setState(() {
          final Duration elapsed = _stopwatch.elapsed;
          final String minute = elapsed.inMinutes.toString().padLeft(2, "0");
          final String sec = (elapsed.inSeconds % 60).toString().padLeft(
            2,
            "0",
          );
          final String milliSec = (elapsed.inMilliseconds % 1000)
              .toString()
              .padLeft(3, "0");
          _time = "$minute:$sec:$milliSec";
        });
      });
    }
  }

  void _stopTimer() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _timer.cancel();
    }
  }

  void _resetTimer() {
    _stopwatch.reset();
    _time = "00:00:000";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget> [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("経過時間"),
        ),
        Text(
          "$_time",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            ElevatedButton(onPressed: _startTimer, child: const Text("スタート")),
            const SizedBox(width: 10,),
            ElevatedButton(onPressed: _stopTimer, child: const Text("ストップ")),
            const SizedBox(width: 10,),
            ElevatedButton(onPressed: _resetTimer, child: const Text("リセット")),
          ],
        )
      ],
    );
  }
}
