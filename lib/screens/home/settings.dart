import 'package:flutter/material.dart';
import 'package:brewcrew/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your brew settings',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20,),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20,),
          DropdownButtonFormField(
            decoration: textInputDecoration,
            items: sugars.map((sugar) => DropdownMenuItem(
              value: sugar,
              child: Text('$sugar sugars'),
            )).toList(),
            onChanged: (val) => setState(() => _currentSugars = val),
            value: _currentSugars ?? '0'
          ),
          SizedBox(height: 20,),
          Slider(
            activeColor: Colors.brown[_currentStrength ?? 100],
            divisions: 8,
            inactiveColor: Colors.brown[_currentStrength ?? 100],
            max: 900,
            min: 100,
            onChanged: (val) => setState(() => _currentStrength = val.round()),
            value: (_currentStrength ?? 100).toDouble()
          ),
          SizedBox(height: 20,),
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {

            },
          )
        ],
      ),
    );
  }
}