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

class AuthPayload {
  final Map<String, dynamic> AuthParameters;
  final String AuthFlow;
  final String ClientId;

  const AuthPayload({
    required this.AuthParameters,
    required this.AuthFlow,
    required this.ClientId,
  });
}
