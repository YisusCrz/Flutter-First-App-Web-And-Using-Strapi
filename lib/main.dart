import 'package:flutter/material.dart';

import 'package:practicing_strapi/src/pages/home_page.dart';
import 'package:practicing_strapi/src/pages/selected_category_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Penasco',
      initialRoute: '/',
      routes: {
        '/'        : (_) => HomePage(),
        'selected' : (_) => SelectedCategoryPage()
      },
    );
  }
}