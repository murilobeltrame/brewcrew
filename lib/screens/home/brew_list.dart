import 'package:brewcrew/modules/brew.dart';
import 'package:brewcrew/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final _brews = Provider.of<List<Brew>>(context);

    return ListView.builder(
      itemCount: _brews.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: _brews[index]);
      }
    );
  }
}