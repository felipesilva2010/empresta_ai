import 'package:empresta_ai/theme/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as textAlign;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;
    final textos = Theme.of(context).textTheme;

    return SafeArea(
      child: Center(
        //Evitar que o teclado cubra os campos
        child: SingleChildScrollView(
          padding: EdgeInsets.all(TemaemprestaAi.espacoG),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.volunteer_activism, size: 72, color: cores.primary),
                SizedBox(height: TemaemprestaAi.espacoM),
                Text(
                  "Empresta Aí",
                  textAlign: textAlign.center,
                  style: textos.headlineLarge?.copyWith(
                    fontWeight: FontWeight.W600,
                    color: cores.primary,
                  ),
                ),
                SizedBox(height: TemaemprestaAi.espacoP),
                Text("Peça emprestado aos seus vizinhos de condominio",
                textAlign: TestAlign.Center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
