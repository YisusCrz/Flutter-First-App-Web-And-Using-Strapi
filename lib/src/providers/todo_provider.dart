import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:practicing_strapi/src/models/restaurantes_model.dart';

class TodoProvider {

  String url = 'http://localhost:1337/restaurants';

  Future<List<Restaurante>> getRestaurants() async {

    final resp = await http.get(url);
    final data = json.decode(resp.body);

    final restaurants = new Restaurantes.fromJsonList(data);
    return restaurants.items;

  }

}

 final todoProvider = new TodoProvider();