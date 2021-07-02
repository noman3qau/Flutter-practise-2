import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Practise3 extends StatefulWidget {
  @override
  _Pratise3State createState() => _Pratise3State();
}

class _Pratise3State extends State<Practise3> {
  TextEditingController _usercontroler = TextEditingController();
  TextEditingController _passwordcontroler = TextEditingController();

  String _value = "";

  void _setValue(String value) {
    setState(() {
      _value = "You are logged In: ${value}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Practise3"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text("Please login here:"),
                          Row(
                            children: [
                              Text("Username: "),
                              Expanded(
                                child: TextField(
                                  controller: _usercontroler,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text("Password: "),
                              Expanded(
                                  child: TextField(
                                controller: _passwordcontroler,
                                obscureText: true,
                              ))
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(20)),
                          ElevatedButton(
                              onPressed: () {
                                _setValue(_usercontroler.text.trim());
                              },
                              child: Text("Login")),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(30)),
              Text(
                _value,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
