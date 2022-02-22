// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../models/usermodel.dart';

class MyDatabase extends ChangeNotifier {
  List<User> getdata = [];
  List<Trans> gettras = [];
  List<String> recievername = [];
  List<String> recieverphoto = [];
  late Database database;

  create_db() async {
    database = await openDatabase('Bank.db', version: 1,
        onCreate: (database, version) {
      //user table
      // id int key
      // name string
      // email string
      // account money string
      // photo string
      //trnas table
      // id int key
      // sender id string
      // reciever id string
      // money string
      // date string

      print('database created');

      database
          .execute(
              'CREATE TABLE users (id INTEGER PRIMARY KEY,name Text,email Text,account Text,photo Text)')
          .then((value) => print('table1 created'));

      database
          .execute(
              'CREATE TABLE trans (id INTEGER PRIMARY KEY,senderid Text,recieverid Text,money Text,recievername Text,recieverphoto Text,date Text  )')
          .then((value) => print('table1 created'));
    }, onOpen: (database) async {
      final value = await select_db_users(database);
      getdata.clear();
      value.forEach((element) {
        getdata.add(User.fromjson(element));
      });
      final value2 = await select_db_trans(database);
      gettras.clear();
      value2.forEach((element) {
        gettras.add(Trans.fromjson(element));
      });
      print(getdata.length);
      print(gettras.length);

      // print(gettras[0].recieverid);
      // print(gettras[0].senderid);
      // print(gettras[0].money);
    });
    notifyListeners();
    //  emit(Bank_CreatrDatabase_state());
  }

  Future<int> insert_db(

      //user table
      // id int key
      // name string
      // email string
      // account money string
      // photo string
      {required String name,
      required String email,
      required String account,
      required String photo}) async {
    int? value;
    await database.transaction((txn) async {
      value = await txn.rawInsert(
          'INSERT INTO users (name,email,account,photo) VALUES ("$name","$email","$account","$photo")');
    });
    return value ?? 0;
  }

  Future<int> insert_trans(
      // id int key
      // sender id string
      // reciever id string
      // money string
      // date string
      {
    required String senderid,
    required String recieverid,
    required String money,
    required String recievername,
    required String recieverphoto,
    required String date,
  }) async {
    int? val;
    await database.transaction((txn) async {
      val = await txn.rawInsert(
          'INSERT INTO trans (senderid,recieverid,money,recievername,recieverphoto,date)  VALUES ("$senderid","$recieverid","$money","$recievername","$recieverphoto","$date")');
    });
    notifyListeners();
    return val ?? 0;
  }

  Future<List<Map<String, Object?>>> select_db_trans(Database database) async {
    return await database.rawQuery('SELECT * FROM trans');
  }

  Future<List<Map<String, Object?>>> select_db_user_photo(
      Database database, String id) async {
    return await database.rawQuery('SELECT * FROM users where id = $id');
  }

  Future<List<Map<String, Object?>>> select_db_users(Database database) async {
    return await database.rawQuery('SELECT * FROM users');
  }

  Future update_account({required String money, required String id}) async {
    await database
        .rawUpdate('UPDATE users SET account = $money WHERE id = $id');
    final value = await select_db_users(database);
    getdata.clear();
    value.forEach((element) {
      getdata.add(User.fromjson(element));
    });
    notifyListeners();
  }

  Future<int> delete_users() async {
    return await database.rawUpdate('delete from trans');
  }

  void Get_recivernames({required String recieverid}) {
    for (int i = 0; i < getdata.length; i++) {
      if (recieverid == getdata[i].id.toString()) {
        recievername.add(getdata[i].name!);
        recieverphoto.add(getdata[i].photo!);
        break;
      }
    }
    ;
  }
}
