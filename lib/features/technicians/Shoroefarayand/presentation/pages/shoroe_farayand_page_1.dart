import 'package:flutter/material.dart';

import '../../../../../themes/colors.dart';

class ShoroyeFarayandPage1 extends StatefulWidget {
  const ShoroyeFarayandPage1({Key? key}) : super(key: key);

  @override
  State<ShoroyeFarayandPage1> createState() => _ShoroyeFarayandPage1State();
}

class _ShoroyeFarayandPage1State extends State<ShoroyeFarayandPage1> {
  @override
  Widget build(BuildContext context) {

    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    return Scaffold(
      backgroundColor: backgroundHome,
      appBar: AppBar(
        backgroundColor: backgroundHome,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "زیباجویان من",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: fontcolor,
          ),
        ),
      ),
    );
  }
}
