import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shoal_app/core/params/params.dart';
import 'package:shoal_app/modules/country/data/models/country_model.dart';

class CountryRemoteService {
  final GraphQLClient _client;

  CountryRemoteService(this._client);

  ///
  /// Get countries
  ///
  Future<List<CountryModel>> getAllCountry(QueryParam queryParam) async {
    try {
      final result = await _client.query(
        QueryOptions(
          document: gql(queryParam.document),
          variables: queryParam.variables!,
        ),
      );

      if (result.data == null) {
        return [];
      }

      List<dynamic> data = result.data!["countries"];
      return data.map((e) => CountryModel.fromJson(e)).toList();
    } on GraphQLError catch (error) {
      throw Exception(error);
    }
  }

  ///
  /// Add country
  ///
  Future<QueryResult<Object?>> addCountry(MutationParam mutationParam) async {
    return await _client.mutate(
      MutationOptions(
        document: gql(mutationParam.document),
        variables: mutationParam.variables,
      ),
    );
  }
}
