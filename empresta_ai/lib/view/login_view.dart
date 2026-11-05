import 'package:empresta_ai/controllers/itens_controller.dart';
import 'package:empresta_ai/controllers/sessao_controlle.dart';
import 'package:empresta_ai/theme/tema.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.sessao, required this.itens});

  final SessaoController sessao;
  final ItensController itens;


  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _apartamento = TextEditingController();
  final _senha = TextEditingController();
  bool _senhaEscondida = true;

  void _entrar(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Login efetuado com sucesso"))
      );
  }

  @override
  void dispose() {
    _senha.dispose();
    _apartamento.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;
    final textos = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(child: Center(
        //Evita que o teclado cubra os campos
        child: SingleChildScrollView(
          padding: EdgeInsets.all(TemaemprestaAi.espacoG),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.volunteer_activism, size: 72, color: cores.primary),
                SizedBox(height: TemaemprestaAi.espacoM),
                Text("Empresta Aí", 
                  textAlign: TextAlign.center,
                  style: textos.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: cores.primary
                  ),
                ),
                SizedBox(height: TemaemprestaAi.espacoP),
                Text("Peça empresatado aos seus vizinhos de condominio",
                  textAlign: TextAlign.center,
                  style: textos.bodyLarge,
                ),
                SizedBox(height: TemaemprestaAi.espacoG),
      
                TextFormField(
                  controller: _apartamento,
                  textCapitalization: TextCapitalization.characters,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Bloco e apartamento",
                    hintText: "Ex.: A-302",
                    prefixIcon: Icon(Icons.apartment)
                  ),
                  validator: widget.sessao.validarApartamento,
                ),
                SizedBox(height: TemaemprestaAi.espacoM),
      
                TextFormField(
                  controller: _senha,
                  obscureText: _senhaEscondida,
                  textCapitalization: TextCapitalization.characters,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    hintText: "Ex.: 1234",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      tooltip: "tooltip",
                      onPressed: (){
                        setState(() {
                          _senhaEscondida = !_senhaEscondida;
                        });
                      },
                      icon: Icon(_senhaEscondida ? Icons.visibility : Icons.visibility_off),
                    )
                  ),
                  validator: widget.sessao.validarSenha,
                ),
                SizedBox(height: TemaemprestaAi.espacoG,),
                FilledButton(
                  onPressed: _entrar, 
                  child: Text("Entrar"))
              ],
            )),
        ),
      )),
    );
  }

}