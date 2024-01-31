import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:applista/model/tarefas.dart';

class FirestoreService {
  final CollectionReference _tarefasCollection =
      FirebaseFirestore.instance.collection('tarefas');

  Future<List<Tarefa>> getTarefas() async {
    try {
      QuerySnapshot querySnapshot = await _tarefasCollection.get();
      return querySnapshot.docs
          .map((doc) => Tarefa.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      log("Erro ao obter tarefas: $e");
      return [];
    }
  }

  Future<void> adicionarTarefa(Tarefa tarefa) async {
    try {
      await _tarefasCollection.add({
        'id': tarefa.id,
        'descricao': tarefa.descricao,
        'dataCriacao': tarefa.dataCriacao,
      });
    } catch (e) {
      log("Erro ao adicionar tarefa: $e");
    }
  }

  Future<void> editarTarefa(Tarefa tarefa) async {
    try {
      await _tarefasCollection.doc(tarefa.id).update({
        'descricao': tarefa.descricao,
        'dataCriacao': tarefa.dataCriacao,
      });
    } catch (e) {
      log("Erro ao editar tarefa: $e");
    }
  }

  Future<void> excluirTarefa(String id) async {
    try {
      QuerySnapshot querySnapshot =
          await _tarefasCollection.where("id", isEqualTo: id).get();
      String idDoDocumentoParaExcluir = querySnapshot.docs.first.id;
      await _tarefasCollection
          .doc(idDoDocumentoParaExcluir)
          .delete()
          .then((value) {
        log("Tarefa $idDoDocumentoParaExcluir excluída com sucesso!");
      });
    } catch (e) {
      log("Erro ao excluir tarefa: $e");
    }
  }
}
