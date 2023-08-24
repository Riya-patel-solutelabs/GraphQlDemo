import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

///home page class 
class HomePage extends StatefulWidget {
  ///default constructor 
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String readRepository = ''' 
  query GetContinent(\$code : ID!) {
  continent(code: \$code) {
    name
    countries {
      name
    }
  }
}
''';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('GraphQl Demo'),
        ),
        body: Query<Object>(
            options: QueryOptions<Object>(
                document: gql(readRepository),
                variables: const <String, String>{'code': 'AS'}),
            builder: (QueryResult<Object> result,
                {FetchMore? fetchMore, VoidCallback? refetch}) {
              if (result.data == null) {
                return const Text('No data found');
              } else {
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) => ListTile(
                        title: Text(result.data!['continent']['countries']
                            [index]['name'])),
                  itemCount: result.data!['continent']['countries'].length,
                );
              }
            }),
      );
}
