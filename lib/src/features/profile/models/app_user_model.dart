/// AppUser: to avoid conflict with User from Firebase
class AppUser {
  final String id;
  final String uid;
  final String firstName;
  final String lastName;
  final String name;
  final String email;
  final String username;
  final String avatar;
  final String phone;
  final bool darkMode;
  final bool hasAccessAdmin;
  final bool hasAccessUser;
  final bool rememberMe;

  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    this.firstName = '',
    this.lastName = '',
    this.avatar = '',
    this.darkMode = false,
    this.phone = '',
    this.username = '',
    // new
    this.hasAccessAdmin = false,
    this.hasAccessUser = false,
    this.rememberMe = false,
  }) : uid = id; // if you prefer uid

  factory AppUser.fromJSON(Map<String, dynamic> json) => AppUser(
        id: json['id'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        hasAccessAdmin: json['hasAccessAdmin'] ?? false,
        hasAccessUser: json['hasAccessUser'] ?? false,
        rememberMe: json['rememberMe'] ?? false,
        darkMode: json['darkMode'] ?? false,
        avatar: json['avatar'] as String,
      );

  factory AppUser.fromFirebase(Map<String, dynamic> json) => AppUser.empty();

  factory AppUser.empty() => const AppUser(
        id: '',
        name: '',
        email: '',
      );

  factory AppUser.mock() => const AppUser(
        id: 'id',
        name: 'Ahmed',
        email: 'ahmnouira@gmail.com',
        darkMode: true,
        rememberMe: true,
        hasAccessAdmin: true,
        hasAccessUser: true,
        avatar: '',
      );

  AppUser copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? phone,
    String? avatar,
    String? name,
    bool? hasAccessAdmin,
    bool? hasAccessUser,
    bool? darkMode,
  }) {
    return AppUser(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      hasAccessAdmin: hasAccessAdmin ?? this.hasAccessAdmin,
      hasAccessUser: hasAccessUser ?? this.hasAccessUser,
      darkMode: darkMode ?? this.darkMode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
      'phone': phone,
      'username': username,
      'hasAccessAdmin': hasAccessAdmin,
      'hasAccessUser': hasAccessUser,
      'rememberMe': rememberMe,
      'darkMode': darkMode,
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
