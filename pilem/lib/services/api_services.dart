import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String apiKey = 'e7ad2e4c85d42ea7c14a3fed7c18b62f';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Map<String, dynamic>>> getAllMovies() async {
    final response = await http.get(Uri.parse("$baseUrl/movie/now_playing?api_key=$apiKey"));
    final data= json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
  }

Future<List<Map<String, dynamic>>> getTrendingMovies() async {
  final response = await http.get(Uri.parse("$baseUrl/trending/movie/week?api_key=$apiKey"));
  final data= json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
}

Future<List<Map<String, dynamic>>> getPopularMovies() async {
  final response = await http.get(Uri.parse("$baseUrl/movie/popular?api_key=$apiKey"));
  final data= json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
}

Future<List<Map<String, dynamic>>> searchMovies(String query) async {
  final response = await http.get(Uri.parse("$baseUrl/search/movie?query=$query&api_key=$apiKey"));
  final data= json.decode(response.body);
    return List<Map<String, dynamic>>.from(data['results']);
}


}
