class QueryParam {
  final String document;
  final Map<String, dynamic>? variables;
  QueryParam({
    required this.document,
    this.variables = const {},
  });
}

class MutationParam {
  final String document;
  final Map<String, dynamic> variables;
  MutationParam({
    required this.document,
    required this.variables,
  });
}
