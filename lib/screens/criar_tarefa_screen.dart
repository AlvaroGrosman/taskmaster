import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/sidebar_widget.dart';
import '../routes.dart';

class CriarTarefaScreen extends StatefulWidget {
  const CriarTarefaScreen({Key? key}) : super(key: key);

  @override
  State<CriarTarefaScreen> createState() => _CriarTarefaScreenState();
}

class _CriarTarefaScreenState extends State<CriarTarefaScreen> {
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _convidarController = TextEditingController();
  final _dataController = TextEditingController();

  String? _prioridade;
  bool _repetir = false;
  String? _repetirSelecionado;

  final List<String> prioridades = ['Baixa', 'Média', 'Alta'];
  final List<String> repeticoes = ['Diária', 'Semanal', 'Mensal'];

  @override
  void dispose() {
    _tituloController.dispose();
    _descricaoController.dispose();
    _convidarController.dispose();
    _dataController.dispose();
    super.dispose();
  }

  Future<void> _selecionarData(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('pt', 'BR'),
      builder: (context, child) {
        // Corrige problemas de tema em alguns casos
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue, // cor de destaque
              onPrimary: Colors.white, // texto destacado
              onSurface: Colors.black, // texto padrão
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // botão de texto
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        _dataController.text =
            "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SidebarWidget(currentRoute: Routes.criarTarefa),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Crie uma nova Tarefa",
                        style: GoogleFonts.montserrat(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    _InputLabel(label: "Título"),
                    TextField(
                      controller: _tituloController,
                      style: GoogleFonts.montserrat(),
                      decoration: InputDecoration(
                        hintText: "Digite aqui...",
                        hintStyle: GoogleFonts.montserrat(),
                        border: const UnderlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _InputLabel(label: "Descrição"),
                    TextField(
                      controller: _descricaoController,
                      style: GoogleFonts.montserrat(),
                      decoration: InputDecoration(
                        hintText: "Digite aqui...",
                        hintStyle: GoogleFonts.montserrat(),
                        border: const UnderlineInputBorder(),
                        isDense: true,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 24),
                    _InputLabel(label: "Convidar Contatos"),
                    TextField(
                      controller: _convidarController,
                      style: GoogleFonts.montserrat(),
                      decoration: InputDecoration(
                        hintText: "Digite o e-mail do contato (ex.: usuario@email.com)",
                        hintStyle: GoogleFonts.montserrat(),
                        border: const UnderlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _InputLabel(label: "Data"),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.black54, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selecionarData(context),
                            child: AbsorbPointer(
                              child: TextField(
                                controller: _dataController,
                                style: GoogleFonts.montserrat(),
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: "Digite aqui ou selecione a data (DD/MM/AAAA)",
                                  hintStyle: GoogleFonts.montserrat(),
                                  border: const UnderlineInputBorder(),
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _InputLabel(label: "Prioridade"),
                    DropdownButtonFormField<String>(
                      value: _prioridade,
                      hint: Text("Selecione", style: GoogleFonts.montserrat()),
                      isExpanded: true,
                      items: prioridades
                          .map((e) => DropdownMenuItem(value: e, child: Text(e, style: GoogleFonts.montserrat())))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _prioridade = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _InputLabel(label: "Repetir"),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Sim", style: GoogleFonts.montserrat()),
                        Switch(
                          value: _repetir,
                          onChanged: (val) {
                            setState(() {
                              _repetir = val;
                              if (!val) _repetirSelecionado = null;
                            });
                          },
                        ),
                        Text("Não", style: GoogleFonts.montserrat()),
                        const SizedBox(width: 16),
                        if (_repetir)
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _repetirSelecionado,
                              hint: Text("Selecione", style: GoogleFonts.montserrat()),
                              items: repeticoes
                                  .map((e) =>
                                      DropdownMenuItem(value: e, child: Text(e, style: GoogleFonts.montserrat())))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _repetirSelecionado = value;
                                });
                              },
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                isDense: true,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    Center(
                      child: SizedBox(
                        width: 300,
                        height: 44,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD6D6D6),
                            foregroundColor: Colors.black,
                            elevation: 0,
                            textStyle: GoogleFonts.montserrat(fontSize: 18),
                          ),
                          onPressed: () {
                            // Salvar tarefa
                          },
                          child: Text(
                            "Salvar Tarefa",
                            style: GoogleFonts.montserrat(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _InputLabel extends StatelessWidget {
  final String label;
  const _InputLabel({required this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        label,
        style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }
}