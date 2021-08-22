import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:projeto_final/repository/repository.dart';
import 'views.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

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
        title: Text('Cardápio'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              height: 500,
              width: 300,
              child: GridView.count(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                childAspectRatio: 4 / 2,
                children: [
                  FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    front: Container(
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      // ),
                      child: Text('Foto de Pizza'),
                      alignment: Alignment.center,
                      color: Colors.yellow,
                      // Image.asset('images/pizza-calabresa.jpg', fit: BoxFit.fill,),
                    ),
                    back: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Text(
                        'Calabresa',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    front: Container(
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      // ),
                      child: Text('Foto de Pizza'),
                      alignment: Alignment.center,
                      color: Colors.yellow,
                      // Image.asset('images/pizza-mussarela.jpg', fit: BoxFit.fill,),
                    ),
                    back: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Text(
                        'Mussarela',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    front: Container(
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      // ),
                      child: Text('Foto de Pizza'),
                      alignment: Alignment.center,
                      color: Colors.yellow,
                      // Image.asset('images/pizza-calabresa.jpg', fit: BoxFit.fill,),
                    ),
                    back: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Text(
                        'Calabresa',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    front: Container(
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      // ),
                      child: Text('Foto de Pizza'),
                      alignment: Alignment.center,
                      color: Colors.yellow,
                      // Image.asset('images/pizza-calabresa.jpg', fit: BoxFit.fill,),
                    ),
                    back: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Text(
                        'Calabresa',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    front: Container(
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      // ),
                      child: Text('Foto de Pizza'),
                      alignment: Alignment.center,
                      color: Colors.yellow,
                      // Image.asset('images/pizza-calabresa.jpg', fit: BoxFit.fill,),
                    ),
                    back: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Text(
                        'Calabresa',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    front: Container(
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      // ),
                      child: Text('Foto de Pizza'),
                      alignment: Alignment.center,
                      color: Colors.yellow,
                      // Image.asset('images/pizza-calabresa.jpg', fit: BoxFit.fill,),
                    ),
                    back: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Text(
                        'Calabresa',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    front: Container(
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      // ),
                      child: Text('Foto de Pizza'),
                      alignment: Alignment.center,
                      color: Colors.yellow,
                      // Image.asset('images/pizza-calabresa.jpg', fit: BoxFit.fill,),
                    ),
                    back: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Text(
                        'Calabresa',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  FlipCard(
                    direction: FlipDirection.HORIZONTAL,
                    front: Container(
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      // ),
                      child: Text('Foto de Pizza'),
                      alignment: Alignment.center,
                      color: Colors.yellow,
                      // Image.asset('images/pizza-calabresa.jpg', fit: BoxFit.fill,),
                    ),
                    back: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: Text(
                        'Calabresa',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
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
