import 'package:applista/model/tarefas.dart';
import 'package:applista/service/firestore_service.dart';

class TarefasRepository {
  final _firestoreService = FirestoreService();

  Future<List<Tarefa>> getTarefas() async {
    return await _firestoreService.getTarefas();
  }
}
