import 'package:flutter_template/src/models/base_model.dart';

class ItemModel extends Entity {
  final String name;

  ItemModel({required super.id, required this.name});

  factory ItemModel.fromJSON(Map<String, dynamic> json) => ItemModel(
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
