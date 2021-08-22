import 'package:flutter/material.dart';
import 'vaccine_sheets_api.dart';
import '../main.dart';
import 'vaccine_form_widget.dart';

class CreateVaccinePage extends StatelessWidget {
  final int petId;

  const CreateVaccinePage({
    Key? key,
    required this.petId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(MyApp.title),
      centerTitle: true,
    ),
    body: Builder(
      builder: (context) => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: VaccinesFormWidget(
            petId: petId,
            onSavedVaccine: (vaccine) async {
              final id = await VaccineSheetsApi.getRowCount() + 1;
              final newUser = vaccine.copy(id: id);

              await VaccineSheetsApi.insert([newUser.toJson()]);

              final snackBar = SnackBar(
                content: Text('Vaccine Added Succefully!'),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ),
      ),
    ),
  );
}
