import 'dart:convert';

class VaccineFields {
  static final String id = 'id';
  static final String fk = 'fk';
  static final String vaccine = 'vaccine';
  static final String application = 'application';
  static final String expiration = 'expiration';
  static final String vet = 'vet';

  static List<String> getFields() => [id, fk, vaccine, application, expiration, vet];
}

class Vaccine {
  final int? id;
  final int fk;
  final String vaccine;
  final String application;
  final String expiration;
  final String vet;

  const Vaccine({
    this.id,
    required this.fk,
    required this.vaccine,
    required this.application,
    required this.expiration,
    required this.vet,
  });

  Vaccine copy({
    int? id,
    int? fk,
    String? vaccine,
    String? application,
    String? expiration,
    String? vet,
  }) =>
      Vaccine(
        id: id ?? this.id,
        fk: fk ?? this.fk,
        vaccine: vaccine ?? this.vaccine,
        application: application ?? this.application,
        expiration: expiration ?? this.expiration,
        vet: vet ?? this.vet,

      );

  static Vaccine fromJson(Map<String, dynamic> json) => Vaccine(
    id: jsonDecode(json[VaccineFields.id]),
    fk: jsonDecode(json[VaccineFields.fk]),
    vaccine: json[VaccineFields.vaccine],
    application: json[VaccineFields.application],
    expiration: json[VaccineFields.expiration],
    vet: json[VaccineFields.vet],
  );

  Map<String, dynamic> toJson() => {
    VaccineFields.id: id,
    VaccineFields.fk: fk,
    VaccineFields.vaccine: vaccine,
    VaccineFields.application: application,
    VaccineFields.expiration: expiration,
    VaccineFields.vet: vet,
  };

}
