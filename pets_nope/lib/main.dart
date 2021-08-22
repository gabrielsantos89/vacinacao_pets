import 'package:flutter/material.dart';
import 'pet/create_sheets_page.dart';
import 'pet/pet_sheets_api.dart';
import 'vaccines/vaccine_sheets_api.dart';
import 'pet/modify_sheets_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PetSheetsApi.init();
  await VaccineSheetsApi.init();

  runApp(PetsNope());
}

class PetsNope extends StatelessWidget {
  static final String title = 'Pets Nope';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.blue),
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      );

  Widget buildBottomBar() {
    final style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Text('Pets Nope', style: style),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Text('Pets Nope', style: style),
          label: 'Modify',
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return CreateSheetsPage();
      case 1:
        return ModifySheetsPage();
      default:
        return Container();
    }
  }
}