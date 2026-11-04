import 'package:flutter/material.dart';

class SessaoControlle extends ChangeNotifier {
  static final _formatoAparetamento = RegExp(r'^[A-Za-z]-?\d{3}$');
  static final _formatoSenha = RegExp(r'^\d{4}');

  String? _apartamento = "";

  //#region Validação apartamento e senha

  String? validarApartamento(String apto) {
    if (apto == null || apto.trim().isEmpty) {
      return "Informe o bloco e apartamento";
    }

    //verificar se o que foi digitado esta no formato regex configurado
    if (!_formatoAparetamento.hasMatch(apto)) {
      return "Use o formato bloco-número, como A-301 ou B-101";
    }
    return null;
  }

  String? validarSenha(String senha) {
    if (senha == null || !_formatoSenha.hasMatch(senha)) {
      return "A senha deve esta no padrão de 4 caracteres";
    }
    return null;
  }

  //endregion
  bool entra(String apartamento, String senha) {
    if (validarApartamento(apartamento) != null) return false;
    if (validarSenha(senha) != null) return false;

    _apartamento = apartamento.trim().toUpperCase();
    notifyListeners();
    return true;
  }
  void sair(){
    _apartamento = null;
    notifyListeners();
  }
}
