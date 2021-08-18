import 'package:flutter/material.dart';

void main() => runApp(TelaCadastroVacina());

class TelaCadastroVacina extends StatefulWidget {
  @override
  TelaCadastroVacinaState createState() {
    return new TelaCadastroVacinaState();
  }
}

class TelaCadastroVacinaState extends State<TelaCadastroVacina> {
  final TextEditingController _controladorNomeVacina = TextEditingController();
  final TextEditingController _controladorValidade = TextEditingController();
  final TextEditingController _controladorData = TextEditingController();
  final TextEditingController _controladorMedico = TextEditingController();
  final TextEditingController _controladorCrmMedico = TextEditingController();
  bool validarNomeVac = false;
  bool validarValidade = false;
  bool validarData = false;
  bool validarMedico = false;
  bool validarCrmMedico = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset("imagens/baner.png"),
          Padding(padding: EdgeInsets.all(8)),
          Text("Cadastro das vacinas do pet",
            style: TextStyle(fontSize: 25),
          ),
          Padding(padding: EdgeInsets.all(8)),
          Padding(padding: EdgeInsets.only(left: 16, right: 16),
            child: TextField(
             controller: _controladorNomeVacina,
              decoration: InputDecoration(labelText: "Nome da Vacina",
              errorText: validarNomeVac ? "Campo Vazio" : null,
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: _controladorValidade,
            decoration: InputDecoration(labelText: "Validade da Vacina",
              errorText: validarValidade ? "Campo Vazio" : null,
            ),
            keyboardType: TextInputType.text,
          ),
        ),
          Padding(padding: EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: _controladorData,
            decoration: InputDecoration(labelText: "Data de vacinação",
              errorText: validarData ? "Campo Vazio" : null,
            ),
            keyboardType: TextInputType.text,
          ),
        ),
          Padding(padding: EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: _controladorMedico,
            decoration: InputDecoration(labelText: "Nome do veterinário",
              errorText: validarMedico ? "Campo Vazio" : null,
            ),
            keyboardType: TextInputType.text,
          ),
        ),
          Padding(padding: EdgeInsets.only(left: 16, right: 16),
          child: TextField(
            controller: _controladorCrmMedico,
            decoration: InputDecoration(labelText: "CRM do veterinário",
              errorText: validarCrmMedico ? "Campo Vazio" : null,
            ),
            keyboardType: TextInputType.text,
          ),
        ),
          Padding(padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text("Cadastrar"),
              MaterialButton(onPressed:
                ()
                {
                  final String nomeVacina = _controladorNomeVacina.text;
                  final String validade = _controladorValidade.text;
                  final String data = _controladorData.text;
                  final String medico = _controladorMedico.text;
                  final String crmMedico = _controladorCrmMedico.text;
                  setState(() {
                    _controladorNomeVacina.text.isEmpty ? validarNomeVac = true : validarNomeVac = false;
                    _controladorValidade.text.isEmpty ? validarValidade = true : validarValidade = false;
                    _controladorData.text.isEmpty ? validarData = true : validarData = false;
                    _controladorMedico.text.isEmpty ? validarMedico = true : validarMedico = false;
                    _controladorCrmMedico.text.isEmpty ? validarCrmMedico = true : validarCrmMedico = false;
                  });
                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Icon(Icons.add,
                  size: 24,
                ),
                padding: EdgeInsets.all(24),
                shape: CircleBorder(),
              ),
            ]
          ),
            )
          ],
      ),
      )
    );
  }
}