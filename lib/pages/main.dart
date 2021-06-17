import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'servicescategories.dart';
import 'guidance.dart';
import 'billingpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/configure_nonweb.dart'
    if (dart.library.html) 'configure_web.dart';

void main() {
  configureApp();
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/b': (BuildContext context) => ServicesCategories(),
        '/c': (BuildContext context) => Guidance(),
        '/d': (BuildContext context) => BillingPage(),
      },
      title: 'home page',
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
                      contentPadding: EdgeInsets.fromLTRB(7, 5, 7, 5),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue[100],
                        child: Image.asset(
                          "images/sponsorship.png",
                          color: Colors.black,
                          cacheWidth: 50,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      title: Text(
                        'الخدمات',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/b');
                      },
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(5, 5, 7, 5),
                  height: 80,
                  width: 450,
                  padding: EdgeInsets.all(3),
                  child: Container(
                    child: Card(
                      color: Colors.green[100],
                      shape: RoundedRectangleBorder(
                        side:
                            BorderSide(width: 2, color: Colors.green.shade100),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(7, 5, 7, 5),
                        leading: CircleAvatar(
                          backgroundColor: Colors.green[100],
                          child: Image.asset(
                            "images/guidance.png",
                            width: 50,
                            height: 50,
                            cacheWidth: 50,
                            color: Colors.black,
                          ),
                        ),
                        title: Text(
                          'الدليل',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/c');
                        },
                      ),
                    ),
                  )),
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
                    child: ListTile(
                      contentPadding: EdgeInsets.fromLTRB(7, 5, 7, 5),
                      leading: CircleAvatar(
                        backgroundColor: Colors.red[300],
                        child: Image.asset(
                          "images/bill.png",
                          width: 50,
                          height: 50,
                          cacheWidth: 50,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        'استعلامات الفواتير',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/d');
                      },
                    ),
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
