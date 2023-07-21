class User {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String username;
  final String avatar;
  final String phone;

  final bool dartMode;

  const User({
    required this.id,
    required this.email,
    this.avatar = '',
    this.username = '',
    this.firstName = '',
    this.lastName = '',
    this.phone = '',
    this.dartMode = false,
  });

  factory User.fromJSON(Map<String, dynamic> json) => User(
        id: json['id'].toString(),
        email: json['email'],
        firstName: json['first_name'] ?? '',
        lastName: json['last_name'] ?? '',
        username: json['username'] ?? '',
        avatar: json['avatar'] ?? '',
        phone: json['phone'] ?? '',
      );

  factory User.empty() => const User(
        id: '',
        email: '',
      );

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? phone,
    String? avatar,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'email': email,
      'phone': phone,
      'avatar': avatar,
    };
  }

  @override
  String toString() {
    final map = toMap();
    // adding the id
    map['id'] = id;

    return map.toString();
  }
}
