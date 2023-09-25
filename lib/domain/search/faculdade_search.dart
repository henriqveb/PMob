class FaculdadeSearch {
  late int id;
  late String nome;
  late int numEstrelas;
  late String descricao;
  late String url;

  FaculdadeSearch(
      {required this.id, required this.nome, required this.numEstrelas, required this.descricao, required this.url});

  FaculdadeSearch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    numEstrelas = json['numEstrelas'];
    descricao = json['descricao'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['numEstrelas'] = this.numEstrelas;
    data['descricao'] = this.descricao;
    data['url'] = this.url;
    return data;
  }
}