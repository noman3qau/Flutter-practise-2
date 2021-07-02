import 'package:flutter/material.dart';
import 'package:flutter_live_template/Practise4.dart';
import 'package:flutter_live_template/Practise5.dart';
import 'dart:async';

import 'package:flutter_live_template/practise.dart';
import 'package:flutter_live_template/practise2.dart';
import 'package:flutter_live_template/practise3.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  // TextInout
  String _value = "";

  onChange(String value) {
    setState(() {
      _value = 'OnChange: $value';
    });
  }

  onSubmit(String value) {
    setState(() {
      _value = 'OnSubmit: $value';
    });
  }

  //Checkbox
  bool _value1 = false;
  bool _value2 = false;

  void value1Changed(bool value) => setState(() {
        _value1 = value;
      });

  void value2Changed(bool value) => setState(() {
        _value2 = value;
      });

  // Radio Button
  int _radio1 = 0;
  int _radio2 = 0;

  void onRadio1Change(int value) => setState(() => _radio1 = value);

  void onRadio2Change(int value) => setState(() => _radio2 = value);

  Widget makeRadioButton() {
    List<Widget> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(new Radio(
        value: i,
        groupValue: _radio1,
        onChanged: onRadio1Change,
      ));
    }
    return Row(
      children: list,
    );
  }

  // Radio Button List Tile
  Widget makeRadioButtonTile() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(new RadioListTile(
        value: i,
        groupValue: _radio2,
        onChanged: onRadio2Change,
        title: Text('Item: $i'),
        subtitle: Text('Subtitle: $i'),
        controlAffinity: ListTileControlAffinity.trailing,
        activeColor: Colors.green,
        tileColor: Colors.black12,
      ));
    }
    return Column(
      children: list,
    );
  }

  // Switch
  bool _switch1 = false;
  bool _switch2 = false;

  void switchChanged1(bool value) => setState(() => _switch1 = value);

  void switchChanged2(bool value) => setState(() => _switch2 = value);

  // Slider
  double _sliderValue = 0.0;

  void onSliderChanged(double value) => setState(() => _sliderValue = value);

  // Date Picker
  String dateSelected = "";

  Future selectDate() async {
    DateTime picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2022));

    if (picker != null) setState(() => dateSelected = picker.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
        actions: [
          new IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new Practise())))
        ],
      ),
      drawer: Drawer(
        child: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              children: [
                Text("Hello World"),
                Container(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Practise2())),
                    child: Text("Practise2")),
                Container(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Practise3())),
                    child: Text("Practise3")),
                Container(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Practise4())),
                    child: Text("Practise4")),
                Container(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Practise5())),
                    child: Text("Practise5")),
                Container(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Close")),
              ],
            )),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Text(_value),
              new TextField(
                decoration: InputDecoration(
                    labelText: "Hello",
                    hintText: "World",
                    icon: Icon(Icons.people)),
                autofocus: true,
                autocorrect: true,
                keyboardType: TextInputType.text,
                onChanged: onChange,
                onSubmitted: onSubmit,
              ),
              new Checkbox(value: _value1, onChanged: value1Changed),
              new CheckboxListTile(
                value: _value2,
                onChanged: value2Changed,
                title: new Text("Hello World"),
                controlAffinity: ListTileControlAffinity.leading,
                subtitle: Text("Subtitle"),
                secondary: Icon(Icons.archive),
                activeColor: Colors.red,
              ),
              Row(
                children: [makeRadioButton()],
              ),
              makeRadioButtonTile(),
              new Switch(value: _switch1, onChanged: switchChanged1),
              new SwitchListTile(
                value: _switch2,
                onChanged: switchChanged2,
                subtitle: Text("Subtitle"),
                title: Text(
                  "Swith Test",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                  child: new Text(
                      'Slider Value: ${(_sliderValue * 100).round()}')),
              Slider(
                  value: _sliderValue,
                  onChanged: onSliderChanged,
                  activeColor: Colors.red,
                  inactiveColor: Colors.grey),
              Text('Date: $dateSelected'),
              ElevatedButton(
                  onPressed: selectDate, child: Text("Show Date Picker")),
            ],
          ),
        ),
      ),
    );
  }
}
