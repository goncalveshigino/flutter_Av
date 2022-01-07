import 'dart:io';

import 'package:band/model/band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<Band> bands = [

     Band(id: '1',name: 'Metalica', votes: 5),
     Band(id: '2',name: 'Queen', votes: 1),
     Band(id: '3',name: 'Herois do Silencio', votes: 4),
     Band(id: '4',name: 'Bon Jovi', votes: 3),
     Band(id: '5',name: 'Hillsong', votes: 3),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nome de Bandas', style: TextStyle( color: Colors.black87)), 
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: ( context,  i) =>  _bandTile(bands[i])
      ),
       floatingActionButton: FloatingActionButton(
         child: Icon( Icons.add, color: Colors.blue[100]),
         elevation: 1,
         onPressed: addNewBand
       ),
    );
  }


  Widget _bandTile(Band band) {
          return Dismissible(
            key: Key(band.id),
            direction: DismissDirection.startToEnd,
            onDismissed: ( direction ){
               print('Direction:  $direction');
               print('id: ${band.id }');

               //TODO: Apagar
            },
            background: Container(
              padding: const EdgeInsets.only(left:8.0),
              color: Colors.red, 
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon( Icons.delete, color: Colors.white )
              )
            ),
            child: ListTile(
            leading: CircleAvatar(
            child: Text( band.name.substring(0,2)), 
            backgroundColor: Colors.blue[100],
            ),
            title: Text(band.name), 
            trailing: Text('${ band.votes }', style: TextStyle( fontSize: 20 ) ),
            onTap: (){
              print(band.name);
            }
          ),
    );
  }


  addNewBand(){

    final textController = TextEditingController();

    if(Platform.isAndroid){
       return  showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text('New band name'),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                child: Text('Add'), 
                elevation: 5,
                textColor: Colors.blue,
                onPressed: () => addBandToList(textController.text)
              )
            ],
          );
        }
     );
    }
    
   
    showCupertinoDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
           title: Text('New band name'), 
           content: CupertinoTextField(
             controller: textController,
           ),
           actions: [
             CupertinoDialogAction(
               isDefaultAction: true,
               child: Text('Add'), 
               onPressed: () => addBandToList( textController.text),
             ), 
              CupertinoDialogAction(
               isDestructiveAction: true,
               child: Text('Dismiss'), 
               onPressed: () => Navigator.pop(context),
             ),
           ],
        );
      }
    );

  }

  //Em Android e IOs
  void addBandToList( String name){

    if(name.length > 1){
      //Podemos add
      this.bands.add( Band(id:  DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }

    Navigator.pop(context);
  }


}