import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title: Text("Leandro Ucuamba Calc"),
            backgroundColor: Color.fromARGB(251, 4, 97, 126),),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                    Padding(padding: EdgeInsets.all(8.0),
                    child: Text(
                      textoDisplay,
                      style: TextStyle(color: Colors.white, fontSize: 65),
                      ),
                    ),
                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    btCalc(texto: '7', cor: Colors.grey),
                    btCalc(texto: '8', cor: Colors.grey),
                    btCalc(texto: '9', cor: Colors.grey),
                    btCalc(texto: '+', cor: Colors.blue),

                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    btCalc(texto: '4', cor: Colors.grey),
                    btCalc(texto: '5', cor: Colors.grey),
                    btCalc(texto: '6', cor: Colors.grey),
                    btCalc(texto: '-', cor: Colors.blue),

                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    btCalc(texto: '1', cor: Colors.grey),
                    btCalc(texto: '2', cor: Colors.grey),
                    btCalc(texto: '3', cor: Colors.grey),
                    btCalc(texto: 'x', cor: Colors.blue),

                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    btCalc(texto: '0', cor: Colors.grey),
                    btCalc(texto: 'C', cor: Color.fromARGB(255, 219, 56, 56)),
                    btCalc(texto: '=', cor: Colors.blue),
                    btCalc(texto: '/', cor: Colors.blue),

                 ],
               ),
               Padding(padding: EdgeInsets.only(bottom: 50))
            ],
        ),
     );
  }


 Widget btCalc({required Color cor, required String texto}) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ElevatedButton(
        onPressed: () {
          calcular(texto);
        },
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(70, 74),
            shape: CircleBorder(),
            primary: cor),
        child: Text(
          texto,
          style: const TextStyle(fontSize: 40),
        ),

      ),
   );
 }

 //logica da calculadora
 String textoDisplay = '';
 String resultado = '';
 int numeroUm = 0;
 int numeroDois = 0;
 String operacao = '';
 bool novoNumero = false;

 void calcular(String texto)
  {
    if(texto == 'C'){
      resultado = '0';
      numeroUm = 0;
      numeroDois = 0;
      novoNumero = false;
      operacao = '';
    } else if(texto == '+' ||
        texto == '-' ||
        texto == 'x' ||
        texto == '/' ||
        texto == '=') {
      novoNumero = true;
      if (texto != '='){
        operacao = texto;
      }
      if (numeroUm == 0){
        numeroUm = int.parse(textoDisplay);
      } else {
        if (numeroDois == 0){
          numeroDois = int.parse(textoDisplay);
        }
        if (operacao == '+'){
          resultado = (numeroUm + numeroDois).toString();
        } else if (operacao == '-'){
          resultado = (numeroUm - numeroDois).toString();
        } else if (operacao == '/'){
          resultado = (numeroUm / numeroDois).toString();
        } else if (operacao == 'x'){
          resultado = (numeroUm * numeroDois).toString();
        }
        
        if (int.parse(resultado) > 0){
          numeroDois = int.parse(resultado);
          numeroUm = 0;
        }
      }
    } else {
      if (novoNumero) {
        resultado = texto;
        novoNumero = false;
        numeroDois = 0;
      } else {
        if (resultado == '0') {
          resultado = texto;
        } else {
          resultado = textoDisplay + texto;
        }
      }
    }
  
    setState((){
       textoDisplay = resultado;
    });


  }//fim calcular;
}//fim HomePageState;

