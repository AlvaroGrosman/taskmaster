import 'package:flutter/material.dart';
import '../routes.dart';

class SidebarWidget extends StatelessWidget {
  final String currentRoute;
  const SidebarWidget({required this.currentRoute, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: const BoxDecoration(
        color: Color(0xFFF7F7F7),
        border: Border(
          right: BorderSide(color: Color(0xFFBDBDBD), width: 1),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          CircleAvatar(
            radius: 36,
            backgroundImage: AssetImage('lib/assets/images/avatar.png'),
          ),
          const SizedBox(height: 10),
          const Text(
            'Usuário',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Gerenciador de Tarefas',
            style: TextStyle(fontSize: 13, color: Colors.black54),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.settings, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                _SidebarMenuItem(
                  icon: Icons.home,
                  label: "Início",
                  selected: currentRoute == Routes.home,
                  onTap: () {
                    if(currentRoute != Routes.home) {
                      Navigator.pushReplacementNamed(context, Routes.home);
                    }
                  },
                ),
                _SidebarMenuItem(
                  icon: Icons.notifications_none,
                  label: "Notificações",
                  selected: currentRoute == Routes.notificacoes,
                  onTap: () {
                    if(currentRoute != Routes.notificacoes) {
                      Navigator.pushReplacementNamed(context, Routes.notificacoes);
                    }
                  },
                ),
                _SidebarMenuItem(
                  icon: Icons.check_circle,
                  label: "Tarefas",
                  selected: currentRoute == Routes.criarTarefa,
                  onTap: () {
                    if(currentRoute != Routes.criarTarefa) {
                      Navigator.pushReplacementNamed(context, Routes.criarTarefa);
                    }
                  },
                ),
                _SidebarMenuItem(
                  icon: Icons.calendar_today,
                  label: "Google Calendar",
                  selected: currentRoute == Routes.calendario,
                  onTap: () {
                    if(currentRoute != Routes.calendario) {
                      Navigator.pushReplacementNamed(context, Routes.calendario);
                    }
                  },
                ),
                _SidebarMenuItem(
                  icon: Icons.access_time,
                  label: "Foco Total",
                  selected: currentRoute == Routes.modoFoco,
                  onTap: () {
                    if(currentRoute != Routes.modoFoco) {
                      Navigator.pushReplacementNamed(context, Routes.modoFoco);
                    }
                  },
                ),
                const SizedBox(height: 24),
                _SidebarSubMenuItem(label: "Diretório"),
                _SidebarSubMenuItem(label: "Integração"),
                _SidebarSubMenuItem(label: "Desativação"),
                _SidebarSubMenuItem(label: "Folga"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarMenuItem extends StatelessWidget {
  final IconData? icon;
  final String? iconAsset;
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const _SidebarMenuItem({
    this.icon,
    this.iconAsset,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = selected ? Colors.black : Colors.black87;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: selected
          ? BoxDecoration(
              color: const Color(0xFFE5E5E5),
              borderRadius: BorderRadius.circular(8),
            )
          : null,
      child: ListTile(
        leading: icon != null
            ? Icon(icon, color: textColor)
            : (iconAsset != null
                ? Image.asset(iconAsset!, width: 24, height: 24)
                : null),
        title: Text(
          label,
          style: TextStyle(
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
            color: textColor,
          ),
        ),
        onTap: onTap,
        dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class _SidebarSubMenuItem extends StatelessWidget {
  final String label;
  const _SidebarSubMenuItem({required this.label});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.circle, size: 10, color: Color(0xFFBDBDBD)),
      title: Text(
        label,
        style: const TextStyle(fontSize: 14, color: Colors.black54),
      ),
      dense: true,
      visualDensity: VisualDensity.compact,
      onTap: () {},
    );
  }
}