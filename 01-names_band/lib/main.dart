import 'package:flutter/material.dart';


import 'package:names_band/src/pages/home.dart';
import 'package:provider/provider.dart';

import 'src/pages/status.dart';
import 'src/services/socket_services.dart';

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