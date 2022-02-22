// ignore_for_file: prefer_const_literals_to_create_immutables, duplicate_ignore, prefer_const_constructors

import 'dart:math';
import 'dart:ui';
import 'package:bankapp/database/database.dart';
import 'package:bankapp/shared/fakedata.dart';
import 'package:bankapp/shared/textform.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/usermodel.dart';
import '../TransactionScreen/trans.dart';

class Users extends StatefulWidget {
  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final scrollview = ScrollController();
  final name = TextEditingController();
  final money = TextEditingController();
  final key = GlobalKey<FormState>();
  String name_value = '';
  final scrollnotifier = ValueNotifier(0.0);
  double height = 300;
  double percent = 0;
  void _onlisten() {
    scrollnotifier.value = scrollview.offset;
  }

  @override
  void initState() {
    scrollview.addListener(_onlisten);
    super.initState();
  }

  @override
  void dispose() {
    scrollview.removeListener(_onlisten);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pro = context.watch<MyDatabase>();
    print(pro.getdata.length);
    // ignore: prefer_const_constructors
    return Form(
      key: key,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ValueListenableBuilder<double>(
                valueListenable: scrollnotifier,
                builder: (context, snapshot, _) {
                  percent =
                      lerpDouble(0.0, -3.0, (snapshot / height).clamp(0, 1))!;
                  // print(percent);
                  return Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      // ignore: prefer_const_constructors
                      CustomScrollView(
                        controller: scrollview,
                        slivers: [
                          SliverAppBar(
                            automaticallyImplyLeading: false,
                            centerTitle: false,
                            expandedHeight: height,
                            stretch: true,
                            flexibleSpace: FlexibleSpaceBar(
                                stretchModes: [StretchMode.blurBackground],
                                background: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20.0, top: 200),
                                  child: Transform(
                                    alignment: Alignment.bottomCenter,
                                    transform: Matrix4.identity()
                                      ..setEntry(3, 2, 0.001)
                                      ..rotateX(percent),
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            item(index, '7000'),
                                        separatorBuilder: (context, index) =>
                                            Container(
                                              width: 5,
                                            ),
                                        itemCount: items.length),
                                  ),
                                )),
                            leading: Icon(Icons.sort),
                            actions: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset('assets/p1.jpg')),
                            ],
                          ),
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  (context, index) => Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                            percent > -1
                                                                ? 'send money to'
                                                                : '',
                                                            style: TextStyle(
                                                              fontSize: 25,
                                                            )),
                                                        Spacer(),
                                                        TextButton(
                                                          onPressed: () async {
                                                            Navigator.of(
                                                                    context)
                                                                .pushReplacement(
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                Transactions()));

                                                            // pro.insert_db(
                                                            //     name: 'Youssef',
                                                            //     email:
                                                            //         'Youssef@gmail.com',
                                                            //     account:
                                                            //         '${Random().nextInt(10000)}',
                                                            //     photo:
                                                            //         'p1.jpg');
                                                            // for (int i = 1;
                                                            //     i <
                                                            //         Fake.images
                                                            //             .length;
                                                            //     i++) {
                                                            //   pro.insert_db(
                                                            //       name:
                                                            //           'user$i',
                                                            //       email:
                                                            //           'user$i@gmail.com',
                                                            //       account:
                                                            //           '${Random().nextInt(10000)}',
                                                            //       photo:
                                                            //           '${Fake.images[i]}');
                                                            // }
                                                            // pro.delete_users(
                                                            //     money: 'money',
                                                            //     id: 'id');
                                                          },
                                                          child: Text(
                                                            'All',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .amber),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Stack(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                        ),
                                                        Positioned(
                                                          child: ClipOval(
                                                              child:
                                                                  Image.network(
                                                            Fake.images[10],
                                                            height: 70,
                                                            width: 70,
                                                            fit: BoxFit.cover,
                                                          )),
                                                        ),
                                                        Positioned(
                                                          left: 30,
                                                          child: ClipOval(
                                                              child:
                                                                  Image.network(
                                                            Fake.images[5],
                                                            height: 70,
                                                            width: 70,
                                                            fit: BoxFit.cover,
                                                          )),
                                                        ),
                                                        Positioned(
                                                          left: 70,
                                                          child: ClipOval(
                                                              child:
                                                                  Image.network(
                                                            Fake.images[2],
                                                            height: 70,
                                                            width: 70,
                                                            fit: BoxFit.cover,
                                                          )),
                                                        ),
                                                        Positioned(
                                                            left: 135,
                                                            child: InkWell(
                                                                onTap: () {
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) =>
                                                                              AlertDialog(
                                                                                title: Text('Transaction'),
                                                                                content: Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    Text('please enter the amount of money'),
                                                                                    Container(
                                                                                        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
                                                                                        child: textformfield(
                                                                                            controller: name,
                                                                                            validator: (value) {
                                                                                              if (value!.isEmpty) {
                                                                                                return 'Please enter reciever';
                                                                                              }
                                                                                            },
                                                                                            hint: 'Reciever id',
                                                                                            prefix_icon: Icons.person,
                                                                                            keyboard_type: TextInputType.text)),
                                                                                  ],
                                                                                ),
                                                                                actions: [
                                                                                  TextButton(
                                                                                      onPressed: () async {
                                                                                        name_value = name.text.toString();
                                                                                        // print(name_value);
                                                                                        pro.Get_recivernames(recieverid: name_value);
                                                                                        //    print('names ${pro.recieverphoto.length}');
                                                                                        //   print('photos ${pro.recievername.length}');
                                                                                        // pro.recievername.clear();
                                                                                        // pro.recieverphoto.clear();
                                                                                        Navigator.of(context).pop();
                                                                                      },
                                                                                      child: Text(
                                                                                        'send',
                                                                                        style: TextStyle(color: Colors.amber),
                                                                                      )),
                                                                                  TextButton(
                                                                                      onPressed: () {
                                                                                        Navigator.of(context).pop();
                                                                                        pro.delete_users();
                                                                                      },
                                                                                      child: Text('No', style: TextStyle(color: Colors.amber)))
                                                                                ],
                                                                              ));
                                                                },
                                                                child: ClipOval(
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/plus2.jpg',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ))),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .grey
                                                                    .shade200,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                textformfield(
                                                                    validator:
                                                                        (value) {
                                                                      if (value!
                                                                          .isEmpty) {
                                                                        return 'please enter value of money';
                                                                      }
                                                                    },
                                                                    controller:
                                                                        money,
                                                                    hint:
                                                                        'Amount',
                                                                    prefix_icon:
                                                                        Icons
                                                                            .money,
                                                                    keyboard_type:
                                                                        TextInputType
                                                                            .number),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        TextButton(
                                                            onPressed:
                                                                () async {
                                                              if (key
                                                                  .currentState!
                                                                  .validate()) {
                                                                DateTime now =
                                                                    DateTime
                                                                        .now();
                                                                String
                                                                    formattedDate =
                                                                    DateFormat(
                                                                            'yyyy-MM-dd')
                                                                        .format(
                                                                            now);
                                                                print(pro
                                                                    .recievername
                                                                    .length);
                                                                print(pro
                                                                    .recieverphoto
                                                                    .length);
                                                                DateTime date =
                                                                    DateTime
                                                                        .now();
                                                                pro.insert_trans(
                                                                    recievername:
                                                                        '${pro.recievername.last}',
                                                                    recieverphoto:
                                                                        '${pro.recieverphoto.last}',
                                                                    senderid:
                                                                        '1',
                                                                    recieverid:
                                                                        name_value,
                                                                    money: money
                                                                        .text
                                                                        .toString(),
                                                                    date: DateFormat(
                                                                            'yyyy-MM-dd')
                                                                        .format(
                                                                            date));
                                                                String account =
                                                                    pro
                                                                        .getdata[
                                                                            0]
                                                                        .account!;
                                                                int value =
                                                                    int.parse(
                                                                        account);
                                                                int value2 = int
                                                                    .parse(money
                                                                        .text
                                                                        .toString());
                                                                value -= value2;
                                                                pro.update_account(
                                                                    money: value
                                                                        .toString(),
                                                                    id: '1');
                                                                final val = await pro
                                                                    .select_db_trans(
                                                                        pro.database);
                                                                pro.gettras
                                                                    .clear();
                                                                val.forEach(
                                                                    (element) {
                                                                  pro.gettras.add(
                                                                      Trans.fromjson(
                                                                          element));
                                                                });
                                                              }
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_forward_sharp,
                                                              color:
                                                                  Colors.black,
                                                            ))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                'Users',
                                                style: TextStyle(fontSize: 30),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                  childCount: 1)),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (context, index) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: ListTile(
                                        leading: ClipOval(
                                          child: index == 0
                                              ? Image.asset('assets/p1.jpg')
                                              : Image.network(
                                                  pro.getdata[index].photo!,
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                        title:
                                            Text('${pro.getdata[index].name!}'),
                                        trailing: Text(
                                            '\$ ${pro.getdata[index].account!}'),
                                      ),
                                    ),
                                childCount: pro.getdata.length),
                          )
                        ],
                      ),
                      Positioned(
                          top: 155,
                          child: Text(
                            percent > -1
                                ? 'My Credits'
                                : percent > -1.95
                                    ? 'send money to'
                                    : '',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )),
                    ],
                  );
                })),
      ),
    );
  }

  List<String> items = [
    'assets/visa1.png',
    'assets/visa2.jpg',
    'assets/visa3.jpg'
  ];

  Widget item(index, String db) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            items[index],
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
          child: Text(
            'Youssef  \$ ${db}',
            style: TextStyle(fontSize: 15, color: Colors.green),
          ),
        )
      ],
    );
  }
}
