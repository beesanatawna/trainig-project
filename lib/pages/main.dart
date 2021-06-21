import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/pages/homepage.dart';

import 'data.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class Services {
  int id;
  String name;
  String desc;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  Services(
      {required this.id,
      required this.name,
      required this.desc,
      required this.image,
      required this.createdAt,
      required this.updatedAt});
  static final columns = [
    'id',
    'name',
    'desc',
    'image',
    'created-at',
    'updated-at'
  ];

  factory Services.fromJson(dynamic json) {
    return Services(
        id: json['id'] as int,
        name: json['name'] as String,
        desc: json['desc'] as String,
        image: json['image'] as String,
        createdAt: json['created-at'],
        updatedAt: json['updated-at']);
  }
  factory Services.fromMap(Map<String, dynamic> data) {
    return Services(
        id: data['id'],
        name: data['name'],
        desc: data['desc'],
        image: data['image'],
        createdAt: data['created-at'],
        updatedAt: data['updated-at']);
  }
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "desc": desc,
      "image": image,
      "created-at": createdAt,
      "updated-at": updatedAt
    };
  }
}

// ignore: camel_case_types
class fetchdata extends StatefulWidget {
  @override
  _fetchdataState createState() => _fetchdataState();
}

// ignore: camel_case_types
class _fetchdataState extends State<fetchdata> {
  void fetchServices() async {
    // List<MainServices> ser = [];
    try {
      print("try");
      final http.Response response = await http
          .get(Uri.parse('http://portal.hepco.ps:7654/api/dalel-services'));
      if (response.statusCode == 200) {
        print("responce");
        List<Services> services = parSer(response.body);
        mainServices = services;
        print("servises");
        print(services);
      } else {
        print("mememe");
        throw Exception('Failed to load');
      }
    } catch (e) {
      print("mememe2");
      throw Exception(e.toString());
    }
  }

  static List<Services> parSer(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Services>((json) => Services.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
