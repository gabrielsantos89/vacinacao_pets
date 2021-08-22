import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'pet.dart';
import '../button_widget.dart';

class PetFormWidget extends StatefulWidget {
  final Pet? pet;
  final ValueChanged<Pet> onSavedPet;

  const PetFormWidget({
    Key? key,
    this.pet,
    required this.onSavedPet,
  }) : super(key: key);

  @override
  _PetFormWidgetState createState() => _PetFormWidgetState();
}

class _PetFormWidgetState extends State<PetFormWidget> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerName;
  late TextEditingController controllerRace;
  late TextEditingController controllerOwner;
  late TextEditingController controllerWeight;
  late TextEditingController controllerAge;

  @override
  void initState() {
    super.initState();

    initPets();
  }

  @override
  void didUpdateWidget(covariant PetFormWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    initPets();
  }

  void initPets() {
    final name = widget.pet == null ? '' : widget.pet!.name;
    final race = widget.pet == null ? '' : widget.pet!.race;
    final owner = widget.pet == null ? '' : widget.pet!.owner;
    final weight = widget.pet == null ? '' : widget.pet!.weight;
    final age = widget.pet == null ? '' : widget.pet!.age;

    setState(() {
      controllerName = TextEditingController(text: name);
      controllerRace = TextEditingController(text: race);
      controllerOwner = TextEditingController(text: owner);
      controllerWeight = TextEditingController(text: weight);
      controllerAge = TextEditingController(text: age);
    });
  }

  @override
  Widget build(BuildContext context) => Form(
    key: formKey,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildName(),
        const SizedBox(height: 16),
        buildRace(),
        const SizedBox(height: 16),
        buildOwner(),
        const SizedBox(height: 16),
        buildWeight(),
        const SizedBox(height: 16),
        buildAge(),
        const SizedBox(height: 16),
        buildSubmit(),
      ],
    ),
  );

  Widget buildName() => TextFormField(
    controller: controllerName,
    decoration: InputDecoration(
      labelText: 'Name',
      border: OutlineInputBorder(),
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Enter Name' : null,
  );

  Widget buildRace() => TextFormField(
    controller: controllerRace,
    decoration: InputDecoration(
      labelText: 'Race',
      border: OutlineInputBorder(),
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Enter Race' : null,
  );

  Widget buildOwner() => TextFormField(
    controller: controllerOwner,
    decoration: InputDecoration(
      labelText: 'Owner',
      border: OutlineInputBorder(),
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Enter Owner Name' : null,
  );

  Widget buildWeight() => TextFormField(
    keyboardType: TextInputType.number,
    controller: controllerWeight,
    decoration: InputDecoration(
      labelText: 'Weight',
      border: OutlineInputBorder(),
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Enter Pet Weight' : null,
  );

  Widget buildAge() => TextFormField(
    keyboardType: TextInputType.number,
    controller: controllerAge,
    decoration: InputDecoration(
      labelText: 'Age',
      border: OutlineInputBorder(),
    ),
    validator: (value) =>
    value != null && value.isEmpty ? 'Enter Pet Age' : null,
  );

  Widget buildSubmit() => ButtonWidget(
    text: 'Save',
    onClicked: () {
      final form = formKey.currentState!;
      final isValid = form.validate();

      if (isValid) {
        final id = widget.pet == null ? null : widget.pet!.id;
        final user = Pet(
          id: id,
          name: controllerName.text,
          race: controllerRace.text,
          owner: controllerOwner.text,
          weight: double.parse(controllerWeight.text),
          age: int.parse(controllerAge.text),
        );
        widget.onSavedPet(user);
      }
    },
  );
}
