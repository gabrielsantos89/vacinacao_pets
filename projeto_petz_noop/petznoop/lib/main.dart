
  import 'dart:ui';


  import 'package:flutter/material.dart';

  void main(){
    runApp(new MaterialApp(
      home: Tela1(),
    ));
  }

  class Tela1 extends StatelessWidget {
    const Tela1({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
        ),

        body: Center(
          child:Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [

              Text("Info vacina:",style: TextStyle(color: Colors.indigo, fontSize:16, fontWeight:FontWeight.bold),),


              Padding(padding: EdgeInsets.all(10),
                child: Image.asset("imagens/vacina.png"),),


              Text("Nome vacina:",style: TextStyle(color: Colors.indigo, fontSize:16, fontWeight:FontWeight.bold),),

              Text("Data:",style: TextStyle(color: Colors.indigo, fontSize:16, fontWeight:FontWeight.bold),),

              Text("Validade:",style: TextStyle(color: Colors.indigo, fontSize:16, fontWeight:FontWeight.bold),),

              Text("Medico:",style: TextStyle(color: Colors.indigo, fontSize:16, fontWeight:FontWeight.bold),),

              Text("Crm do veterinario:",style: TextStyle(color: Colors.indigo, fontSize:16, fontWeight:FontWeight.bold),),



            ],

          ),

        ),


      );

    }

  }