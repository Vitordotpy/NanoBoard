import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionModel {
  final String id;
  final String description;
  final double value;
  final DateTime dateTime;

  TransactionModel({
    required this.id,
    required this.description,
    required this.value,
    required this.dateTime,
  });

  getId() => id;
  getType() => description;
  getValue() => value;
  getDateTime() => dateTime;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'value': value,
      'dateTime': dateTime,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      description: map['description'],
      value: map['value'],
      dateTime: map['dateTime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
