import 'package:flutter/material.dart';

import 'package:practicing_strapi/src/models/restaurantes_model.dart';

import 'package:practicing_strapi/src/providers/todo_provider.dart';


class SelectedCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes'),
      ),
      body: _todosList()
   );
  }
}

Widget _todosList(){
  return FutureBuilder(
    future: todoProvider.getRestaurants(),
    builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
      if(!snapshot.hasData){
        return Container();
      } 
        return _list(snapshot, snapshot.data) ;
    },
  );
}

Widget _list( AsyncSnapshot<List> snapshot, List<Restaurante> restaurantes ){
  return ListView.builder(
    itemCount: snapshot.data.length,
    itemBuilder: ( BuildContext contextn, int index ){
      return ListTile(
        title: Text(restaurantes[index].name),
        subtitle: Text(restaurantes[index].description),
        leading: FadeInImage(
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('http://localhost:1337${restaurantes[index].images[0].url}'),
        )
      );
    },
  );
}