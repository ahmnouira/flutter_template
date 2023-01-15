import 'package:flutter_template/src/data/models/base_model.dart';

class Item extends Entity {
  final String name;

  Item({required super.id, required this.name});

  factory Item.fromJSON(Map<String, dynamic> json) => Item(
        id: json['id'] as String,
        name: '',
      );

  @override
  Map<String, dynamic> toJSON() {
    return {...super.toJSON(), 'name': name};
  }

  @override
  String toString() {
    return toString().toString();
  }
}
