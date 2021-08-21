import 'dart:convert';

class PetFields {
  static final String id = 'id';
  static final String name = 'name';
  static final String race = 'race';
  static final String owner = 'owner';
  //static final String weight = 'weight';
  //static final String age = 'age';

  static List<String> getFields() => [id, name, race, owner, /*weight, age*/];
}

class Pet {
  final int? id;
  final String name;
  final String race;
  final String owner;
  //final double weight;
  //final int age;

  const Pet({
    this.id,
    required this.name,
    required this.race,
    required this.owner,
    //required this.weight,
   // required this.age,
  });

  Pet copy({
    int? id,
    String? name,
    String? race,
    String? owner,
    //double? weight,
    //int? age,
  }) =>
      Pet(
        id: id ?? this.id,
        name: name ?? this.name,
        race: race ?? this.race,
        owner: owner ?? this.owner,
        //weight: weight ?? this.weight,
       // age: age ?? this.age,

      );

  static Pet fromJson(Map<String, dynamic> json) => Pet(
    id: jsonDecode(json[PetFields.id]),
    name: json[PetFields.name],
    race: json[PetFields.race],
    owner: json[PetFields.owner],
    //weight: json[PetFields.weight],
    //age: json[PetFields.age],
  );

  Map<String, dynamic> toJson() => {
    PetFields.id: id,
    PetFields.name: name,
    PetFields.race: race,
    PetFields.owner: owner,
    //PetFields.weight: weight,
    //PetFields.age: age,
  };
}
