

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


            Text("Nome:",style: TextStyle(color: Colors.indigo, fontSize:16, fontWeight:FontWeight.bold),),

            Text("Idade:",style: TextStyle(color: Colors.indigo, fontSize:16, fontWeight:FontWeight.bold),),

            Text("Raça:",style: TextStyle(color: Colors.indigo, fontSize:16, fontWeight:FontWeight.bold),),

            Text("Dono:",style: TextStyle(color: Colors.indigo, fontSize:16, fontWeight:FontWeight.bold),),

            Text("Vacinas :",style: TextStyle(color: Colors.indigo, fontSize:16, fontWeight:FontWeight.bold),),
            Padding(padding: EdgeInsets.only(top: 30),
                      child: RaisedButton(
                            padding: EdgeInsets.all(15),
                         child: Text("Vacina",style: TextStyle(fontSize: 10),),
                            onPressed: (){},
                      ),
            ),

          ],

        ),

      ),


    );

  }

}