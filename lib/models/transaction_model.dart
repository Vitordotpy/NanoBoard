import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionModel {
  late final String id;
  late final String description;
  late final double value;
  late final DateTime dateTime;

  TransactionModel({
    required this.id,
    required this.description,
    required this.value,
    required this.dateTime,
  });

  setId(id) => this.id = id;
  setType(description) => this.description = description;
  setValue(value) => this.value = value;
  setDateTime(dateTime) => this.dateTime = dateTime;

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
