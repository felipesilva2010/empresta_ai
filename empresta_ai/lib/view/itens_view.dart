

import 'package:empresta_ai/controllers/itens_controller.dart';
import 'package:flutter/material.dart';

class ItensView extends StatelessWidget {
  const ItensView({super.key, required this.controller});

  final ItensController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller, 
      builder: (context, _) {}
      
      );
  }
}