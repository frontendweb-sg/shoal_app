import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shoal_app/modules/loan/presenter/providers/country.dart';

const readRepositories = r"""
# Write your query or mutation here
# Write your query or mutation here
query countries {
  countries
  {
    id
    name
    isoCode    
  }
    
}
""";

class LoanScreen extends ConsumerStatefulWidget {
  const LoanScreen({super.key});

  @override
  ConsumerState<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends ConsumerState<LoanScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ref.read(countryProvider.notifier).getAllCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Query(
          options: QueryOptions(document: gql(readRepositories), variables: {}),
          builder: (result, {fetchMore, refetch}) {
            return Text("hi");
          },
        ),
      ),
    );
  }
}
