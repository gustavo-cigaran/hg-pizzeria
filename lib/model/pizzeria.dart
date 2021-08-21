import 'dart:js_util';

class Pizzeria{
    int? id;
    String? flavor;
    int? value;
    String? description;

    Pizzeria({this.id, this.flavor, this.value, this.description});

    Pizzeria.fromMap(Map map){
        id = map['id_column'] ?? 0;
        flavor = map['falavor_column'];
        value = map['value_column'];
        description = map['description_column'];
    }
    Map<String, Object?> toMap(){
        Map<String, Object?> map = {
            "id_column": id,
            "falavor_column": flavor,
            "value_column": value,
            "description_column": description,
        };
        if(id != null){
            map['id_column'] = id;
        }
        return map;

    }
}