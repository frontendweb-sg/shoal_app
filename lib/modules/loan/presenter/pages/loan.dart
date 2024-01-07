import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const readRepositories = r"""
# Write your query or mutation here
# Write your query or mutation here
query countries
{
  countries
  {
    id
    name
    isoCode    
  }
    
}


""";

class LoanScreen extends StatelessWidget {
  const LoanScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Query(
            options: QueryOptions(
              document: gql(
                  readRepositories), // this is the query string you just created
              variables: const {
                'nRepositories': 50,
              },
              pollInterval: const Duration(seconds: 10),
            ),
            builder: (QueryResult result,
                {VoidCallback? refetch, FetchMore? fetchMore}) {
              if (result.hasException) {
                return Text(result.exception.toString());
              }

              if (result.isLoading) {
                return const Text('Loading');
              }

              print(result?.data);
              List? repositories =
                  result.data?['viewer']?['repositories']?['nodes'];

              if (repositories == null) {
                return const Text('No repositories');
              }

              return ListView.builder(
                  itemCount: repositories.length,
                  itemBuilder: (context, index) {
                    final repository = repositories[index];

                    return Text(repository['name'] ?? '');
                  });
            }),
      ),
    );
  }
}
