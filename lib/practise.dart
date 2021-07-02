import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Practise extends StatefulWidget {
  @override
  _PractiseState createState() => _PractiseState();
}

class _PractiseState extends State<Practise> {
  // App Bar
  int _count = 0;

  void increament() {
    setState(() {
      _count++;
    });
  }

  void decreament() {
    setState(() {
      _count--;
    });
  }

  //Floating Action button
  String _timer = "";

  void _updateTime() => setState(() => _timer = DateTime.now().toString());

  //Persistance Footer buttons
  String _footerButton = "";

  void _updateValueOnFooterButton(String value) =>
      setState(() => _footerButton = value);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Practise"),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: increament,
            ),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: decreament,
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        persistentFooterButtons: [
          new IconButton(
              icon: Icon(Icons.build),
              onPressed: () => _updateValueOnFooterButton("Button1")),
          new IconButton(
              icon: Icon(Icons.pedal_bike_outlined),
              onPressed: () => _updateValueOnFooterButton("Button2")),
          new IconButton(
              icon: Icon(Icons.car_rental),
              onPressed: () => _updateValueOnFooterButton("Button3")),
          new IconButton(
              icon: Icon(Icons.analytics),
              onPressed: () => _updateValueOnFooterButton("Button4")),
        ],
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Count: $_count',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  _timer,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  _footerButton,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _updateTime,
          backgroundColor: Colors.blue,
          child: Icon(Icons.timer),
        ),
      ),
    );
  }
}
