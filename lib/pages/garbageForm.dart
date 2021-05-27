import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garbage/Model/GarbageModel.dart';

import '../main.dart';
import 'myPoints.dart';

class GarbageForm extends StatefulWidget {
  @override
  _GarbageForm createState() => _GarbageForm();
}

class _GarbageForm extends State<GarbageForm> {
  final _phoneNumberController = TextEditingController();
  final _countryController = TextEditingController();
  final _regionController = TextEditingController();
  final _addressController = TextEditingController();
  final _sizeController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _countryController.dispose();
    _regionController.dispose();
    _sizeController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home": (context) => HomePage(),
        "/garbageForm": (context) => GarbageForm(),
        "/infoGarb": (context) => MyPoint(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text("Register Garbage Point"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Form(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Номер телефона',
                    helperText: 'Phone format: 8-(XXX)-XXX-XXXX',
                    prefixIcon: Icon(Icons.phone),
                    suffixIcon: Icon(
                      Icons.delete_outline_outlined,
                      color: Colors.red,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.blue, width: 3))),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: _countryController,
                decoration: InputDecoration(
                  labelText: 'Country',
                  hintText: "Страна",
                  prefixIcon: Icon(Icons.zoom_out_map),
                  suffixIcon: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width:
                              3.0) //При нажатиии на инпут border увеличивается на 3
                      ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: _regionController,
                decoration: InputDecoration(
                  labelText: 'Region',
                  hintText: "Область",
                  prefixIcon: Icon(Icons.location_city),
                  suffixIcon: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width:
                              3.0) //При нажатиии на инпут border увеличивается на 3
                      ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: "Точный адрес",
                  prefixIcon: Icon(Icons.location_on_outlined),
                  suffixIcon: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width:
                              3.0) //При нажатиии на инпут border увеличивается на 3
                      ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: _sizeController,
                decoration: InputDecoration(
                  labelText: 'Size of garbage point',
                  hintText: "Размер мусора в обьеме",
                  helperText: "Длина х Высота х Ширина",
                  prefixIcon: Icon(Icons.photo_size_select_small),
                  suffixIcon: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width:
                              3.0) //При нажатиии на инпут border увеличивается на 3
                      ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.pushNamed(context, '/infoGarb',
                      arguments: Garbage(
                          _countryController.text,
                          _regionController.text,
                          _addressController.text,
                          _sizeController.text,
                          _phoneNumberController.text));
                },
                child: Text("Send"),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
