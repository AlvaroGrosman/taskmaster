import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarioLateralWidget extends StatelessWidget {
  final List<Map<String, String>> eventos;
  const CalendarioLateralWidget({Key? key, required this.eventos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 32, right: 26, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Calendário",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(Icons.calendar_month),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.separated(
              itemCount: eventos.length,
              separatorBuilder: (_, __) => const Divider(height: 24, color: Colors.transparent),
              itemBuilder: (context, i) {
                final evento = eventos[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 66,
                        child: Text(
                          evento["data"] ?? "",
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        width: 54,
                        child: Text(
                          evento["hora"] ?? "",
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              evento["tipo"] ?? "",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              evento["descricao"] ?? "",
                              style: GoogleFonts.montserrat(fontSize: 14),
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
    );
  }
}