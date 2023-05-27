// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:nano_board/models/transaction_model.dart';

class UserModel {
  late final String name;
  late final String? password;
  late final String uid;
  late final String email;
  late List<TransactionModel> userFinances = [];
  late double balance = 0.0;
  late int currency = 1;

  UserModel({
    required this.name,
    this.password,
    required this.uid,
    required this.email,
  });

  getCurrency() => currency;
  getName() => name;
  getUid() => uid;
  getEmail() => email;
  List<TransactionModel> getUserFinances() => userFinances;
  getBalance() => balance;
  getPassword() => password;

  setPassword(password) => this.password = password;
  setCurrency(currency) => this.currency = currency;
  setName(name) => this.name = name;
  setUid(uid) => this.uid = uid;
  setEmail(email) => this.email = email;
  setUserFinances(userFinances) => this.userFinances.add(userFinances);
  setBalance(balance) => this.balance += balance;

  //testando transaction*
  addTransaction(TransactionModel transaction) {
    userFinances.add(transaction);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'password': password,
      'uid': uid,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      password: map['password'] != null ? map['password'] as String : null,
      uid: map['uid'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
