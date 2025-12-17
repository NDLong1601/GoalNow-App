class User {
  final String name;
  final String email;
  final String password;
  final String? avatarUrl;

  const User({
    required this.name,
    required this.email,
    required this.password,
    this.avatarUrl,
  });

  User copyWith({
    String? name,
    String? email,
    String? password,
    String? avatarUrl,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
