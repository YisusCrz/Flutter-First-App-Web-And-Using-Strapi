import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:practicing_strapi/src/models/restaurantes_model.dart';

class TodoProvider {

  String url = 'http://localhost:1337/';

  Future<List<Todo>> getData( String category ) async {

    final resp = await http.get( url + category.toLowerCase() );
    final data = json.decode(resp.body);

    final restaurants = new Todos.fromJsonList(data);
    return restaurants.items;

  }



}

 final todoProvider = new TodoProvider();