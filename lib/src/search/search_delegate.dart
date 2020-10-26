import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Search extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        MaterialButton(
          shape: CircleBorder(),
          onPressed: (){
            query = '';
          },
          child: Icon(Icons.clear),
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return MaterialButton(
        shape: CircleBorder(),
        onPressed: () => close( context, '' ),
        child: FaIcon(FontAwesomeIcons.arrowLeft)
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      return Container();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
      return Container();
  }

}