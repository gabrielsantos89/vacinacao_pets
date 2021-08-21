import 'package:flutter/material.dart';
import 'pet_sheets_api.dart';
import 'pet_form_widget.dart';
import 'pet.dart';
import 'navigate_users_widget.dart';
import 'main.dart';
import 'button_widget.dart';

class ModifySheetsPage extends StatefulWidget {
  @override
  _ModifySheetsPageState createState() => _ModifySheetsPageState();
}

class _ModifySheetsPageState extends State<ModifySheetsPage> {
  List<Pet> pets = [];
  int index = 0;

  @override
  void initState() {
    super.initState();

    getPets();
  }

  Future getPets({int index = 0}) async {
    final pets = await PetSheetsApi.getAll();

    setState(() {
      this.index = index;
      this.pets = pets;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(MyApp.title),
      centerTitle: true,
    ),
    body: Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        children: [
          PetFormWidget(
            pet: pets.isEmpty ? null : pets[index],
            onSavedPet: (pets) async {
              await PetSheetsApi.update(pets.id!, pets.toJson());
              final newIndex = index;
              await getPets(index: newIndex);
            },
          ),
          const SizedBox(height: 16),
          if (pets.isNotEmpty) buildUserControls(),
        ],
      ),
    ),
  );

  Widget buildUserControls() => Column(
    children: [
      ButtonWidget(
        text: 'Delete',
        onClicked: deleteUser,
      ),
      const SizedBox(height: 16),
      NavigateUsersWidget(
        text: '${index + 1}/${pets.length} Users',
        onClickedNext: () {
          final nextIndex = index >= pets.length - 1 ? 0 : index + 1;

          setState(() => index = nextIndex);
        },
        onClickedPrevious: () {
          final previousIndex = index <= 0 ? pets.length - 1 : index - 1;

          setState(() => index = previousIndex);

        },
      ),
    ],
  );

  Future deleteUser() async {
    final user = pets[index];

    await PetSheetsApi.deleteById(user.id!);

    /// Just for updating UI
    final newIndex = index > 0 ? index - 1 : 0;
    await getPets(index: newIndex);
  }
}
