import 'package:flutter/material.dart';
import 'package:myapp/secondpage.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(5)),
                  Image.asset(
                    "images/logo2.png",
                    width: 250,
                    height: 250,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                height: 80,
                width: 450,
                padding: EdgeInsets.all(3),
                child: Container(
                  child: Card(
                    color: Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 2, color: Colors.lightBlue.shade100),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue[100],
                        child: Image.asset(
                          "images/sponsorship.png",
                          width: 50,
                          height: 50,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        'الخدمات',
                        style: TextStyle(
                            fontStyle: FontStyle.normal, fontSize: 30),
                        textDirection: TextDirection.rtl,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondPage(),
                            ));
                      },
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 3, 7, 3),
                height: 80,
                width: 450,
                padding: EdgeInsets.all(3),
                child: Container(
                  child: Card(
                    color: Colors.green[100],
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Colors.green.shade100),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Text(''),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
                height: 80,
                width: 450,
                padding: EdgeInsets.all(3),
                child: Container(
                  child: Card(
                    color: Colors.red[300],
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2, color: Colors.red.shade50),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Text('hello'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
