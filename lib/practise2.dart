import 'package:flutter/material.dart';
import 'dart:async';

class Practise2 extends StatefulWidget {
  @override
  _Practise2State createState() => _Practise2State();
}

enum Answers { YES, NO, MAYBE }

class _Practise2State extends State<Practise2> {
  List<BottomNavigationBarItem> listItem;
  int tabIdex = 0;

  @override
  void initState() {
    listItem = [];

    listItem.add(BottomNavigationBarItem(
        icon: Icon(Icons.analytics), title: Text("Item1")));
    listItem.add(BottomNavigationBarItem(
        icon: Icon(Icons.car_rental), title: Text("Item2")));
    listItem.add(
        BottomNavigationBarItem(icon: Icon(Icons.forum), title: Text("Item3")));

    super.initState();
  }

  // Show bottom sheet
  void showBottomNavigation() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                new Text("Bottom sheet here"),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Close"))
              ],
            ),
          );
        });
  }

  // Snakbar
  GlobalKey<ScaffoldState> _stateScafold = new GlobalKey<ScaffoldState>();

  void showSnakBar() {
    _stateScafold.currentState
        .showSnackBar(SnackBar(content: Text("Hello World")));
  }

  // Alert dialog
  Future _showAlertDialog(BuildContext context, String message) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.pop(context), child: Text("Ok"))
            ],
          );
        });
  }

  // show Simple Dialog

  String _value = "";

  void _setValue(String val) => setState(() => _value = val);

  Future _asUser() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
              title: Text("Did you like lecture?"),
              children: [
                SimpleDialogOption(
                  child: Text("Yes"),
                  onPressed: () => Navigator.pop(context, Answers.YES),
                ),
                SimpleDialogOption(
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context, Answers.NO),
                ),
                SimpleDialogOption(
                  child: Text("Maybe"),
                  onPressed: () => Navigator.pop(context, Answers.MAYBE),
                ),
              ],
            ))) {
      case Answers.YES:
        _setValue("YES");
        break;
      case Answers.NO:
        _setValue("NO");
        break;
      case Answers.MAYBE:
        _setValue("MAY BE");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _stateScafold,
        appBar: AppBar(
          title: Text("Practise2"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: listItem,
          currentIndex: tabIdex,
          fixedColor: Colors.blue,
          onTap: (int index) => setState(() => tabIdex = index),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Current Tab Index: ${tabIdex}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              new ElevatedButton(
                  onPressed: showBottomNavigation,
                  child: Text("Show Bottom Navigation")),
              new ElevatedButton(
                  onPressed: showSnakBar, child: Text("Show Snakbar")),
              new ElevatedButton(
                  onPressed: () {
                    _showAlertDialog(context, "Do you like Flutter?");
                  },
                  child: Text("Show Alert Dialog")),
              Text(
                "Dialog Option Selected:  ${_value}",
                style: TextStyle(fontSize: 16),
              ),
              new ElevatedButton(
                  onPressed: () {
                    _asUser();
                  },
                  child: Text("Show Simple Dialog")),
            ],
          ),
        ),
      ),
    );
  }
}
