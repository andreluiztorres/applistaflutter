import 'package:flutter/material.dart';
import 'package:applista/model/tarefas.dart';

class TarefasList extends StatelessWidget {
  final List<Tarefa> tarefas;
  final Function(String) onDismissed;

  const TarefasList(
      {Key? key, required this.tarefas, required this.onDismissed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tarefas.length,
      itemBuilder: (context, index) {
        if (index.isOdd) {
          // Se o índice for ímpar, adiciona um Divider
          return const SizedBox(
              height: 1,
              child: Divider(
                color: Color.fromARGB(255, 255, 255, 255),
              ));
        }
        final tarefa = tarefas[index];

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 211, 226, 237),
                Colors.blue.shade200,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Dismissible(
            key: UniqueKey(),
            onDismissed: (_) => onDismissed(tarefa.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20.0),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              trailing: GestureDetector(
                onTap: () => () {},
                child: const Icon(
                  Icons.edit,
                  color: Colors.blue, // Cor do ícone de edição
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tarefa.descricao,
                    style: const TextStyle(
                      fontSize:
                          16.0, // Ajuste o tamanho da fonte conforme necessário
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    formatarData(tarefa.dataCriacao),
                    style: const TextStyle(
                      fontSize:
                          12.0, // Ajuste o tamanho da fonte conforme necessário
                      color: Colors.grey, // Cor menos marcante
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String formatarData(DateTime data) {
    // Aqui você pode formatar a data conforme necessário.
    // Neste exemplo, estou usando um formato simples 'dd/MM/yyyy'.
    return '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';
  }
}
