import 'dart:ffi';

class Transaction {
  late String _id;
  late String _type;
  late double _value;
  late DateTime _dateTime;

  Transaction(String id, String type, double value, DateTime dateTime) {
    _id = id;
    _type = type;
    _value = value;
    _dateTime = dateTime;
  }

  setId(id) => _id = id;
  setType(type) => _type = type;
  setValue(value) => _value = value;
  setDateTime(dateTime) => _dateTime = dateTime;

  getId() => _id;
  getType() => _type;
  getValue() => _value;
  getDateTime() => _dateTime;
}
