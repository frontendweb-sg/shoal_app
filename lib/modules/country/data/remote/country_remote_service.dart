import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shoal_app/modules/country/data/models/country_model.dart';

abstract class ICountryRemoteService {}

class CountryRemoteService {
  final GraphQLClient _client;

  CountryRemoteService(this._client);
  Future<List<CountryModel>> getAllCountry(
      String document, Map<String, dynamic>? variables) async {
    try {
      final result = await _client.query(QueryOptions(
        document: gql(document),
        variables: variables!,
      ));

      if (result.data == null) {
        return [];
      }

      return result.data!["countries"]
          .map((e) => CountryModel.fromJson(e))
          .toList();
    } on Exception catch (exception) {
      print(exception);
      throw Exception(exception);
    }
  }
}
