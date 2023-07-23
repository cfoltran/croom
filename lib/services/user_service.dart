import 'package:graphql_flutter/graphql_flutter.dart';

class UserService {
  UserService._privateConstructor();

  static final UserService _instance = UserService._privateConstructor();

  static UserService get i => _instance;

  final GraphQLClient _client = GraphQLClient(
    link: HttpLink('http://localhost:8000/'),
    cache: GraphQLCache(),
  );

  Future<QueryResult> createUser({
    required String email,
    required String password,
    required String username,
    required String firstname,
    required String lastname,
    required String birthdate,
  }) {
    return _client.mutate(
      MutationOptions(
        document: gql('''
          mutation SignupUser(\$email: String!, \$password: String!, \$username: String!, \$firstname: String!, \$lastname: String!, \$birthdate: String!) {
            signupUser(data: {
              email: \$email,
              password: \$password, 
              username: \$username, 
              firstname: \$firstname, 
              lastname: \$lastname, 
              birthdate: \$birthdate
            }) {
              id
              email
              username
              firstname
              lastname
              birthdate
            }
          }
        '''),
        variables: {
          'email': email,
          'password': password,
          'username': username,
          'firstname': firstname,
          'lastname': lastname,
          'birthdate': birthdate,
        },
      ),
    );
  }
}
