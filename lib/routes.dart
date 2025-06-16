import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/criar_tarefa_screen.dart';
// Os próximos imports podem ser descomentados quando os arquivos existirem:
import 'screens/modo_foco_screen.dart';
import 'screens/calendario_screen.dart';
import 'screens/notificacoes_screen.dart';

class Routes {
  static const String home = '/';
  static const String criarTarefa = '/criar-tarefa';
  static const String modoFoco = '/modo-foco';
  static const String calendario = '/calendario';
  static const String notificacoes = '/notificacoes';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case criarTarefa:
        return MaterialPageRoute(builder: (_) => const CriarTarefaScreen());
      case modoFoco:
        return MaterialPageRoute(builder: (_) => const ModoFocoScreen());
      case calendario:
        return MaterialPageRoute(builder: (_) => const CalendarioScreen());
      case notificacoes:
        return MaterialPageRoute(builder: (_) => const NotificacoesScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Tela não encontrada')),
          ),
        );
    }
  }
}