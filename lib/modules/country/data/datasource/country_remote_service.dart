import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shoal_app/modules/country/data/models/country_model.dart';

abstract class ICountryRemoteService {}

class CountryRemoteService {
  final GraphQLClient _client;

  CountryRemoteService(this._client);
  Future<List<CountryModel>> getAllCountry(String document,
      [Map<String, dynamic>? variables = const {}]) async {
    try {
      final result = await _client.query(
        QueryOptions(
          document: gql(document),
          variables: variables!,
        ),
      );

      if (result.data == null) {
        return [];
      }

      List<dynamic> data = result.data!["countries"];
      return data.map((e) => CountryModel.fromJson(e)).toList();
    } on GraphQLError catch (exception) {
      print(exception.message);
      throw Exception();
    }
  }
}
