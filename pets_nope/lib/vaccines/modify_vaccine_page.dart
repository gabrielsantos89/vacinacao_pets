import 'package:flutter/material.dart';
import 'vaccine.dart';
import 'vaccine_sheets_api.dart';
import '../main.dart';
import '../button_widget.dart';
import '../pet/navigate_pets_widget.dart';
import 'vaccine_form_widget.dart';

class ModifyVaccinePage extends StatefulWidget {

  final int petId;

  const ModifyVaccinePage({
    Key? key,
    required this.petId,
  }) : super(key: key);
  @override
  _ModifyVaccinePageState createState() => _ModifyVaccinePageState();
}

class _ModifyVaccinePageState extends State<ModifyVaccinePage> {
  List<Vaccine> vaccines = [];
  int index = 0;

  @override
  void initState() {
    super.initState();

    getVaccines();
  }

  Future getVaccines({int index = 0}) async {
    vaccines = await VaccineSheetsApi.getAll();
    List<Vaccine> newVaccineList = [];
    for(int i=0;i<vaccines.length;i++) {
      if(vaccines[i].fk == widget.petId)
        newVaccineList.add(vaccines[i]);
    }

    setState(() {
      this.index = index;
      this.vaccines = newVaccineList;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(PetsNope.title),
      centerTitle: true,
    ),
    body: Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        children: [
          VaccinesFormWidget(
            petId: widget.petId,
            vaccine: vaccines.isEmpty ? null : vaccines[index],
            onSavedVaccine: (vaccines) async {
              await VaccineSheetsApi.update(vaccines.id!, vaccines.toJson());
              final newIndex = index;
              await getVaccines(index: newIndex);
            },
          ),
          const SizedBox(height: 16),
          if (vaccines.isNotEmpty) buildUserControls(),
        ],
      ),
    ),
  );

  Widget buildUserControls() => Column(
    children: [
      ButtonWidget(
        text: 'Delete',
        onClicked: deleteVaccine,
      ),
      const SizedBox(height: 16),
      NavigatePetsWidget(
        text: '${index + 1}/${vaccines.length} Vaccines',
        onClickedNext: () {
          final nextIndex = index >= vaccines.length - 1 ? 0 : index + 1;

          setState(() => index = nextIndex);
        },
        onClickedPrevious: () {
          final previousIndex = index <= 0 ? vaccines.length - 1 : index - 1;

          setState(() => index = previousIndex);

        },
      ),
    ],
  );

  Future deleteVaccine() async {
    final vaccine = vaccines[index];

    await VaccineSheetsApi.deleteById(vaccine.id!);

    /// Just for updating UI
    final newIndex = index > 0 ? index - 1 : 0;
    await getVaccines(index: newIndex);
  }
}
