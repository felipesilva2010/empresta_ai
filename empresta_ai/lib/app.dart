
import 'package:empresta_ai/controllers/itens_controller.dart';
import 'package:empresta_ai/controllers/sessao_controlle.dart';
import 'package:empresta_ai/theme/tema.dart';
import 'package:empresta_ai/view/login_view.dart';
import 'package:flutter/material.dart';

class EmpertaAiApp extends StatefulWidget{
  const EmpertaAiApp({super.key});

  @override
  State<EmpertaAiApp> createState() => _EmpertaAiAppState();
}

class _EmpertaAiAppState extends State<EmpertaAiApp> {

  final _sessaoController = SessaoController();
  final _itensController = ItensController();

  @override
  void dispose(){
    _sessaoController.dispose();
    _itensController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Empresta Ai",
      debugShowCheckedModeBanner: false,
      theme: TemaemprestaAi.claro(),
      darkTheme: TemaemprestaAi.escure(),
      home: LoginView(sessao: _sessaoController, itens: ItensController(),)
        );
  }
}

