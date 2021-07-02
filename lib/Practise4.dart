import 'package:flutter/material.dart';

class Practise4 extends StatefulWidget {
  @override
  _Practise4State createState() => _Practise4State();
}

class _Practise4State extends State<Practise4> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Practise4"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                Expanded(child: Image.asset("images/flagpk.jpeg")),
                Expanded(
                    child: Image.network(
                        "https://homepages.cae.wisc.edu/~ece533/images/boat.png"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
