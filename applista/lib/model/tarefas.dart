class Tarefa {
  final String id;
  final String descricao;
  final DateTime dataCriacao;

  Tarefa(
      {required this.id, required this.descricao, required this.dataCriacao});

  factory Tarefa.fromMap(Map<String, dynamic> data) {
    return Tarefa(
      id: data['id'],
      descricao: data['descricao'],
      dataCriacao: data['dataCriacao'].toDate(),
    );
  }
}
