import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie_app/models/models.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{

  
  final String _apiKey = '03b81cf55660e44c8a19a04709819570';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Result> onDisplayMovies = [];
  
  MoviesProvider(){

    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async{
    var url = Uri.https(_baseUrl, '/3/movie/now_playing',{
      'api_key': _apiKey,
      'language': _language,
      'page': '1'
    });

    final response = await http.get(url);
    NowPlayingResponse nowPlayingResponse = NowPlayingResponse.fromJson(json.decode(response.body));
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

}