import 'package:flutter/material.dart';
import 'package:projeto_final/views/views.dart';
import 'package:projeto_final/repository/repository.dart';
import 'package:projeto_final/model/model.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);


  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {

  late PizzeriaRepository _repository;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._repository = PizzeriaRepository();
  }

  _messege(){
     return Center(child: Text('alo salve salve'),);
  }

  _progress(){
    return const Center(child: CircularProgressIndicator() ,);
  }

  _title(Pizzeria pizzeria){
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Codigo ${pizzeria.id} - ${pizzeria.flavor} - ${pizzeria.table}"),
            )
          ],
        )
      ],
    );
  }

  _subtitle(Pizzeria pizzeria){
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          const Icon(Icons.food_bank),
          Text(pizzeria.flavor.toString()),
          const Icon(Icons.tablet),
          Text(pizzeria.table.toString())
        ],
      ),
    );
  }

  _card(BuildContext context, Pizzeria pizzeria){
    return Card(
      child: ListTile(
        title: _title(pizzeria),
        subtitle: _subtitle(pizzeria),
        leading: const CircleAvatar(
          child: const Icon(Icons.person),
        ),
        trailing: GestureDetector(
          onTap: () {
            print("clicou pra excluir");
          },
          child: const Icon(Icons.delete),
        ),
        onTap: () {
          print("voce escolhea a morete ${pizzeria.toString()}");
        },
      ),
    );
  }

  _listPizzeria(BuildContext context, List<Pizzeria>? pizzeria){
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: pizzeria!.length,
        itemBuilder: (context, index){
         return Dismissible(
           direction: DismissDirection.endToStart,
           background: Container(
             color: Colors.amber,
             alignment: Alignment.centerRight,
             padding: const EdgeInsets.symmetric(horizontal: 10.0),
             child: const Icon(Icons.delete_forever),
           ),
           key: ValueKey<int>(pizzeria.elementAt(index).id as int),
           onDismissed:  (DismissDirection direction) async{
             await _repository.delete(pizzeria.elementAt(index).id!);
             setState(() {

             });
           },
           child: _card(context, pizzeria.elementAt(index)),
         );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _repository.fetchAll(),
        builder: (BuildContext context, AsyncSnapshot<List<Pizzeria>> snapshot) {
          if(snapshot.hasData){
            if(snapshot.data!.isEmpty) {
              return _messege();
            }
            List<Pizzeria>? pizzeria = snapshot.data;
            return _listPizzeria(context, pizzeria);
          } else
          {
            return _progress();
          }
        },
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
