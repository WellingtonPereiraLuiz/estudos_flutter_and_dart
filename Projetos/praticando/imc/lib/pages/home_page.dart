// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:imc/models/imc_result.dart';
import 'package:imc/services/imc_history_service.dart';
import 'package:imc/services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  final ImcHistoryService _historyService = ImcHistoryService();
  final AuthService _authService = AuthService();

  String _resultadoIMC = "Informe seu peso e altura.";
  List<ImcResult> _history = [];
  String? _currentUserEmail;

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final email = await _authService.getCurrentUserEmail();
    if (email != null) {
      _currentUserEmail = email;
      await _loadHistory();
    }
  }

  Future<void> _loadHistory() async {
    if (_currentUserEmail == null) return;

    final history = await _historyService.getImcHistory(_currentUserEmail!);
    setState(() {
      _history = history;
    });
  }

  String _classifyImc(double imc) {
    if (imc < 18.5) return 'Abaixo do peso';
    if (imc < 24.9) return 'Peso normal';
    if (imc < 29.9) return 'Sobrepeso';
    if (imc < 34.9) return 'Obesidade Grau I';
    if (imc < 39.9) return 'Obesidade Grau II';
    return 'Obesidade Grau III (Mórbida)';
  }

  void _calcularImc() async {
    final double? peso = double.tryParse(
      _pesoController.text.replaceAll(',', '.'),
    );
    final double? altura = double.tryParse(
      _alturaController.text.replaceAll(',', '.'),
    );

    if (peso == null ||
        altura == null ||
        altura <= 0 ||
        _currentUserEmail == null) {
      setState(() {
        _resultadoIMC = "Erro: Valores inválidos.";
      });
      return;
    }

    final double imc = peso / (altura * altura);
    final String classification = _classifyImc(imc);

    final newResult = ImcResult(
      weight: peso,
      height: altura,
      imc: imc,
      classification: classification,
      date: DateTime.now(),
    );

    await _historyService.saveImcResult(newResult, _currentUserEmail!);

    setState(() {
      _resultadoIMC =
          "Seu IMC é: ${imc.toStringAsFixed(2)}\nClassificação: $classification";
    });

    _loadHistory(); // Atualiza a lista na tela
  }

  void _logout() async {
    await _authService.logout();
    if (mounted) {
      // CORREÇÃO DE NAVEGAÇÃO: Limpa a pilha e vai para a rota /login
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Calculadora de IMC"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
            tooltip: 'Sair',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Calcule o seu IMC",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
                hintText: 'Ex: 70.5',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Altura (m)',
                hintText: 'Ex: 1.75',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: _calcularImc,
              child: const Text(
                "Calcular e Salvar",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _resultadoIMC,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const Divider(height: 50, thickness: 1),

            const Text(
              "Histórico de Cálculos",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            _history.isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("Nenhum cálculo salvo ainda."),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _history.length,
                    itemBuilder: (context, index) {
                      final result = _history[index];
                      final formattedDate =
                          "${result.date.day.toString().padLeft(2, '0')}/${result.date.month.toString().padLeft(2, '0')} ${result.date.hour}:${result.date.minute.toString().padLeft(2, '0')}";

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(
                            'IMC: ${result.imc.toStringAsFixed(2)} - ${result.classification}',
                          ),
                          subtitle: Text(
                            'Peso: ${result.weight}kg | Altura: ${result.height}m',
                          ),
                          trailing: Text(formattedDate),
                        ),
                      );
                    },
                  ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
