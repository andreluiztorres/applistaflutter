// ignore_for_file: use_build_context_synchronously

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: StreamBuilder<List<Tarefa>>(
        stream: tarefasBloc.tarefasStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final tarefas = snapshot.data!;
            return TarefasList(tarefas: tarefas);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          __showAdicionarTarefaBottomSheet(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  __showAdicionarTarefaBottomSheet(BuildContext context) {
    TextEditingController tituloController = TextEditingController();
    TextEditingController descricaoController = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
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
              const SizedBox(height: 10.0),
              TextField(
                controller: tituloController,
                decoration: const InputDecoration(labelText: 'Título'),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // Adicionar lógica para cadastrar a tarefa
                      String titulo = tituloController.text;
                      String descricao = descricaoController.text;

                      if (titulo.isNotEmpty && descricao.isNotEmpty) {
                        // Crie uma nova instância de Tarefa
                        String novaTarefaId = const Uuid().v4();
                        Tarefa novaTarefa = Tarefa(
                          id: novaTarefaId,
                          descricao: descricao,
                          dataCriacao: DateTime.now(),
                        );

                        // Adicione a nova tarefa ao Firestore
                        await FirestoreService().adicionarTarefa(novaTarefa);

                        // Fechar o popup
                        Navigator.pop(context);
                      } else {
                        // Tratar caso campos estejam vazios
                        log("Por favor, preencha todos os campos.");
                      }
                    },
                    child: const Text('Cadastrar'),
                  ),
                  const SizedBox(width: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Fechar o popup
                    },
                    child: const Text('Cancelar'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
