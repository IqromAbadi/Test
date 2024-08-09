class User {
  final String id;
  final String name;
  final String job;
  final String created;

  User({
    required this.id,
    required this.name,
    required this.job,
    required this.created,
  });

  factory User.fromJson(Map<String, dynamic> object) {
    return User(
      id: object['id'],
      name: object['name'],
      job: object['job'],
      created: object['createdAt'],
    );
  }
}
