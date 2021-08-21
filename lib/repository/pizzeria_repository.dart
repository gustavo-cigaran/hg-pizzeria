import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:projeto_final/model/model.dart';

class PizzeriaRepository{

  final String pizzeriaTable = "pizzeria_table";
  final String idColumn = "id_Column";
  final String flavorColumn = "flavor_Column";
  final String valueColumn = "value_Column";
  final String descriptionColumn = "description_Column";

  Future<Database> initializeDB() async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "pizzeria.db");

    return openDatabase(path, version: 1,
      onCreate: (Database database, int newerVersion) async {
        await database.execute(
          "CREATE TABLE $pizzeriaTable($idColumn INTEGER PRIMARY KEY, $flavorColumn TEXT, $valueColumn TEXT, $descriptionColumn TEXT"
        );
      },
    );
  }
  Future<int> save(Pizzeria pizzeria) async{
    final Database database = await initializeDB();
    return await database.insert(this.pizzeriaTable, pizzeria.toMap());
  }

  Future<int> saveAll(List<Pizzeria> pizzeria) async{
    int result= 0;
    final Database database = await initializeDB();
    for(var pizzeria in pizzeria){
      result = await database.insert(this.pizzeriaTable, pizzeria.toMap());
    }
    return result;
  }
}