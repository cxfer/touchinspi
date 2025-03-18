class User {
  final String? id;
  final String name;
  final String email;
  final String occupation;
  final String bio;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.occupation,
    required this.bio,
  });

  //String? get id => id;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      occupation: json['occupation'] as String,
      bio: json['bio'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'occupation': occupation,
      'bio': bio,
    };
  }
}
