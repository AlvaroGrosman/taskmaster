import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/sidebar_widget.dart';
import '../widgets/calendario_lateral_widget.dart';
import '../routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        children: [
          const SidebarWidget(currentRoute: Routes.home),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    style: GoogleFonts.montserrat(fontSize: 16),
                    decoration: InputDecoration(
                      hintText: "Busque por Tarefas...",
                      hintStyle: GoogleFonts.montserrat(fontSize: 16, color: Colors.grey),
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "28 de Maio de 2025",
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      Row(
                        children: [
                          _PriorityDot(color: Colors.red),
                          const SizedBox(width: 6),
                          Text("Máxima", style: GoogleFonts.montserrat(fontSize: 13)),
                        ],
                      ),
                      const SizedBox(width: 18),
                      Row(
                        children: [
                          _PriorityDot(color: Colors.yellow),
                          const SizedBox(width: 6),
                          Text("Média", style: GoogleFonts.montserrat(fontSize: 13)),
                        ],
                      ),
                      const SizedBox(width: 18),
                      Row(
                        children: [
                          _PriorityDot(color: Colors.lightBlue),
                          const SizedBox(width: 6),
                          Text("Baixa", style: GoogleFonts.montserrat(fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      _PriorityCard(
                        color: const Color(0xFFFF8181),
                        title: "Reunião com Time de Analistas",
                        subtitle: "Hoje - Em 3 horas",
                        status: "Feito",
                      ),
                      const SizedBox(width: 16),
                      _PriorityCard(
                        color: const Color(0xFF73C9FF),
                        title: "Reunião com Supervisores",
                        subtitle: "29 Mai - 14:30",
                        status: "Feito",
                      ),
                      const SizedBox(width: 16),
                      _PriorityCard(
                        color: const Color(0xFF73C9FF),
                        title: "Apresentação Projeto",
                        subtitle: "10 Jun - 20:30",
                        status: "Feito",
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Tarefas semanais",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  _WeeklyTaskItem(
                    icon: Icons.menu_book,
                    title: "Estudos Banco de Dados",
                    subtitle: "Aprendizagem - Concluído há 2 horas",
                  ),
                  _WeeklyTaskItem(
                    icon: Icons.restaurant,
                    title: "Preparar Refeições da Semana",
                    subtitle: "Saúde - Concluído há 2 dias",
                  ),
                  _WeeklyTaskItem(
                    icon: Icons.settings,
                    title: "Planejamento de Demandas",
                    subtitle: "Produção - Concluído há 2 horas",
                  ),
                  _WeeklyTaskItem(
                    icon: Icons.fitness_center,
                    title: "Academia",
                    subtitle: "Saúde - Concluído há 1 dia",
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

class _PriorityDot extends StatelessWidget {
  final Color color;
  const _PriorityDot({required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 14, height: 14,
      decoration: BoxDecoration(
        color: color, shape: BoxShape.circle,
      ),
    );
  }
}

class _PriorityCard extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String status;
  const _PriorityCard({required this.color, required this.title, required this.subtitle, required this.status});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                )),
            const Spacer(),
            Text(subtitle,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                )),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeeklyTaskItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _WeeklyTaskItem({required this.icon, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 32),
      title: Text(title, style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: GoogleFonts.montserrat(fontSize: 13)),
      contentPadding: const EdgeInsets.only(left: 0, right: 0),
      dense: true,
    );
  }
}