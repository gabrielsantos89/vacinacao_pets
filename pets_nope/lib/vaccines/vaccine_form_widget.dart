import 'package:flutter/material.dart';
import 'vaccine.dart';
import '../button_widget.dart';

class VaccinesFormWidget extends StatefulWidget {
  final Vaccine? vaccine;
  final int petId;
  final ValueChanged<Vaccine> onSavedVaccine;

  const VaccinesFormWidget({
    Key? key,
    this.vaccine,
    required this.petId,
    required this.onSavedVaccine,
  }) : super(key: key);

  @override
  _VaccinesFormWidgetState createState() => _VaccinesFormWidgetState();
}

class _VaccinesFormWidgetState extends State<VaccinesFormWidget> {
  final vaccineKey = GlobalKey<FormState>();
  late TextEditingController controllerVaccine;
  late TextEditingController controllerApplication;
  late TextEditingController controllerExpiration;
  late TextEditingController controllerVet;

  @override
  void initState() {
    super.initState();

    initVaccines();
  }

  @override
  void didUpdateWidget(covariant VaccinesFormWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    initVaccines();
  }

  void initVaccines() {
    final vaccine = widget.vaccine == null ? '' : widget.vaccine!.vaccine;
    final date = widget.vaccine == null ? '' : widget.vaccine!.application;
    final expirationDate = widget.vaccine == null ? '' : widget.vaccine!.expiration;
    final vet = widget.vaccine == null ? '' : widget.vaccine!.vet;
    setState(() {
      controllerVaccine = TextEditingController(text: vaccine);
      controllerApplication = TextEditingController(text: date);
      controllerExpiration = TextEditingController(text: expirationDate);
      controllerVet = TextEditingController(text: vet);
    });
  }

  @override
  Widget build(BuildContext context) => Form(
    key: vaccineKey,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildVaccine(),
        const SizedBox(height: 16),
        buildDate(),
        const SizedBox(height: 16),
        buildExpirationDate(),
        const SizedBox(height: 16),
        buildVet(),
        const SizedBox(height: 16),
        buildSubmit(),
      ],
    ),
  );

  Widget buildVaccine() => TextFormField(
    controller: controllerVaccine,
    decoration: InputDecoration(
      labelText: 'Vaccine',
      border: OutlineInputBorder(),
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Enter Vaccine Name' : null,
  );

  Widget buildDate() => TextFormField(
    controller: controllerApplication,
    decoration: InputDecoration(
      labelText: 'Application Date',
      border: OutlineInputBorder(),
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Enter Vaccine Date' : null,
  );

  Widget buildExpirationDate() => TextFormField(
    controller: controllerExpiration,
    decoration: InputDecoration(
      labelText: 'Expiration Date',
      border: OutlineInputBorder(),
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Enter Expiration Date' : null,
  );

  Widget buildVet() => TextFormField(
    keyboardType: TextInputType.text,
    controller: controllerVet,
    decoration: InputDecoration(
      labelText: 'Vet',
      border: OutlineInputBorder(),
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Enter Vet Register' : null,
  );


  Widget buildSubmit() => ButtonWidget(
    text: 'Save',
    onClicked: () {
      final form = vaccineKey.currentState!;
      final isValid = form.validate();

      if (isValid) {
        final id = widget.vaccine == null ? null : widget.vaccine!.id;
        final vaccine = Vaccine(
          id: id,
          fk: widget.petId,
          vaccine: controllerVaccine.text,
          application: controllerApplication.text,
          expiration: controllerExpiration.text,
          vet: controllerVet.text,
        );
        widget.onSavedVaccine(vaccine);
      }
    },
  );
}
