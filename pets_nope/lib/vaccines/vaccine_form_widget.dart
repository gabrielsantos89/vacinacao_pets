import 'package:flutter/material.dart';
import 'vaccines.dart';
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
  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerVaccine;
  late TextEditingController controllerDate;
  late TextEditingController controllerExpirationDate;
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
    final date = widget.vaccine == null ? '' : widget.vaccine!.date;
    final expirationDate = widget.vaccine == null ? '' : widget.vaccine!.expirationDate;
    final vet = widget.vaccine == null ? '' : widget.vaccine!.vet;
    setState(() {
      controllerVaccine = TextEditingController(text: vaccine);
      controllerDate = TextEditingController(text: date);
      controllerExpirationDate = TextEditingController(text: expirationDate);
      controllerVet = TextEditingController(text: vet);
    });
  }

  @override
  Widget build(BuildContext context) => Form(
    key: formKey,
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
    keyboardType: TextInputType.datetime,
    controller: controllerDate,
    decoration: InputDecoration(
      labelText: 'Date',
      border: OutlineInputBorder(),
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Enter Vaccine Date' : null,
  );

  Widget buildExpirationDate() => TextFormField(
    controller: controllerExpirationDate,
    decoration: InputDecoration(
      labelText: 'Expiration Date',
      border: OutlineInputBorder(),
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Enter Expiration Date' : null,
  );

  Widget buildVet() => TextFormField(
    keyboardType: TextInputType.number,
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
      final form = formKey.currentState!;
      final isValid = form.validate();

      if (isValid) {
        final id = widget.vaccine == null ? null : widget.vaccine!.id;
        final vaccine = Vaccine(
          id: id,
          fk: widget.petId,
          vaccine: controllerVaccine.text,
          date: controllerDate.text,
          expirationDate: controllerExpirationDate.text,
          vet: controllerVet.text,
        );
        widget.onSavedVaccine(vaccine);
      }
    },
  );
}
