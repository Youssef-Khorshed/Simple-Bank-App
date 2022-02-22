import 'dart:core';

class Trans {
  String? senderid, recieverid, money, recievername, recieverphoto, date;
  Trans.fromjson(Map element) {
    senderid = element['senderid'];
    recieverid = element['recieverid'];
    money = element['money'];
    recievername = element['recievername'];
    recieverphoto = element['recieverphoto'];
    date = element['date'];
  }
}

class User {
  String? name, account, email, photo;
  int? id;
  User.fromjson(Map element) {
    id = element['id'];
    photo = element['photo'];
    name = element['name'];
    email = element['email'];
    account = element['account'];
  }
}
