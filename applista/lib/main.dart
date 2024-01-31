import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:applista/bloc/tarefa_bloc.dart';
import 'package:applista/paginas/home.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseFirestore.instance.collection('tarefas').add({
  //   'id': '2',
  //   'descricao': 'Ir ao mercado',
  //   'dataCriacao': DateTime.now(),
  // });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TarefasBloc>(create: (_) => tarefasBloc),
      ],
      child: MaterialApp(
        title: 'Minha Lista de Tarefas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          // Adicione rotas para outras páginas conforme necessário
        },
      ),
    );
  }
}
