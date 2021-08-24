import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:projeto_final/model/model.dart';

class PizzeriaRepository {

  final String pizzeriaSQL = "pizzeria";

  final String pizzeriaTable = "pizzeriaTable";
  final String idColumn = "id_column";
  final String flavorColumn = "flavor_column";
  final String tableColumn = "table_column";
  final String valueColumn = "value_column";
  final String descriptionColumn = "description_column";

  Future<Database> initializeDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "pizzeria.db");

    return openDatabase(path, version: 1,
      onCreate: (Database database, int newerVersion) async {
        await database.execute(
            "CREATE DATABASE $pizzeriaSQL; USE $pizzeriaSQL; CREATE TABLE $pizzeriaTable($idColumn INTEGER PRIMARY KEY,$flavorColumn varchar(40),$tableColumn INT(2),$valueColumn int(2),$descriptionColumn varchar(40))"
        );
      },
    );
  }

  Future<int> save(Pizzeria pizzeria) async {
    final Database database = await initializeDB();
    return await database.insert(pizzeriaTable, pizzeria.toMap());
  }

  Future<int> saveAll(List<Pizzeria> pizzerias) async {
    int result = 0;
    final Database database = await initializeDB();
    for(var pizzeria in pizzerias) {
      result = await database.insert(pizzeriaTable, pizzeria.toMap());
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

    if (maps.isNotEmpty) {
      return Pizzeria.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> delete(int id) async {
    final Database database = await initializeDB();
    return await database.delete(
        pizzeriaTable,
        where: "$idColumn = ?",
        whereArgs: [id]
    );
  }

  Future<int> update(Pizzeria pizzeria) async {
    final Database database = await initializeDB();
    return await database.update(
        pizzeriaTable,
        pizzeria.toMap(),
        where: "$idColumn = ?",
        whereArgs: [pizzeria.id]
    );
  }

  Future<int?> getSize() async {
    final Database database = await initializeDB();
    return Sqflite.firstIntValue(await database.rawQuery("select count(*) from $pizzeriaTable"));
  }

}