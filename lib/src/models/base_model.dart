class Entity {
  final String id;
  DateTime? createdAt = DateTime.now();
  DateTime? updatedAt = DateTime.now();

  Entity({required this.id, this.createdAt, this.updatedAt});

  factory Entity.fromJSON(Map<String, dynamic> json) => Entity(
        id: json['id'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }

  @override
  String toString() {
    final map = toJSON();
    // adding the id
    map['id'] = id;

    return map.toString();
  }
}
