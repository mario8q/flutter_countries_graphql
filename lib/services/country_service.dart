import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/country_model.dart';

class CountryService {
  static const String _apiUrl = 'https://countries.trevorblades.com/';
  static const Duration _timeout = Duration(seconds: 10);

  late final GraphQLClient _client;

  CountryService() {
    final HttpLink httpLink = HttpLink(_apiUrl);

    _client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }

  Future<List<Country>> getCountriesStartingWithA() async {
    const String query = r'''
      query {
        countries(filter: { name: { regex: "^A" } }) {
          code
          name
          emoji
        }
      }
    ''';

    try {
      final QueryResult result = await _client.query(
        QueryOptions(
          document: gql(query),
          fetchPolicy: FetchPolicy.cacheAndNetwork,
        ),
      );

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      final List<dynamic> countriesData = result.data?['countries'] ?? [];
      return countriesData.map((json) => Country.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }
}
