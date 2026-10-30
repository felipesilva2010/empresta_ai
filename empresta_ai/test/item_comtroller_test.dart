import 'package:empresta_ai/controllers/itens_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("ItensController Testes", () {
    test("pedir marca o item como emprestado e não deixa pedir de novo", () {
      final itensController = ItensController();
      final escada = itensController.itens.firstWhere(
        (i) => i.nome.startsWith("Escada"),
      );

      expect(itensController.pediremprestado(escada), isTrue);
      expect(escada.disponivel, isFalse);
      expect(itensController.meusPedidos.contains(escada), isTrue);
      expect(itensController.meusPedidos, contains(escada));
      expect(itensController.pediremprestado(escada), isFalse);
    });

    expect("Não deixar pegar emprestado um item já emprstado", () {
      final itensController = ItensController();
      final furadeira = itensController.itens.firstWhere(
        (i) => i.nome.startsWith("Furadeira"),
      );
      expect(itensController.pediremprestado(furadeira), isFalse);
    });
  });
}
