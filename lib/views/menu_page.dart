import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'views.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sla'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              height: 600,
              width: 300,
              child: GridView.count(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                childAspectRatio: 4 / 2,
                children: [
                  FlipCard(
                    direction: FlipDirection.HORIZONTAL, // default
                    front: Container(
                      child: Text('Front'),
                      color: Colors.green,
                      alignment: Alignment.center,
                    ),
                    back: Container(
                      child: Text('Back'),
                      color: Colors.green,
                      width: 100,
                      height: 50,
                    ),
                  ),
                  FlipCard(
                    direction: FlipDirection.HORIZONTAL, // default
                    front: Container(
                      child: Text('Front'),
                      color: Colors.green,
                      width: 100,
                      height: 50,
                    ),
                    back: Container(
                      child: Text('Back'),
                      color: Colors.green,
                      width: 100,
                      height: 50,
                    ),
                  ),
                  FlipCard(
                    direction: FlipDirection.HORIZONTAL, // default
                    front: Container(
                      child: Text('Front'),
                      color: Colors.green,
                      width: 100,
                      height: 50,
                    ),
                    back: Container(
                      child: Text('Back'),
                      color: Colors.green,
                      width: 100,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
