import 'package:flutter/material.dart';
import 'views.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.asset('images/logo_home.gif', width: 300, height: 300,),
            Text('AQUI VAI A LOGO'),
            SizedBox(height: 80,),
            TextButton.icon(
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.yellow,
                padding: EdgeInsets.all(15),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                shadowColor: Colors.black,
                elevation: 2,
              ),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(
                  builder: (context)=>MenuPage(),
                ));
              },
              icon: Icon(
                Icons.restaurant_menu_outlined,
                color: Colors.black,
              ),
              label: Text('CARDÁPIO'),
            ),
            SizedBox(height: 10,),
            TextButton.icon(
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.yellow,
                padding: EdgeInsets.all(15),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                shadowColor: Colors.black,
                elevation: 2,
              ),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(
                  builder: (context)=>AboutPage(),
                ));
              },
              icon: Icon(
                Icons.info_outlined,
                color: Colors.black,
              ),
              label: Text('SOBRE'),
            ),
          ],
        ),
      ),
    );
  }
}
