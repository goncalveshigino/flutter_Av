import 'package:band/pages/home.dart';
import 'package:band/pages/status.dart';
import 'package:band/services/socket_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

         ChangeNotifierProvider(create: (_) => SocketService(),)

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Nome de Bandas",
        initialRoute: 'status',
        routes: {
          'home': (_) => HomePage(), 
          'status': (_) => StatusPage()
        },
      ),
    );
  }
}