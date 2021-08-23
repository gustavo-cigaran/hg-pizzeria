import 'package:flutter/material.dart';
import 'package:projeto_final/model/model.dart';
import 'package:projeto_final/repository/repository.dart';
import 'package:projeto_final/views/views.dart';

class ViewsPizzeriaOrder extends StatefulWidget {
  const ViewsPizzeriaOrder({Key? key}) : super(key: key);

  @override
  _ViewsPizzeriaOrderState createState() => _ViewsPizzeriaOrderState();
}

class _ViewsPizzeriaOrderState extends State<ViewsPizzeriaOrder> {

  late PizzeriaRepository _repository = PizzeriaRepository();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _tableController = TextEditingController();
  TextEditingController _valueController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  var _flavor = ['Selecione o Sabor da Pizza', 'Calabresa', 'Mussarela', 'Frango', 'Carne', 'Coraçãozinho', '5 queijos'];
  var _flavorSelected = "Selecione o Sabor da Pizza";

  _formUI(BuildContext context){
    return Column(
      children: [
        _rowIcon(),
        _rowFlavorDropdownButton(),
        _rowTable(),
        _rowValue(),
        _rowDescription(),
        _rowButton(context),
      ],
    );
  }

  _rowIcon() {
    return Icon(Icons.local_pizza, size: 150, color: Colors.amber,);
  }

  _rowFlavorDropdownButton() {
    return DropdownButton<String>(
        isExpanded: true,
        value: _flavorSelected,
        items: _flavor.map((String value){
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
          hint: const Text("Selecione o sabor"),
      onChanged: (newValue){
          setState(() {
            _flavorSelected = newValue!;
          });
      },
    );
  }

  _rowTable() {
    return TextFormField(
      controller: _tableController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Digite o número da mesa",
      ),
      maxLength: 2,
      validator: (value) {
        if(value!.isEmpty){
          return 'Numero da mesa não informado';
        }
          return null;
      },
    );
  }

  _rowValue() {
    return TextFormField(
      controller: _valueController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Digite o valor da pizza",
      ),
      maxLength: 2,
      validator: (value) {
        if(value!.isEmpty){
          return 'valor da pizza não informado';
        }
          return null;
      },
    );
  }

  _rowDescription() {
    return TextFormField(
      controller: _descriptionController,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(hintText: "Descrição da pizza"),
      maxLength: 40,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Descrição não informada';
        }
          return null;
      },
    );
  }

  _rowButton(BuildContext context) {
    return TextButton.icon(
        onPressed: () {
          _register(context);
          _resetFields();
        },
      style: TextButton.styleFrom(
        primary: Colors.amber,
        padding: const EdgeInsets.all(20.0),
        backgroundColor: Theme.of(context).primaryColor
      ),
      label: const Text('Pedir pizza'),
      icon: const Icon(Icons.add),
    );
  }

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
        title: Text('Fazer Pedido'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: _formUI(context),
        ),
      ),
    );
  }

  _register(BuildContext context){
    if(_formKey.currentState!.validate()) {
      if(_flavorSelected == 'Selecione o Sabor da pizza'){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Escolha uma pizza'),)
        );
      } else {

        final pizzeria = Pizzeria(
          flavor: _flavorSelected,
          table: _tableController.hashCode,
          value: _valueController.hashCode,
          description: _descriptionController.text);

        _repository.save(pizzeria);
        setState(() {
          Navigator.push(context,MaterialPageRoute(
              builder: (context)=>WishList()));
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Digite os campos corretamente'),)
      );
    }
  }

  _resetFields() => _formKey.currentState!.reset();
}
