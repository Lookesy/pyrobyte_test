import 'package:flutter/material.dart';

class VendingPage extends StatefulWidget{

  @override
  State<VendingPage> createState() => _VendingPage();
}

class _VendingPage extends State<VendingPage> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {
      });
    });
    controller.animateTo(0.8);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                Text('Торговые автоматы', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 10,),
            SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(1),
                        topRight: Radius.circular(1),
                        bottomLeft: Radius.circular(1),
                        bottomRight: Radius.circular(1)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: const [
                      TableRow(children: [
                        Text(''),
                        Align(child: Text('снековый', style: TextStyle(color: Colors.grey, fontSize: 13),), alignment: Alignment.centerRight,)
                      ]),
                      TableRow(children: [
                        Text('5443256', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
                        Text(''),
                      ]),
                      TableRow(children: [
                        Row(
                          children: [
                            Icon(Icons.clear, color: Colors.red, size: 25),
                            Text('Не работает', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),)
                          ],
                        ),
                        Text(''),
                      ]),
                      TableRow(children: [
                        Text('ТЦ Мега, Химки', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                        Text(''),
                      ]),
                      TableRow(children: [
                        Text(''),
                        Text(''),
                      ]),
                      TableRow(children: [
                        Text('Тип шины', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                        Align(child: Text('MDB', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),), alignment: Alignment.centerRight,)
                      ]),
                      TableRow(children: [
                        Text('Уровень сигнала', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                        Align(child: Text('Стабильный', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),), alignment: Alignment.centerRight,)
                      ]),
                      TableRow(children: [
                        Text('Идентификатор', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                        Align(child: Text('643643677874', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),), alignment: Alignment.centerRight,)
                      ]),
                      TableRow(children: [
                        Text('Модем', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                        Align(child: Text('23211522321', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),), alignment: Alignment.centerRight,)
                      ]),
                    ],
                  ),
                )
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 185,
                width: MediaQuery.of(context).size.width*0.9,
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.40,
                        child: Stack(
                          children: [
                            RotatedBox(
                              quarterTurns: -1,
                              child: LinearProgressIndicator(
                                value: controller.value,
                                minHeight: MediaQuery.of(context).size.width*0.40,
                                backgroundColor: Colors.cyanAccent.withOpacity(0.1),
                                color: Colors.cyan,
                              ),
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 200,
                                  padding: EdgeInsets.all(10),
                                  child: Text((controller.value*100).toInt().toString()+'%', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
                                )
                            ),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.35,
                                  padding: EdgeInsets.all(10),
                                  child: Text('Текущий уровень загрузки', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                                )
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.50,
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.45,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.cyan, width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: TextButton(
                                    onPressed: (){},
                                    child: Text('Загрузка', style: TextStyle(color: Colors.cyan, fontSize: 17),),
                                  ),
                                )
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.45,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.cyan, width: 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: TextButton(
                                    onPressed: (){},
                                    child: Text('Инвентаризация', style: TextStyle(color: Colors.cyan, fontSize: 17),),
                                  ),
                                )
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: 220,
              child: Column(
                children: [
                  Align(
                    child: Text('События', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(height: 20,),
                  Container(
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          border: Border(
                              left: BorderSide(
                                  color: Colors.redAccent,
                                  width: 2
                              )
                          )
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Text('12:00', style: TextStyle(color: Colors.cyan),),
                          SizedBox(width: 10,),
                          Text('Сейф переполнен', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
                        ],
                      )
                  ),
                  SizedBox(height: 10,),
                  Container(
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          border: Border(
                              left: BorderSide(
                                  color: Colors.redAccent,
                                  width: 2
                              )
                          )
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Text('11:20', style: TextStyle(color: Colors.cyan),),
                          SizedBox(width: 10,),
                          Text('Сломался купюроприёмник', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
                        ],
                      )
                  ),
                  SizedBox(height: 10,),
                  Container(
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          border: Border(
                              left: BorderSide(
                                  color: Colors.redAccent,
                                  width: 2
                              )
                          )
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Text('11:00', style: TextStyle(color: Colors.cyan),),
                          SizedBox(width: 10,),
                          Text('Закончилась наличка', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
                        ],
                      )
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: 35,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.cyan, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: TextButton(
                      onPressed: (){},
                      child: Text('Смотреть ещё', style: TextStyle(color: Colors.cyan),),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 30,
              width: MediaQuery.of(context).size.width*0.9,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Финансы', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
              ),
            ),
            SizedBox(height: 10,),
            Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: 70,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        padding: EdgeInsets.all(10),
                        width: 200,
                        child: Row(
                          children: [
                            Icon(Icons.money, color: Colors.cyan, size: 30,),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('5700 Р', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                SizedBox(height: 5,),
                                Text('Деньги в ТА', style: TextStyle(fontSize: 15),)
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 15,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        padding: EdgeInsets.all(10),
                        width: 200,
                        child: Row(
                          children: [
                            Icon(Icons.attach_money, color: Colors.cyan, size: 30,),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('727 Р', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontFamily: ''),),
                                SizedBox(height: 5,),
                                Text('Сдача', style: TextStyle(fontSize: 15),)
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 15,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        padding: EdgeInsets.all(10),
                        width: 200,
                        child: Row(
                          children: [
                            Icon(Icons.monetization_on, color: Colors.cyan, size: 30,),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('0 Р', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                SizedBox(height: 5,),
                                Text('Прибыль', style: TextStyle(fontSize: 15),)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
          ],
        ),
      )
    );
  }
}