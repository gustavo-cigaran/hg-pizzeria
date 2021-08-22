import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:projeto_final/model/model.dart';

class PizzeriaRepository {

  final String pizzeriaTable = "pizzeria_table";
  final String idColumn = "id_Column";
  final String flavorColumn = "flavor_Column";
  final String tableColumn = "table_Column";
  final String valueColumn = "value_Column";
  final String descriptionColumn = "description_Column";

  Future<Database> initializeDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "pizzeria.db");

    return openDatabase(path, version: 1,
      onCreate: (Database database, int newerVersion) async {
        await database.execute(
            "CREATE TABLE $pizzeriaTable($idColumn INTEGER PRIMARY KEY, $flavorColumn TEXT, $tableColumn TEXT, $valueColumn TEXT, $descriptionColumn TEXT"
        );
      },
    );
  }

  Future<int> save(Pizzeria pizzeria) async {
    final Database database = await initializeDB();
    return await database.insert(this.pizzeriaTable, pizzeria.toMap());
  }

  Future<int> saveAll(List<Pizzeria> pizzeria) async {
    int result = 0;
    final Database database = await initializeDB();
    for (var pizzeria in pizzeria) {
      result = await database.insert(this.pizzeriaTable, pizzeria.toMap());
    }
    return result;
  }

  Future<List<Pizzeria>> fetchAll() async {
    final Database database = await initializeDB();
    final List<Map<String, Object?>> query = await database.query(
        this.pizzeriaTable,
        columns: [idColumn, flavorColumn, tableColumn, valueColumn, descriptionColumn]);
    return query.map((element) => Pizzeria.fromMap(element)).toList();
  }

  // sipa nao vamos usar
  Future<Pizzeria?> findById(int id) async {
    final Database database = await initializeDB();
    List<Map> maps = await database.query(
        pizzeriaTable,
        columns: [idColumn, flavorColumn, tableColumn, valueColumn, descriptionColumn],
        where: "$idColumn = ?",
        whereArgs: [id]
    );

    if (maps.length > 0)
      return Pizzeria.fromMap(maps.first);
    else
      return null;
  }

  Future<int> delete(int id)async{
    final Database database = await initializeDB();
    return await database.delete(pizzeriaTable,where: "$idColumn = ?",
    whereArgs: [id]
    );
  }
  Future<int> uptade(Pizzeria pizzeria)async{
    final Database database = await initializeDB();
    return await database.update(
        pizzeriaTable,
        pizzeria.toMap(),
        where: "$idColumn = ?",
        whereArgs: [pizzeria.id]
    );
  }

  Future<int?> getSize() async{
    final Database database = await initializeDB();
    return Sqflite.firstIntValue(await database.rawQuery("select count(*) from $pizzeriaTable"));
  }

}