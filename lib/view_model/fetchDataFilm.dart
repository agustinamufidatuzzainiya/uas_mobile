import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/film.dart';

Future<List<Film>> fetchFilmSedangTayang(http.Client client) async {
  String key =
      "98aac4111bd76c5afa141ef36cf5a5ce"; //sesuaikan dengan key anda sendiri
  final response = await client.get(
      Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=$key'));
  return compute(parseFilm, response.body);
}

List<Film> parseFilm(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['results'].cast<Map<String, dynamic>>();
  return parsed.map<Film>((json) => Film.fromJson(json)).toList();
}

Future<List<Film>> fetchFilmTopRated(http.Client client) async {
  String key =
      "98aac4111bd76c5afa141ef36cf5a5ce"; //sesuaikan dengan key anda sendiri
  final response = await client.get(
      Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=$key'));
  return compute(parseFilmTop, response.body);
}

List<Film> parseFilmTop(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['results'].cast<Map<String, dynamic>>();
  return parsed.map<Film>((json) => Film.fromJson(json)).toList();
}

Future<List<Film>> fetchFilmPopular(http.Client client) async {
  String key =
      "98aac4111bd76c5afa141ef36cf5a5ce"; //sesuaikan dengan key anda sendiri
  final response = await client.get(
      Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$key'));
  return compute(parseFilmPopular, response.body);
}

List<Film> parseFilmPopular(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['results'].cast<Map<String, dynamic>>();
  return parsed.map<Film>((json) => Film.fromJson(json)).toList();
}