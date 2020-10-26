import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practicing_strapi/src/widgets/category_card_widget.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    _navigate( String category ) => Navigator.pushNamed(context, 'selected', arguments: category);

    final List<Widget> _widgets = [
      CategoryCard(title: 'Restaurants', icon: FontAwesomeIcons.hamburger, backGroundColor1: Color(0xfff08a5d), backGroundColor2: Color(0xffffefa0), onTap: () => _navigate('Restaurants')),
      CategoryCard(title: 'Hotels', icon: FontAwesomeIcons.hotel, backGroundColor1: Color(0xffaa4a30), backGroundColor2: Color(0xffedcfa9), onTap: () => _navigate('Hotels')),
      CategoryCard(title: 'Clubs', icon: FontAwesomeIcons.glassCheers, backGroundColor1: Color(0xff7579e7), backGroundColor2: Color(0xffa3d8f4), onTap: () => _navigate('Clubs')),
    ];

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _widgets,
        ),
      )
   );
  }
}




