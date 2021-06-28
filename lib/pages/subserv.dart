import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/Subservices.dart';
import 'package:http/http.dart' as http;
import 'data2.dart';

class Subserv extends StatefulWidget {
  final String servName;
  final int dalelServiceId;
  Subserv(this.servName, this.dalelServiceId);

  @override
  _SubservState createState() => _SubservState(servName, dalelServiceId);
}

class _SubservState extends State<Subserv> {
  String servName;
  int dalelServiceId;
  _SubservState(this.servName, this.dalelServiceId);

  void fetchSubServices() async {
    List<Subservices> subservices = [];
    http.Response response = await http.get(Uri.parse(
        'http://portal.hepco.ps:7654/api/dalel-service-cat?id=/$dalelServiceId'));

    if (response.statusCode == 200) {
      var jsonArray = jsonDecode(response.body) as List;

      for (int i = 0; i < jsonArray.length; i++) {
        Subservices s = Subservices.fromJson(jsonArray[i]);
        subservices.add(s);
        s.setServices(servName);
      }
      subServices = subservices;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSubServices();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: subServices.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              height: 80,
                              width: 450,
                              child: Card(
                                color: Colors.blue[200],
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 2,
                                      color: Colors.lightBlue.shade100),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: ListTile(
                                  leading: Text(
                                    subServices[index].desc,
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.start,
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(7, 5, 7, 5),
                                  title: Text(
                                    subServices[index].name,
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.start,
                                  ),
                                  // onTap: () {
                                  //   Navigator.push<void>(
                                  //     context,
                                  //     MaterialPageRoute<void>(
                                  //       builder: (BuildContext context) =>
                                  //           Subserv(),
                                  //     ),
                                  //   );
                                  //   setState(() {});
                                  // },
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
