import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_study/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNum;

  const SettingsScreen({required this.maxNum, Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000; //여기에서는 위젯을 사용할 수 없다.

  @override
  void initState() {
    super.initState();

    maxNumber = widget.maxNum.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Body(maxNumber: maxNumber),
              _Footer(
                onSliderChanged: onSliderChanged,
                maxNumber: maxNumber,
                onButtonPressed: onButtonPressed
              )
            ],
          ),
        )
      ),
    );
  }

  void onSliderChanged(double val) {
    setState(() {
      maxNumber = val;
    });
  }

  void onButtonPressed() {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;
  const _Body({required this.maxNumber, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
          children:
          maxNumber.toInt().toString().split('').map(
                (e) => Image.asset(
              'asset/img/$e.png',
              width: 50.0,
              height: 70.0,
            ),
          ).toList()
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double>? onSliderChanged;
  final VoidCallback onButtonPressed;

  const _Footer({
    required this.onSliderChanged,
    required this.maxNumber,
    required this.onButtonPressed,
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
            value: maxNumber,
            min: 1000,
            max: 100000,
            onChanged: onSliderChanged
        ),
        ElevatedButton(
            onPressed: onButtonPressed,
            style:  ElevatedButton.styleFrom(
                backgroundColor: RED_COLOR
            ),
            child: Text('저장')
        )
      ],
    );
  }
}


