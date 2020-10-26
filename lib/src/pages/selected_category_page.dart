import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:practicing_strapi/src/search/search_delegate.dart';
import 'package:practicing_strapi/src/models/restaurantes_model.dart';

import 'package:practicing_strapi/src/providers/todo_provider.dart';


class SelectedCategoryPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

  final category = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        actions: [
          MaterialButton(
            shape: CircleBorder(),
            onPressed: (){
              showSearch(
                context: context,
                delegate: Search( category: category )
              );
            },
            child: FaIcon(FontAwesomeIcons.search, color: Colors.white,),
          )
        ],
      ),
      body: _todosList( category )
   );
  }
}

Widget _todosList( String ctg ){
  return FutureBuilder(
    future: todoProvider.getData( ctg ),
    builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
      if(!snapshot.hasData){
        return Container();
      } 
        return _list(snapshot.data) ;
    },
  );
}

Widget _list( List<Todo> data ){
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: ( BuildContext contextn, int index ){
      return ListTile(
        title: Text(data[index].name),
        subtitle: Text(data[index].description),
        leading: FadeInImage(
          width: 60,
          height: 60,
          fit: BoxFit.fill,
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('http://localhost:1337${data[index].images[0].url}'),
        )
      );
    },
  );
}