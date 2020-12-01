import 'package:flutter/material.dart';

class MealItem extends StatefulWidget {
  MealItem({Key key, this.photoURL, this.name}) : super(key: key);
  final String photoURL;
  final String name;

  @override
  _MealItemState createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 150,
        child: Card(
            child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Container(
            width: 300,
            height: 100,
            child: Column(
              children: [Image.network(widget.photoURL), Text(widget.name)],
            ),
          ),
        )));
  }
}
