import 'package:flutter/material.dart';
import 'widgets/joypad.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    new JoyStick(),
    Text(
      'Index 1: Controls',
      style: optionStyle,
    ),
    Text(
      'Index 2: Automation',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          child: Image.asset("icons/99d-icon-web-dark.png"),
          padding: EdgeInsets.all(5),
        ),
        title: Text("Connected To Chatterbot"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              "icons/noun_gamepad_829144.png",
              height: 75,
              color: Colors.grey,
            ),
            label: 'Joystick',
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "icons/noun_setting_3977743.png",
              height: 75,
              color: Colors.grey,
            ),
            label: 'Controls',
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "icons/noun_go_327544.png",
              height: 75,
              color: Colors.grey,
            ),
            label: 'Automation',
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "icons/noun_Settings_893722.png",
              height: 75,
              color: Colors.grey,
            ),
            label: 'Settings',
            // backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class JoyStick extends StatefulWidget {
  const JoyStick({Key? key}) : super(key: key);

  @override
  _JoyStickState createState() => _JoyStickState();
}

class _JoyStickState extends State<JoyStick> {
  double _currentSlider1Value = 80;
  double _currentSlider2Value = 50;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  height: 450,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Slider(
                      value: _currentSlider1Value,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: _currentSlider1Value.round().toString(),
                      onChanged: _onSlider1Changed,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 450,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Slider(
                      value: _currentSlider2Value,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: _currentSlider2Value.round().toString(),
                      onChanged: _onSlider2Changed,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: JoyPad(
                onChange: (Offset delta) => print(delta),
              ),
            ),
          ],
        ),
      ],
    ));
  }

  void _onSlider1Changed(double value) {
    print(value);
    setState(() {
      this._currentSlider1Value = value;
    });
  }

  void _onSlider2Changed(double value) {
    print(value);
    setState(() {
      this._currentSlider2Value = value;
    });
  }
}
