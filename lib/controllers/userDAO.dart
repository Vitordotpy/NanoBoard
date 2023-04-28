import 'package:get/get.dart';

import '../models/transaction.dart';

class UserDAO extends GetxController {
  static final UserDAO instance = Get.find();
  late RxString _name;
  late RxString _uid;
  late RxString _email;
  late final RxList<Transaction> _userFinances = RxList<Transaction>.empty();
  late RxDouble _balance;
  late final RxInt _currency = 1.obs;

  getCurrency() => _currency.value;
  getName() => _name.value;
  getUid() => _uid.value;
  getEmail() => _email.value;
  RxList<Transaction> getUserFinances() => _userFinances;
  getBalance() => _balance.value;

  setCurrency(currency) => _currency.value = currency;
  setName(name) => _name.value = name;
  setUid(uid) => _uid.value = uid;
  setEmail(email) => _email.value = email;
  setUserFinances(userFinances) => _userFinances.value = userFinances;
  setBalance(balance) => _balance.value = balance;

  getUserData() {}

  addTransaction(Transaction transaction) {
    _userFinances.add(transaction);
  }
}
