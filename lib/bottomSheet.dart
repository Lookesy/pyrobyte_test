import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:flutter/services.dart';

class SingleChildScrollViewExample extends StatefulWidget {
  @override
  State<SingleChildScrollViewExample> createState() => _SingleChildScrollViewExample();
}

class _SingleChildScrollViewExample extends State<SingleChildScrollViewExample>{
  bool isVisibleSave = false;
  var saveTime = '0';
  double listSize = 0.29;


  @override
  Widget build(context){
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height*0.5,
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom
        ),
        child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                )
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Загрузка', textScaleFactor: 1.6, style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                        height: 35,
                        width: 35,
                        child: IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close))
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Visibility(
                  visible: isVisibleSave,
                  child: SizedBox(width: MediaQuery.of(context).size.width*0.8, height: MediaQuery.of(context).size.height*0.1,
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.cyan[50],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.check),
                            Text('Изменения от \n$saveTime\nприменены успешно', style: TextStyle(fontSize: 15))
                          ],
                        ),
                      )),
                ),
                const SizedBox(height: 10),
                SizedBox(
                    height: MediaQuery.of(context).size.height*listSize,
                    width: MediaQuery.of(context).size.width*0.9,
                    child: SingleChildScrollViewContent()
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.85,
                      height: MediaQuery.of(context).size.height*0.065,
                      child: TextButton(
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.cyan)),
                        child: Text('Сохранить', style: TextStyle(color: Colors.white,fontSize: 17)),
                        onPressed: (){

                          setState(() {
                            saveTime = Jiffy.now().yMMMMdjm;
                            listSize = 0.19;
                            isVisibleSave = true;
                          });

                          Future.delayed(const Duration(seconds: 10), (){
                            if (this.mounted){
                              setState(() {
                                isVisibleSave = false;
                                listSize = 0.29;
                              });
                            }
                          });

                        },
                      ),
                    )
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}

class SingleChildScrollViewContent extends StatefulWidget {
  @override
  State<SingleChildScrollViewContent> createState() => _SingleChildScrollViewContent();
}

const List<Widget> masterMode = <Widget>[
  Text('Используется', style: TextStyle(fontSize: 17),),
  Text('Не используется', style: TextStyle(fontSize: 17),),
];

List<int> price = [50, 100, 75, 200, 300, 5000];

class _SingleChildScrollViewContent extends State<SingleChildScrollViewContent>{
  final TextEditingController _textEditController = TextEditingController();
  bool checkedValue = false;

  final List<bool> _selectedMasterMode = <bool>[false, true];

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.cyan;
  }

  @override
  Widget build(context){
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Checkbox(
                    value: checkedValue,
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    onChanged: (newValue){
                      setState(() {
                        checkedValue = newValue!;
                      });
                    }
                ),
                SizedBox(width: 10,),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Включить звук', style: TextStyle(fontSize: 20),),
                )
              ],
            ),
            SizedBox(height: 10,),
            ToggleButtons(
              onPressed: (int index) {
                setState(() {
                  // The button that is tapped is set to true, and the others to false.
                  for (int i = 0; i < _selectedMasterMode.length; i++) {
                    _selectedMasterMode[i] = i == index;
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.cyan,
              selectedColor: Colors.white,
              fillColor: Colors.cyan,
              color: Colors.cyan,
              constraints: BoxConstraints.tightFor(width: MediaQuery.of(context).size.width*0.4, height: 50),
              isSelected: _selectedMasterMode,
              children: masterMode,
            ),
            SizedBox(height: 10,),
            Container(
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('#', style: TextStyle(color: Colors.black, fontSize: 17)),
                      SizedBox(width: 25,),
                      Text('Цена', style: TextStyle(color: Colors.black, fontSize: 17)),
                    ],
                  ),
                  Container(
                    key: ValueKey('priceList'),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(5),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: price.length,
                      itemBuilder: (BuildContext context, int index){
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(index.toString(), style: TextStyle(color: Colors.black, fontSize: 17),),
                            SizedBox(width: 25,),
                            Text(price[index].toString(), style: TextStyle(color: Colors.black, fontSize: 17),),
                            Spacer(),
                            IconButton(
                                onPressed: (){
                                  setState(() {
                                    price.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.close)
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                      width: 200,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.cyan, width: 2),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: TextButton(
                            onPressed: (){
                              showDialog(
                                  context: context,
                                  builder: (context){
                                    return Dialog(
                                      child: SizedBox(
                                        height: 150,
                                        width: 300,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 275,
                                              height: 50,
                                              child: TextField(
                                                controller: _textEditController,
                                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(50),
                                                  ),
                                                  hintText: 'Цена',
                                                ),
                                                onSubmitted: (text){
                                                  setState(() {
                                                    price.add(int.parse(text));
                                                    _textEditController.clear();
                                                  });
                                                },),
                                            ),
                                            const SizedBox(height: 25,),
                                            SizedBox(
                                                width: 200,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.cyan, width: 3),
                                                      borderRadius: BorderRadius.circular(50)
                                                  ),
                                                  child: TextButton(
                                                    onPressed: (){
                                                      if (_textEditController.text.isNotEmpty){
                                                        setState(() {
                                                          price.add(int.parse(_textEditController.text));
                                                          _textEditController.clear();
                                                        });
                                                      }
                                                    },
                                                    style: ButtonStyle(
                                                      backgroundColor: MaterialStateProperty.all(Colors.white),
                                                    ),
                                                    child: const Text('Добавить', style: TextStyle(color: Colors.black),),
                                                  ),
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                              );
                            },
                            child: Text('Добавить строку', style: TextStyle(color: Colors.black, fontSize: 17))
                        ),
                      )
                  )
                ],
              ),
            ),

          ]
      ),
    );
  }
}