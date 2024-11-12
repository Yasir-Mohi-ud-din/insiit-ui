import 'package:flutter/material.dart';
import './modularCard.dart';
class FoodOrderPage extends StatefulWidget {
  final String title;
  final bool back;
  final prefs;

  FoodOrderPage(
      {super.key,
        required this.title,
        required this.back,
        this.prefs = null,});
  @override
  State<FoodOrderPage> createState() => _FoodOrderPageState();
}

class _FoodOrderPageState extends State<FoodOrderPage> {
  String title = "";
  bool back = false;
  var prefs;
  @override
  void initState() {
    super.initState();

    back = widget.back;
    title = widget.title;
    prefs = widget.prefs;
  }
  @override
  Widget build(BuildContext context) {
    List<dynamic>details_list = [];
    details_list.add(["1","Tea Post"]);
    details_list.add(["2","Dawat"]);
    details_list.add(["3","canteen"]);
    Map<String, dynamic> details_map = {
      "items": details_list,
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 20,
        foregroundColor: Colors.black54,
        automaticallyImplyLeading: false,
        leading: (back == true)
            ? IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        )
            : null,
        centerTitle: true,
        title: Container(
          child: Text(
            '${title}',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ),
      ),
      body: ModularResultCard(params: details_map),
    );
  }
}
