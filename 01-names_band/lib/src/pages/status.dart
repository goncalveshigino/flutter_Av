
import 'package:flutter/material.dart';
import 'package:names_band/src/services/socket_services.dart';
import 'package:provider/provider.dart'; 


class StatusPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


 final socketService = Provider.of<SocketService>(context);



    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ServerStatus: ${ socketService.serverStatus }')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.message),
        onPressed: (){
          
          socketService.socket.emit('emitiet-mensagem', {
            'nome': 'Flutter', 'mensagem': 'Hello desde flutter'
          });

        },
      ),
    );
  }
}