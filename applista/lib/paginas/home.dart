// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, use_key_in_widget_constructors

import 'dart:developer';

import 'package:applista/model/tarefas.dart';
import 'package:applista/service/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:applista/bloc/tarefa_bloc.dart';
import 'package:applista/widgets/tarefas_list.dart';
import 'package:uuid/uuid.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    tarefasBloc.getTarefas();
  }

  Future<void> _cadastrarTarefa(String descricao) async {
    if (descricao.isNotEmpty) {
      String novaTarefaId = const Uuid().v4();
      log("Nova tarefa ID: $novaTarefaId");
      Tarefa novaTarefa = Tarefa(
        id: novaTarefaId,
        descricao: descricao,
        dataCriacao: DateTime.now(),
      );

      await FirestoreService().adicionarTarefa(novaTarefa);

      Navigator.pop(context);
    } else {
      log("Por favor, preencha todos os campos.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Tarefas',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: StreamBuilder<List<Tarefa>>(
        stream: tarefasBloc.tarefasStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final tarefas = snapshot.data!;
            return TarefasList(
              tarefas: tarefas,
              onDismissed: (String tarefaId) async {
                await FirestoreService().excluirTarefa(tarefaId);
                tarefasBloc.getTarefas();
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAdicionarTarefaBottomSheet(context);
        },
        elevation: 5.0,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAdicionarTarefaBottomSheet(BuildContext context) async {
    TextEditingController descricaoController = TextEditingController();

    double screenHeight = MediaQuery.of(context).size.height;

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            double bottomSheetHeight = screenHeight * 0.45;

            return Container(
              height: bottomSheetHeight,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Adicionar Tarefa',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: descricaoController,
                    decoration: const InputDecoration(labelText: 'Descrição'),
                    onSubmitted: (_) {
                      _cadastrarTarefa(descricaoController.text);
                    },
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            );
          },
        );
      },
    ).then((_) {
      tarefasBloc.getTarefas();
    });
  }
}
