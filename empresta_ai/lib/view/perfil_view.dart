

import 'package:empresta_ai/controllers/sessao_controlle.dart';
import 'package:empresta_ai/theme/tema.dart';
import 'package:flutter/material.dart';

/// Dados do morador e meu secundário (ajuda, Regras).
class PerfilView extends StatelessWidget {
const PerfilView({super.key, required this.sessao});

  final SessaoController sessao;

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;
    final apartamento = sessao.apartamento ?? '-';
    return ListView(
      padding: const EdgeInsets.all(TemaemprestaAi.espacoM),
      children: [
        const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
        const SizedBox(height: TemaemprestaAi.espacoM),
        Text(
          'Apartamentto $apartamento',
          textAlign: TextAlign.center,
          style: textos.titleLarge,
        ),
        const SizedBox(height: TemaemprestaAi.espacoG),
        const ListTile(
          leading: Icon(Icons.description_outlined),
          title: Text('Regras de uso do condomínio'),
        ),
      ],
    );
  }
}

