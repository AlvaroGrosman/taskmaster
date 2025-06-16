import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/sidebar_widget.dart';
import '../routes.dart';

class ModoFocoScreen extends StatelessWidget {
  const ModoFocoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SidebarWidget(currentRoute: Routes.modoFoco),
          Expanded(
            child: Container(
              color: const Color(0xFF161616),
              child: Stack(
                children: [
                  Positioned(
                    top: 24,
                    right: 36,
                    child: Icon(
                      Icons.wb_sunny_outlined,
                      color: Colors.white.withOpacity(0.8),
                      size: 28,
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "25:00",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 72,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.45),
                            borderRadius: BorderRadius.circular(36),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.lightBlueAccent, width: 2),
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(6),
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.lightBlueAccent,
                                  size: 32,
                                ),
                              ),
                              const SizedBox(width: 36),
                              Icon(
                                Icons.timer_outlined,
                                color: Colors.white.withOpacity(0.9),
                                size: 32,
                              ),
                              const SizedBox(width: 36),
                              Icon(
                                Icons.volume_off_rounded,
                                color: Colors.white.withOpacity(0.9),
                                size: 32,
                              ),
                            ],
                          ),
                        )
                      ],
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