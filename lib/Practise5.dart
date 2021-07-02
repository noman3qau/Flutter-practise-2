import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'dart:convert';

class Practise5 extends StatefulWidget {
  @override
  _Practise5State createState() => _Practise5State();
}

class _Practise5State extends State<Practise5> {
  Map _countries = Map();

  void _getCountriesData() async {
    String url = "http://country.io/names.json";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        _countries = jsonDecode(response.body);

        print("Loaded: ${_countries.length} coutries");
      });
    }
  }

  @override
  void initState() {
    _getCountriesData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Practise5"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Text(
                "Countries",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                child: Expanded(
                  child: ListView.builder(
                      itemCount: _countries.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: Container(
                            child: Text(_countries.keys.elementAt(index) +
                                " " +
                                _countries.values.elementAt(index)),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
