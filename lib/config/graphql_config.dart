import 'package:graphql/client.dart';

class GraphQLConfig {
  static HttpLink httpLink = HttpLink(
    'https://countries.trevorblades.com/',
  );

  static GraphQLClient clientToQuery() {
    return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
    );
  }
}
