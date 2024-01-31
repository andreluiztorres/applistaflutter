import 'package:flutter/material.dart';
import 'package:applista/model/tarefas.dart';
import 'package:applista/widgets/tarefa_item.dart';

class TarefasList extends StatelessWidget {
  final List<Tarefa> tarefas;

  TarefasList({required this.tarefas});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tarefas.length,
      itemBuilder: (context, index) {
        return TarefaItem(tarefa: tarefas[index]);
      },
    );
  }
}
