class Pizzeria{

    int? id;
    String? flavor;
    int? table;
    int? value;
    String? description;

    Pizzeria({this.id, this.flavor,this.table, this.value, this.description});

    Pizzeria.fromMap(Map map){
        id = map['id_column'] ?? 0;
        flavor = map['flavor_column'];
        table = map['table_column'];
        value = map['value_column'];
        description = map['description_column'];
    }
    Map<String, Object?> toMap(){
        Map<String, Object?> map = {
            "id_column": id,
            "flavor_column": flavor,
            "table_column": table,
            "value_column": value,
            "description_column": description,
        };
        if(id != null){
            map['id_column'] = id;
        }
        return map;

    }

  //   @override
  // String toString() {
  //   return 'Pizzeria{id: $id, flavor: $flavor, table: $table, value: $value, description: $description}';
  // }
}