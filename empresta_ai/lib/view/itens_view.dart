import 'package:empresta_ai/theme/tema.dart';
import 'package:empresta_ai/widgets/item_card.dart';
import 'package:flutter/material.dart';

import '../controllers/itens_controller.dart';

/// Lista de itens disponíveis no condomínio, com busca (Aulas 9 e 11).
class ItensView extends StatelessWidget {
  const ItensView({super.key, required this.controller});

  final ItensController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final itens = controller.itens;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                TemaemprestaAi.espacoM,
                TemaemprestaAi.espacoM,
                TemaemprestaAi.espacoM,
                TemaemprestaAi.espacoP,
              ),
              child: Text(
                'O que você precisa hoje?',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TemaemprestaAi.espacoM,
              ),
              child: TextField(
                onChanged: controller.buscar,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  hintText: "Buscar furadeira, escada...",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: TemaemprestaAi.espacoP),
            Expanded(
              child: itens.isEmpty
                  ? const Center(
                      child: Text(
                        'Nenhum item encontrado. Tente outra palavra.',
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(TemaemprestaAi.espacoM),
                      itemCount: itens.length,
                      separatorBuilder: (_, indice) =>
                          const SizedBox(height: TemaemprestaAi.espacoP),
                      itemBuilder: (context, i) => ItemCard(
                        item: itens[i],
                        // Provisório: a tela de detalhe chega na issue #7.
                        aoTocar: () =>
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Detalhe de ${itens[i].nome}: issue #7',
                                ),
                              ),
                            ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
