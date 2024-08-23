import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'inicio-screen.dart';

class LoginPage extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final user = await _authService.signInWithGoogle();

            if (user != null) {
              // Se a autenticação for bem-sucedida, redireciona para a página de início
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => InicioPage()),
              );
            } else {
              // Se a autenticação falhar, mostre uma mensagem de erro
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Erro ao fazer login.')),
              );
            }
          },
          child: Text('Login com Google'),
        ),
      ),
    );
  }
}
