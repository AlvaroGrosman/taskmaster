import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/sidebar_widget.dart';
import '../widgets/calendario_lateral_widget.dart';
import '../routes.dart';

class NotificacoesScreen extends StatelessWidget {
  const NotificacoesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notificacoes = [
      {
        "titulo": "Reunião com o Time de Analistas está chegando!",
        "tempo": "Em 3 horas",
        "prioridade": "maxima"
      },
      {
        "titulo": "Reunião com o Time de Analistas está chegando!",
        "tempo": "Em 6 horas",
        "prioridade": "maxima"
      },
      {
        "titulo": "Reunião com os Supervisores está chegando!",
        "tempo": "Em 1 dia",
        "prioridade": "baixa"
      },
      {
        "titulo": "Reunião com o Time de Analistas está chegando!",
        "tempo": "Em 1 dia",
        "prioridade": "maxima"
      },
      {
        "titulo": "Realizar os Testes de Qualidade do Software!",
        "tempo": "Em 18 dias",
        "prioridade": "media"
      },
    ];

    final eventos = [
      {
        "data": "Maio, 28",
        "hora": "10:30",
        "tipo": "Reunião",
        "descricao": "Time de Analistas",
      },
      {
        "data": "Maio, 29",
        "hora": "14:30",
        "tipo": "Reunião",
        "descricao": "Time de Supervisores",
      },
      {
        "data": "Junho, 10",
        "hora": "20:30",
        "tipo": "Apresentação",
        "descricao": "Projeto",
      },
      {
        "data": "Junho, 15",
        "hora": "16:00",
        "tipo": "Análise",
        "descricao": "Testes",
      },
      {
        "data": "Junho, 20",
        "hora": "10:00",
        "tipo": "Reunião",
        "descricao": "Stakeholders",
      },
      {
        "data": "Junho, 21",
        "hora": "19:30",
        "tipo": "A fazer",
        "descricao": "Supermercado",
      },
    ];

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SidebarWidget(currentRoute: Routes.notificacoes),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextField(
                      style: GoogleFonts.montserrat(fontSize: 16),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, size: 22),
                        hintText: "Busque por Tarefas...",
                        hintStyle: GoogleFonts.montserrat(fontSize: 16, color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        border: InputBorder.none,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Notificações",
                    style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Text(
                        "Nível de Prioridade",
                        style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      const SizedBox(width: 30),
                      _PrioridadeLegenda(
                        cor: Colors.redAccent,
                        texto: "Máxima",
                      ),
                      const SizedBox(width: 18),
                      _PrioridadeLegenda(
                        cor: Colors.yellow,
                        texto: "Média",
                      ),
                      const SizedBox(width: 18),
                      _PrioridadeLegenda(
                        cor: Colors.lightBlue,
                        texto: "Baixa",
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Expanded(
                    child: ListView.builder(
                      itemCount: notificacoes.length,
                      itemBuilder: (context, i) {
                        final n = notificacoes[i];
                        Color corBg;
                        Color corTexto = Colors.black;
                        switch (n["prioridade"]) {
                          case "maxima":
                            corBg = Colors.redAccent.shade100;
                            break;
                          case "media":
                            corBg = Colors.yellow.shade200;
                            break;
                          case "baixa":
                          default:
                            corBg = Colors.lightBlue.shade200;
                            break;
                        }
                        return Container(
                          margin: const EdgeInsets.only(bottom: 14),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: corBg,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.notifications_active_outlined,
                                  size: 28, color: corTexto),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      n["titulo"]!,
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: corTexto,
                                      ),
                                    ),
                                    Text(
                                      n["tempo"]!,
                                      style: GoogleFonts.montserrat(
                                        color: corTexto.withOpacity(0.7),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          CalendarioLateralWidget(eventos: eventos),
        ],
      ),
    );
  }
}

class _PrioridadeLegenda extends StatelessWidget {
  final Color cor;
  final String texto;
  const _PrioridadeLegenda({required this.cor, required this.texto});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: cor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          texto,
          style: GoogleFonts.montserrat(fontSize: 15),
        ),
      ],
    );
  }
}