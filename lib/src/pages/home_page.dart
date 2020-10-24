import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practicing_strapi/src/widgets/category_card_widget.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CategoryCard(
          icon: FontAwesomeIcons.hamburger,
          title: 'Restaurants',
          backGroundColor1: Color(0xfff08a5d),
          backGroundColor2: Color(0xffffefa0),
          onTap: (){
            Navigator.pushNamed(context, 'selected');
          },
        )
     ),
   );
  }
}
