import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqldemo/features/mainApp/data/repositories/grapghql_config.dart';
import 'package:graphqldemo/features/mainApp/presentation/pages/blog_page.dart';


///class my app
class MyApp extends StatelessWidget {
  ///default constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final HttpLink httpLink = HttpLink(
    //     'https://api-ap-south-1.hygraph.com/v2/clll61lfv0kgd01uiemf93bgu/master');
    // final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    //     GraphQLClient(link: httpLink, cache: GraphQLCache()));

    

    // final HttpLink httpLink = HttpLink('https://countries.trevorblades.com/');
    // final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    //     GraphQLClient(link: httpLink, cache: GraphQLCache()));
    // return GraphQLProvider(
    //   client: client,
    //   child: const HomePage(),

    
 final ValueNotifier<GraphQLClient> client = GrapghqlConfig.graphInit();
    return GraphQLProvider(
      client: client,
      child: BlogPage(),
    );
  }
}
