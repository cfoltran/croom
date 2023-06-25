import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_room/app.dart';

late Box<Map<dynamic, dynamic>?>? box;

Future<void> main() async {
  await Hive.initFlutter();
  box = await Hive.openBox('box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(
      'https://localhost:3000/',
    );

    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(store: HiveStore(box)),
      ),
    );

    return GraphQLProvider(
      client: client,
      child: const App(),
    );

    // return const App();
  }
}
