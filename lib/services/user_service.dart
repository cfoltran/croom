import 'package:graphql_flutter/graphql_flutter.dart';

class UserService {
  UserService._privateConstructor();

  static final UserService _instance = UserService._privateConstructor();

  static UserService get i => _instance;

  final GraphQLClient _client = GraphQLClient(
    link: HttpLink('http://192.168.1.161:8000/graphql'),
    cache: GraphQLCache(),
  );

  Future<QueryResult> createUser({
    required String email,
    required String password,
    required String username,
    required int age,
  }) {
    return _client.mutate(
      MutationOptions(
        document: gql(r"""
          mutation signupUser($email: String!, $password: String!, $username: String!, $age: Int!) {
            signupUser(data: {
              email: $email,
              password: $password, 
              username: $username, 
              age: $age
            }) {
              id
              email
              username
              age
            }
          }
        """),
        variables: {
          'email': email,
          'password': password,
          'username': username,
          'age': age
        },
      ),
    );
  }
}
