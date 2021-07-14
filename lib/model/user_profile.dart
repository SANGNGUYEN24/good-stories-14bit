class UserProfile {
  final String avatar;
  final String name;
  final String email;
  final String password;
  final String about;

  const UserProfile({
    required this.avatar,
    required this.name,
    required this.email,
    required this.password,
    required this.about,
  });

  UserProfile copy({
    String? avatar,
    String? name,
    String? email,
    String? password,
    String? about,
  }) {
    return UserProfile(
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      about: about ?? this.about,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'avatar': avatar,
      'name': name,
      'email': email,
      'password': password,
      'about': about,
    };
  }

  static UserProfile fromJson(Map<String, dynamic> json) {
    return UserProfile(
      avatar: json['avatar'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      about: json['about'],
    );
  }
}
