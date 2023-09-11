import 'package:flutter/widgets.dart';

import '../../../../../themes/colors.dart';

class PlantInfoProcessing extends StatefulWidget {
  const PlantInfoProcessing({Key? key}) : super(key: key);

  @override
  State<PlantInfoProcessing> createState() => _PlantInfoProcessingState();
}

class _PlantInfoProcessingState extends State<PlantInfoProcessing> {
  @override
  Widget build(BuildContext context) {

    final screenheight = MediaQuery.of(context).size.height;
    final height_figma = 926;
    final screenwidth = MediaQuery.of(context).size.width;
    final width_figma = 428;

    return Container(
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
                "lib/features/client/Home/presentation/images/gol_squre.png"),
          ),
          SizedBox(
            height: screenheight / height_figma * 8,
          ),
          Center(
            child: Text(
              "کاشت مو",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700, color: fontcolor),
            ),
          )
        ],
      ),
    );
  }
}
