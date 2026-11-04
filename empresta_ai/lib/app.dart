
import 'package:empresta_ai/theme/tema.dart';
import 'package:empresta_ai/view/login_view.dart';
import 'package:flutter/material.dart';

class EmpertaAiApp extends StatelessWidget{
  const EmpertaAiApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Empresta Ai",
      debugShowCheckedModeBanner: false,
      theme: TemaemprestaAi.claro(),
      darkTheme: TemaemprestaAi.escure(),
      home: LoginView()
        );;
  }
}

