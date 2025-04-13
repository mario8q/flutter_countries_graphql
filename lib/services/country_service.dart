import 'package:graphql/client.dart';
import '../models/country_model.dart';

class CountryService {
  static const String _apiUrl = 'https://countries.trevorblades.com/';

  final GraphQLClient _client = GraphQLClient(
    link: HttpLink(_apiUrl),
    cache: GraphQLCache(),
  );

  Future<List<Country>> getCountriesStartingWithA() async {
    const String query = r'''
      query {
        countries {
          code
          name
          emoji
        }
      }
    ''';

    try {
      final QueryResult result = await _client.query(
        QueryOptions(document: gql(query)),
      );

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      final List<dynamic> countriesData = result.data?['countries'] ?? [];
      return countriesData
          .map((json) => Country.fromJson(json))
          .where((country) => country.name.startsWith('A'))
          .toList();
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }
}
