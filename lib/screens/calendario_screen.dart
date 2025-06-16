import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/sidebar_widget.dart';
import '../routes.dart';

class CalendarioScreen extends StatelessWidget {
  const CalendarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SidebarWidget(currentRoute: Routes.calendario),
          Container(
            width: 340,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 32, color: Colors.black87),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        "Calendário",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ), // Reduzi o espaço para ajudar na responsividade
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 0,
                        ),
                        minimumSize: const Size(0, 32),
                        side: const BorderSide(color: Color(0xFFBDBDBD)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        textStyle: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      child: Text(
                        'Hoje',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_left),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Maio 2025",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add, color: Colors.black),
                      label: Text(
                        "Criar",
                        style: GoogleFonts.montserrat(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF7F7F7),
                        foregroundColor: Colors.black,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 6,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: GoogleFonts.montserrat(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18, bottom: 10),
                  child: _MiniCalendar(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reunião com...",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 7),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.grey,
                        ),
                        label: Text(
                          "Procure por pessoas",
                          style: GoogleFonts.montserrat(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFEDEDED),
                          minimumSize: const Size(double.infinity, 38),
                          alignment: Alignment.centerLeft,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    "Informações do tempo",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  initiallyExpanded: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "28 de Maio de 2025",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "0hr em Reunião",
                            style: GoogleFonts.montserrat(
                              color: Colors.black54,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 5),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(0, 28),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              side: const BorderSide(color: Color(0xFFBDBDBD)),
                              textStyle: GoogleFonts.montserrat(fontSize: 13),
                            ),
                            child: Text(
                              "Mais Informações",
                              style: GoogleFonts.montserrat(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Meus Calendários",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  initiallyExpanded: true,
                  children: [
                    CheckboxListTile(
                      value: true,
                      onChanged: (_) {},
                      title: Text(
                        "Tarefas",
                        style: GoogleFonts.montserrat(fontSize: 14),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                    ),
                    CheckboxListTile(
                      value: true,
                      onChanged: (_) {},
                      title: Text(
                        "Lembretes",
                        style: GoogleFonts.montserrat(fontSize: 14),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Outros",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  initiallyExpanded: true,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "AI LAB-CIS-6",
                          style: GoogleFonts.montserrat(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Finanças",
                          style: GoogleFonts.montserrat(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.add, size: 18, color: Colors.black45),
                        const SizedBox(width: 4),
                        Text(
                          "+",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade200,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.help_outline),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.settings_outlined),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 10),
                        DropdownButton<String>(
                          value: "Mês",
                          underline: const SizedBox(),
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                "Mês",
                                style: GoogleFonts.montserrat(),
                              ),
                              value: "Mês",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Semana",
                                style: GoogleFonts.montserrat(),
                              ),
                              value: "Semana",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "Dia",
                                style: GoogleFonts.montserrat(),
                              ),
                              value: "Dia",
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                        const SizedBox(width: 10),
                        Icon(Icons.apps, color: Colors.black54),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                      child: _CalendarGrid(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<List<int?>> weeks = [
      [null, null, null, 1, 2, 3, 4],
      [5, 6, 7, 8, 9, 10, 11],
      [12, 13, 14, 15, 16, 17, 18],
      [19, 20, 21, 22, 23, 24, 25],
      [26, 27, 28, 29, 30, 31, null],
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final d in ["S", "D", "T", "Q", "Q", "S", "S"])
              Text(
                d,
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
              ),
          ],
        ),
        const SizedBox(height: 6),
        ...weeks.map((week) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: week.map((day) {
                if (day == null) {
                  return const SizedBox(width: 24, height: 24);
                }
                bool isToday = day == 31;
                return Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: isToday
                      ? BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        )
                      : null,
                  child: Text(
                    day.toString(),
                    style: GoogleFonts.montserrat(
                      color: isToday ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        }).toList(),
      ],
    );
  }
}

class _CalendarGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> days = ['DOM', 'SEG', 'TER', 'QUA', 'QUI', 'SEX', 'SAB'];
    final List<List<int?>> grid = [
      [null, null, null, 1, 2, 3, 4],
      [5, 6, 7, 8, 9, 10, 11],
      [12, 13, 14, 15, 16, 17, 18],
      [19, 20, 21, 22, 23, 24, 25],
      [26, 27, 28, 29, 30, 31, null],
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: days
              .map(
                (d) => Expanded(
                  child: Center(
                    child: Text(
                      d,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 6),
        Expanded(
          child: Column(
            children: grid.map((week) {
              return Expanded(
                child: Row(
                  children: week.map((day) {
                    if (day == null) {
                      return Expanded(child: Container());
                    }
                    bool isToday = day == 31;
                    bool isHighlight = day == 28;
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: isHighlight
                              ? Colors.redAccent.withOpacity(0.18)
                              : Colors.transparent,
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 0.8,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: isToday
                              ? const BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                )
                              : null,
                          alignment: Alignment.center,
                          child: Text(
                            day.toString(),
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              color: isToday
                                  ? Colors.white
                                  : (isHighlight ? Colors.red : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
