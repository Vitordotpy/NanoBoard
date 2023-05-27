import 'dart:convert';
import 'package:get/get.dart';

import '../models/transaction_model.dart';

class UserDAO extends GetxController {
  static final UserDAO instance = Get.find();

  late final RxString name;
  late final RxString? password;
  late final RxString uid;
  late final RxString email;
  late RxList<TransactionModel> userFinances = <TransactionModel>[].obs;
  late RxDouble balance = 0.0.obs;
  late RxInt currency = 1
      .obs; // provisório, provalmente será uma variável global que será salva localmente para não ocupar espaço no database

  UserDAO({
    required this.name,
    required this.password,
    required this.uid,
    required this.email,
  });

  getCurrency() => currency.value;
  getName() => name.value;
  getUid() => uid.value;
  getEmail() => email.value;
  List<TransactionModel> getUserFinances() => userFinances;
  getBalance() => balance.value;
  getPassword() => password?.value;

  setPassword(password) => this.password?.value = password;
  setCurrency(currency) => this.currency.value = currency;
  setName(name) => this.name.value = name;
  setUid(uid) => this.uid.value = uid;
  setEmail(email) => this.email.value = email;
  setUserFinances(userFinances) => this.userFinances.add(userFinances);
  setBalance(balance) => this.balance.value += balance;

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

  factory UserDAO.fromMap(Map<String, dynamic> map) {
    return UserDAO(
      name: map['name'] as RxString,
      password: map['password'] != null ? map['password'] as RxString : null,
      uid: map['uid'] as RxString,
      email: map['email'] as RxString,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDAO.fromJson(String source) =>
      UserDAO.fromMap(json.decode(source) as Map<String, dynamic>);
}
