
class Post {
  Post({
    required this.userId,
    this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int? id;
  final String title;
  final String body;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
    userId: json["userid"],
    id: json["Id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toMap() => {
    "userid": userId,
    "Id": id,
    "title": title,
    "body": body,
  };
}
