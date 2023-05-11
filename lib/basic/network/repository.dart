import 'package:dio/dio.dart';

class MovieService {
  final Dio _dio = Dio();

  Future<List<String>> fetchMovieNames() async {
    try {
      Response response = await _dio.get('https://someapi.url');

      return (response.data) as List<String>;
    } catch (error, stacktrace) {
      // ignore: avoid_print
      print("Exception occured: $error stackTrace: $stacktrace");

      // add your error handling
      rethrow;
    }
  }

  // remove movie
  Future<void> removeMovie(String movieName) async {
    try {
      await _dio.delete('https://someapi.url/$movieName');
    } catch (error, stacktrace) {
      // ignore: avoid_print
      print("Exception occured: $error stackTrace: $stacktrace");

      // add your error handling
      rethrow;
    }
  }
}

class MovieRepository {
  final _provider = MovieService();

  Future<List<String>> fetchMovieNames() {
    return _provider.fetchMovieNames();
  }

  Future<void> removeMovie(String movieName) {
    return _provider.removeMovie(movieName);
  }
}
