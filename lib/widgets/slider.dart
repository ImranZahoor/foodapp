import 'package:flutter/material.dart';

class AppSlider extends StatefulWidget {
  const AppSlider({Key? key}) : super(key: key);

  @override
  _AppSliderState createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  double _currentSliderValue = 80;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 100,
      divisions: 100,
      activeColor: Color(0xff8FD14F),
      inactiveColor: Color(0x888FD14F),
      label: _currentSliderValue.round().toString(),
      onChanged: _onSlider1Changed,
    );
  }

  void _onSlider1Changed(double value) {
    print(value);
    setState(() {
      this._currentSliderValue = value;
    });
  }
}
