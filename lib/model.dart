class Users {
  final String content;
  final String id;
  final String tittel;

  const Users({
    required this.content,
    required this.id,
    required this.tittel,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      content: json['content'],
      id: json['id'],
      tittel: json['tittel'],
    );
  }
}
