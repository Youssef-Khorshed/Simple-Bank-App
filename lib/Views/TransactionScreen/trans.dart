// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'package:bankapp/Views/UsersScreen/users.dart';
import 'package:bankapp/database/database.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../models/usermodel.dart';

class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pro = context.watch<MyDatabase>();
    // ignore: prefer_const_constructors
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Users()));
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  stretch: true,
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  expandedHeight: 250,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    stretchModes: [StretchMode.fadeTitle],
                    title: Text('Tranactions'),
                    background: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Image(
                        image: AssetImage('assets/chart.png'),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => item(index, pro),
                        childCount: pro.gettras.length))
              ],
            )
            // ignore: prefer_const_constructors
          ],
        ));
  }

  Widget item(index, MyDatabase pro) {
    User? t;
    pro
        .select_db_user_photo(pro.database, pro.gettras[index].recieverid!)
        .then((value) {
      value.forEach((element) {});
    });
    //  print(t);
    // print(t!.photo);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: Colors.amber,
            backgroundImage:
                NetworkImage('${pro.gettras[index].recieverphoto}')),
        title: Text('${pro.gettras[index].date}'),
        trailing: Text('\$ ${pro.gettras[index].money}'),
      ),
    );
  }
}
