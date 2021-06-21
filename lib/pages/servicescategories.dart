import 'package:flutter/material.dart';
import 'package:myapp/pages/homepage.dart';
import 'package:myapp/pages/main.dart';
import 'package:myapp/pages/services.dart';

import 'data.dart';

class ServicesCategories extends StatefulWidget {
  const ServicesCategories({Key? key}) : super(key: key);

  @override
  _ServicesCategoriesState createState() => _ServicesCategoriesState();
}

class _ServicesCategoriesState extends State<ServicesCategories> {
  List<Services> servicesMenu = [];

  @override
  void initState() {
    super.initState();
    servicesMenu = mainServices;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(servicesMenu[1].name),
        ],
      ),
    );
  }
}
