import 'package:flutter/material.dart';
import 'views.dart';

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
                        TextSpan(text: 'Feedback: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Essa disciplina está sendo bastante interessante pois o Flutter '
                            'é atualmente um dos principais frameworks para desenvolvimento de aplicações mobile e com isso '
                            'só o fato de ser um dos mais utilizados no mercado, ja consegue dar a entender que se o cara curte '
                            'mobile talvez seja uma obrigação saber "mexer" com Flutter ksksksks.'),
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
