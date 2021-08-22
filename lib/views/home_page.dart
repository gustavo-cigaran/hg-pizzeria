import 'package:flutter/material.dart';
import 'package:projeto_final/model/model.dart';
import 'package:projeto_final/repository/repository.dart';
import 'views.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late PizzeriaRepository _repository;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._repository = PizzeriaRepository();
  }

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
              label: Text('Cardápio'),
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
              label: Text('Sobre'),
            ),
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
                  builder: (context)=>WishList(),
                ));
              },
              icon: Icon(
                Icons.list_alt,
                color: Colors.black,
              ),
              label: Text('Lista de pedidos'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final reloadPage = await Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => ViewsPizzeriaOrder())
          );

          if(reloadPage){
            setState(() {
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
