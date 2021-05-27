import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:garbage/Model/GarbageModel.dart';

import '../main.dart';
import 'garbageForm.dart';

class MyPoint extends StatelessWidget {
  Garbage garbage;

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context).settings;
    garbage = settings.arguments;

    return MaterialApp(
      routes: {
        "/home": (context) => HomePage(),
        "/garbageForm": (context) => GarbageForm(),
        "/infoGarb": (context) => MyPoint(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text("Info sended"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text("Go back"),
              ),
              Text(
                "Country: ${garbage.country}",
                style: TextStyle(),
              ),
              Text(
                "Region: ${garbage.region}",
                style: TextStyle(),
              ),
              Text(
                "Address: ${garbage.address}",
                style: TextStyle(),
              ),
              Text(
                "Size: ${garbage.size}",
                style: TextStyle(),
              ),
              Text(
                "Phone: ${garbage.phoneNumber}",
                style: TextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
