import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class CategoryCard extends StatelessWidget {

  final String title;
  final IconData icon;
  final Color backGroundColor1;
  final Color backGroundColor2;
  final Function onTap;

  const CategoryCard({
    @required this.title, 
    @required this.icon, 
    this.backGroundColor1 = Colors.orange, 
    this.backGroundColor2 = Colors.yellow, 
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: ElasticIn(
        child: Card(
          margin: EdgeInsets.all(10),
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.antiAlias,
          child: Stack(
                children: [
                  Container(
                    height: 170,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xfff6830f),
                      gradient: LinearGradient(
                        begin: Alignment(0, 0),
                        end: Alignment.topRight,
                        colors: <Color>[
                          this.backGroundColor1,
                          this.backGroundColor2
                        ]
                      )
                    ),
                    child: Center(
                      child: FaIcon(
                        this.icon, 
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                  ),

                  Positioned(
                    left: 0.0,
                    bottom: 0.0,
                    child: Container(
                      width: 150,
                      color: Colors.black.withOpacity(0.4),
                      child: Text(
                        this.title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
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