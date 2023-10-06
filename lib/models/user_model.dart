// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:nano_board/models/transaction_model.dart';

class UserModel {
  final int id;
  final String name;
  final String lastName;
  final String email;
  final bool premium;
  final bool isActive;
  final String createdDate;
  final String updatedDate;

  UserModel(
      {required this.id,
      required this.name,
      required this.lastName,
      required this.email,
      required this.premium,
      required this.isActive,
      required this.createdDate,
      required this.updatedDate});

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, lastName: $lastName, email: $email, premium: $premium, isActive: $isActive, createdDate: $createdDate, updatedDate: $updatedDate)';
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      createdDate: map['createdDate'] as String,
      updatedDate: map['updatedDate'] as String,
      id: map['id'] as int,
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      premium: map['premium'] as bool,
      isActive: map['isActive'] as bool,
    );
  }
}
