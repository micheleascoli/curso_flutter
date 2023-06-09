import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void _carregarItens(){
    _itens = [];
    for(int i=0; i<=10; i++){
      Map<String, dynamic> item = Map();
      item["titulo"] = "Título ${i} Lorem ipsum dolor sit amet.";
      item["descricao"] = "Descrição ${i} ipsum dolor sit amet.";
      _itens.add(item);
    }
  }


  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice){
              return ListTile(
                onTap: (){
                  //print("Clique com onTap");
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text(_itens[indice]["titulo"].toString()),
                          titlePadding: EdgeInsets.all(20),
                          titleTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.orange
                          ),
                          content: Text(_itens[indice]["descricao"].toString()),
                          actions: [
                            TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Sim")
                            ),
                            TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Não")
                            ),
                          ],

                        );
                      }
                  );
                },
                /*
                onLongPress: (){
                  print("Clique com onLongPress");
                },
                 */
                title: Text(_itens[indice]["titulo"].toString()),
                subtitle: Text(_itens[indice]["descricao"].toString()),
              );
            }
        ),
      ),
    );
  }
}
