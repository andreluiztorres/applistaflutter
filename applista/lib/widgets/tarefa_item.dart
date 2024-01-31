import 'package:flutter/material.dart';
import 'package:applista/model/tarefas.dart';

class TarefaItem extends StatelessWidget {
  final Tarefa tarefa;

  TarefaItem({required this.tarefa});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tarefa.descricao),
      subtitle: Text('Criado em: ${tarefa.dataCriacao}'),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          // Navegar para a tela de edição ao pressionar o botão de edição
          // Implemente isso conforme necessário
        },
      ),
      onLongPress: () {
        // Excluir a tarefa ao pressionar por um longo tempo
        // Implemente a exclusão usando seu bloc ou repositório aqui
      },
    );
  }
}
