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
      home: MyHomePage(),
    );
  }
}

// メインのページとなるStatefulWidget
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // チェックボックスの状態
  bool isChecked = false;

  // スライダーの状態
  double currentSliderValue = 20;

  void toggleCheckbox(){
    setState(() {
      isChecked = !isChecked;
    });
    print("isChecked = [$isChecked]");
  }

  void updateSliderValue(double value){
    setState(() {
      currentSliderValue = value;
    });
    print("Value Selected : ${currentSliderValue.round()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox & Slider Demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
            //   チェックボックス部分
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text("利用規約に同意する"),
                  value: isChecked,
                  onChanged: (value) {
                    toggleCheckbox();
                  },
                ),
              ),
              Text("isChecked = [$isChecked]"),

              SizedBox(height: 30,),

              // スライダー部分
              Slider(
                value: currentSliderValue,
                min: 0,
                max: 100,
                label: currentSliderValue.round().toString(),
                onChanged: (double value) {
                  updateSliderValue(value);
                },
              ),
              Text("Value Selected : ${currentSliderValue.round()}"),

            ],
        ),
      ),
    );
  }
}

//
// // チェックボックスのClass
// class MyCheckBox extends StatefulWidget {
//   const MyCheckBox({super.key});
//
//   @override
//   State<MyCheckBox> createState() => _MyCheckBoxState();
// }
//
// class _MyCheckBoxState extends State<MyCheckBox> {
//   bool isChecked = false;
//
//   void _toggleCheckbox() {
//     setState(() {
//       // isCheckedの値を反転させる
//       isChecked = !isChecked;
//     });
//     print("isChecked = [$isChecked]");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("CheckBox & Slider Demo"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 70),
//               child: CheckboxListTile(
//                 controlAffinity: ListTileControlAffinity.leading,
//                 title: const Text("利用規約に同意する"),
//                 value: isChecked,
//                 onChanged: (value) {
//                   _toggleCheckbox();
//                 },
//               ),
//             ),
//             Text("isChecked = [$isChecked]"),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MySlider extends StatefulWidget {
//   const MySlider({super.key});
//
//   @override
//   State<MySlider> createState() => _MySliderState();
// }
//
// class _MySliderState extends State<MySlider> {
//   double _currentSliderValue = 20;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("CheckBox & Slider Demo"),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Slider(
//               value: _currentSliderValue,
//               min: 0,
//               max: 100,
//               label: _currentSliderValue.round().toString(),
//               onChanged: (double value) {
//                 setState(() {
//                   _currentSliderValue = value;
//                 });
//                 print("Value Selected : ${_currentSliderValue.round()}");
//               },
//             ),
//             Text("Value Selected : ${_currentSliderValue.round()}"),
//           ],
//         ),
//       ),
//     );
//   }
// }
