import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _rowImages(),
            SizedBox(height: 20.0,),
            Container(
              width: 420,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Gustavo Cigaran e Henrique Macedo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Hand',
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  const Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'Email: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'gustavocigaran@gmail.com / henriquemacedoti@gmail.com',),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  const Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'Quem são: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Simplesmente os Dinossauros da QI'),
                      ],
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

  _rowImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 55,
          backgroundColor: Colors.yellow,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/gustavo.jpg'),
          ),
        ),
        SizedBox(width: 20.0,),
        CircleAvatar(
          radius: 55,
          backgroundColor: Colors.yellow,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/henrique.jpeg'),
          ),
        ),
      ],
    );
  }
}
