import 'package:flutter/material.dart';

void main() => runApp(TelaCadastroPet());

class TelaCadastroPet extends StatefulWidget {
  const TelaCadastroPet({Key? key}) : super(key: key);

  @override
  TelaCadastroPetState createState() {
    return new TelaCadastroPetState();
  }
}

class TelaCadastroPetState extends State<TelaCadastroPet> {

  final TextEditingController _controladorNomePet = TextEditingController();
  final TextEditingController _controladorRaca = TextEditingController();
  final TextEditingController _controladorNomeDono = TextEditingController();
  final TextEditingController _controladorPeso = TextEditingController();
  final TextEditingController _controladorIdade = TextEditingController();
  bool validarNomePet = false;
  bool validarRaca = false;
  bool validarNomeDono = false;
  bool validarPeso = false;
  bool validarIdade = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
         child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset("imagens/logo.png"),
              Padding(padding: EdgeInsets.all(4)),
              Text("Cadastro do Pet",
                style: TextStyle(fontSize: 24),
              ),
              Padding(padding: EdgeInsets.all(4)),
              Padding(padding: EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  controller: _controladorNomePet,
                  decoration: InputDecoration(labelText: "Nome do Pet",
                  errorText: validarNomePet ? "Campo Vazio" : null,
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  controller: _controladorRaca,
                  decoration: InputDecoration(labelText: "Nome do Pet",
                    errorText: validarRaca ? "Campo Vazio" : null,
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  controller: _controladorNomeDono,
                  decoration: InputDecoration(labelText: "Nome do Pet",
                    errorText: validarNomeDono ? "Campo Vazio" : null,
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  controller: _controladorIdade,
                  decoration: InputDecoration(labelText: "Nome do Pet",
                    errorText: validarIdade ? "Campo Vazio" : null,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  controller: _controladorPeso,
                  decoration: InputDecoration(labelText: "Nome do Pet",
                    errorText: validarPeso ? "Campo Vazio" : null,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Cadastrar"),
                      MaterialButton(onPressed:
                          ()
                      {
                        final String nomePet = _controladorNomePet.text;
                        final String Raca = _controladorRaca.text;
                        final String nomeDono = _controladorNomeDono.text;
                        final String idade = _controladorIdade.text;
                        final String peso = _controladorPeso.text;
                        setState(() {
                          _controladorNomePet.text.isEmpty ? validarNomePet = true : validarNomePet = false;
                          _controladorRaca.text.isEmpty ? validarRaca = true : validarRaca = false;
                          _controladorNomeDono.text.isEmpty ? validarNomeDono = true : validarNomeDono = false;
                          _controladorIdade.text.isEmpty ? validarIdade = true : validarIdade = false;
                          _controladorPeso.text.isEmpty ? validarPeso = true : validarPeso = false;
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
      )
    );
  }
}


