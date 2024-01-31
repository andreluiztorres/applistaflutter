import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:applista/service/firestore_service.dart';
import 'package:applista/model/tarefas.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Inicialize o Firebase antes de executar os testes
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  group('FirestoreService', () {
    test('getTarefas', () async {
      final firestoreService = FirestoreService();
      final tarefas = await firestoreService.getTarefas();
      expect(tarefas, isA<List<Tarefa>>());
    });
  });
}
