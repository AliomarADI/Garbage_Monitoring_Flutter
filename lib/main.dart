import 'package:garbage/pages/myPoints.dart';

import 'pages/garbageForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home":(context) =>HomePage(),
        "/garbageForm": (context) => GarbageForm(),
        "/infoGarb":(context) => MyPoint()
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text("Garbage Point"),
          centerTitle: true,
          backgroundColor: Colors.indigoAccent.shade700,
        ),
        body: WelcomePage(),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://wallpapersflood.com/wp-content/uploads/firewatch_2017-1440x2560.jpg"),
                  fit: BoxFit.cover
              )
          ),
          child: Column(
            children: [
              SizedBox(height: 500, width: 100),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "Экология стала самым громким словом на земле, громче войны и стихии. Оно характеризует собой одно и то же понятие вселенской беды, никогда прежде не существовавшей перед человечеством.",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    shadows: [
                      Shadow(blurRadius: 10.0,
                          color: Colors.red,
                          offset: Offset(3.0, 3.0))
                    ],
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/garbageForm');
                },
                child: Text("Go Register Garbage point"),)
            ],
          ),
        ));
  }
}
