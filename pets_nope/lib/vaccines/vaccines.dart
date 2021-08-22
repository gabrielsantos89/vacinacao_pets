import 'dart:convert';

class VaccineFields {
  static final String id = 'id';
  static final String fk = 'fk';
  static final String vaccine = 'vaccine';
  static final String date = 'date';
  static final String expirationDate = 'expirationDate';
  static final String vet = 'vet';

  static List<String> getFields() => [id, fk, vaccine, date, expirationDate, vet,];
}

class Vaccine {
  final int? id;
  final int fk;
  final String vaccine;
  final String date;
  final String expirationDate;
  final String vet;

  const Vaccine({
    this.id,
    required this.fk,
    required this.vaccine,
    required this.date,
    required this.expirationDate,
    required this.vet,
  });

  Vaccine copy({
    int? id,
    int? fk,
    String? vaccine,
    String? date,
    String? expirationDate,
    String? vet,
  }) =>
      Vaccine(
        id: id ?? this.id,
        fk: fk ?? this.fk,
        vaccine: vaccine ?? this.vaccine,
        date: date ?? this.date,
        expirationDate: expirationDate ?? this.expirationDate,
        vet: vet ?? this.vet,

      );

  static Vaccine fromJson(Map<String, dynamic> json) => Vaccine(
    id: jsonDecode(json[VaccineFields.id]),
    fk: jsonDecode(json[VaccineFields.fk]),
    vaccine: json[VaccineFields.vaccine],
    date: json[VaccineFields.date],
    expirationDate: json[VaccineFields.expirationDate],
    vet: json[VaccineFields.vet],
  );

  Map<String, dynamic> toJson() => {
    VaccineFields.id: id,
    VaccineFields.fk: fk,
    VaccineFields.vaccine: vaccine,
    VaccineFields.date: date,
    VaccineFields.expirationDate: expirationDate,
    VaccineFields.vet: vet,
  };
}
