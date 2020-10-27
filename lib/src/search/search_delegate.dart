import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:practicing_strapi/src/models/todo_model.dart';

import 'package:practicing_strapi/src/providers/todo_provider.dart';


class Search extends SearchDelegate<Todo>{

  final String category;

  Search({
    @required this.category,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        Spin(
          duration: Duration( milliseconds: 500 ),
          infinite: false,
          child: MaterialButton(
            shape: CircleBorder(),
            onPressed: (){
              query = '';
            },
            child: Icon(Icons.clear),
          ),
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return Bounce(
        from: 10.0,
        duration: Duration( milliseconds: 500 ),
        infinite: false,
        child: MaterialButton(
          shape: CircleBorder(),
          onPressed: () => close( context, null ),
          child: FaIcon(FontAwesomeIcons.arrowLeft)
        ),
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      if( query != '' ){
        return FutureBuilder(
          future: todoProvider.getByName(category, query),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if( snapshot.hasData ){
              return _detected(snapshot.data);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      } else {
        return Container();
      }
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
      if( query != '' ){
        return FutureBuilder(
          future: todoProvider.getByName(category, query),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if( snapshot.hasData ){
              return _detected(snapshot.data);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      } else {
        return Container();
      }

  }

  Widget _detected( List<Todo> data ){
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (_ , i){
        return Container(
          margin: EdgeInsets.all(5),
          child: ListTile(
            title: Text(data[i].name),
            leading: FadeInImage(
              width: 50,
              height: 50,
              fit: BoxFit.fill,
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage('${data[i].images[0].url}'),
            ),
          ),
        );
      },
    );
  }

}