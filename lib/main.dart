import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/home_screen.dart';
import 'screens/notificacoes_screen.dart';
import 'screens/criar_tarefa_screen.dart';
import 'screens/calendario_screen.dart';
import 'screens/modo_foco_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seu App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('en', ''),
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/notificacoes': (context) => const NotificacoesScreen(),
        '/criar-tarefa': (context) => const CriarTarefaScreen(),
        '/calendario': (context) => const CalendarioScreen(),
        '/modo-foco': (context) => const ModoFocoScreen(),
      },
    );
  }
}