class Endpoint {
  static const String baseUrl = 'https://reqres.in/api';

  static String userEndpoint(int page, int perpage) =>
      '$baseUrl/users?page=$page&per_page=$perpage';
}
