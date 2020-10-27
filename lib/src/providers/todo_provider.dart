import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:practicing_strapi/src/models/todo_model.dart';

class TodoProvider {

  String url = 'https://penasco-guide-tourist.herokuapp.com/';

  Future<List<Todo>> getData( String category ) async {

    final resp = await http.get( url + category.toLowerCase() );
    final data = json.decode(resp.body);

    final todos = new Todos.fromJsonList(data);
    return todos.items;

  }


  Future<List<Todo>> getByName( String category, String parameter ) async {

    final resp = await http.get( url + category.toLowerCase() + '?name_contains=' + parameter );
    final data = json.decode( resp.body );

    final catcheds = Todos.fromJsonList(data);
    return catcheds.items;

  }



}

 final todoProvider = new TodoProvider();