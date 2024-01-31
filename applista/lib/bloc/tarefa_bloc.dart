import 'dart:async';
import 'package:applista/model/tarefas.dart';
import 'package:applista/repository/tarefas_repository.dart';

class TarefasBloc {
  final _tarefasRepository = TarefasRepository();

  final _tarefasController = StreamController<List<Tarefa>>.broadcast();
  get tarefasStream => _tarefasController.stream;

  void getTarefas() async {
    List<Tarefa> tarefas = await _tarefasRepository.getTarefas();
    _tarefasController.add(tarefas);
  }

  void dispose() {
    _tarefasController.close();
  }
}

final tarefasBloc = TarefasBloc();
