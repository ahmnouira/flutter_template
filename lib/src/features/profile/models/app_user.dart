/// AppUser: to avoid conflict with User from Firebase
class AppUser {
  final String id;
  final String firstName;
  final String lastName;
  final String name;
  final String email;
  final String site;
  final String herd;
  final String username;
  final String avatar;
  final String phone;
  final bool darkMode;
  final bool hasAccess;
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
    this.site = '',
    this.herd = '',
    this.hasAccess = false,
    this.rememberMe = false,
  });

  factory AppUser.fromJSON(Map<String, dynamic> json) => AppUser(
        id: json['id'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        hasAccess: json['hasAccess'],
        rememberMe: json['rememberMe'],
        darkMode: json['darkMode'] ?? false,
        avatar: json['avatar'] as String,
        site: json['site'] as String,
        herd: json['herd'] as String,
      );

  factory AppUser.empty() => const AppUser(
        id: '',
        name: '',
        email: '',
      );

  AppUser copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? phone,
    String? avatar,
    String? site,
    String? herd,
    String? name,
    bool? hasAccess,
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
      site: site ?? this.site,
      herd: herd ?? this.herd,
      hasAccess: hasAccess ?? this.hasAccess,
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
      'hasAccess': hasAccess,
      'rememberMe': rememberMe,
      'darkMode': darkMode,
      // new fields
      'site': site,
      'herd': herd,
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
