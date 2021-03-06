import 'package:flutter/material.dart';
import 'pet_sheets_api.dart';
import 'pet_form_widget.dart';
import '../main.dart';

class CreateSheetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(PetsNope.title),
      centerTitle: true,
    ),
    body: Builder(
      builder: (context) => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: PetFormWidget(
            onSavedPet: (pet) async {
              final id = await PetSheetsApi.getRowCount() + 1;
              final newPet = pet.copy(id: id);

              await PetSheetsApi.insert([newPet.toJson()]);

              final snackBar = SnackBar(
                content: Text('Pet Added Succefully!'),
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
