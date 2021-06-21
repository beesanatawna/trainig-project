import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/homepage.dart';

class Guidance extends StatefulWidget {
  const Guidance({Key? key}) : super(key: key);

  @override
  _GuidanceState createState() => _GuidanceState();
}

class _GuidanceState extends State<Guidance> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            child: Text("NAVIGATE")));
  }
}
