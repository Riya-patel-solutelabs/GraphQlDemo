import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

///grapghql config class
class GrapghqlConfig {
  // static String token = "your can get it from a secured storage";

  ///api url link
  static HttpLink httpLink = HttpLink(
      'https://api-ap-south-1.hygraph.com/v2/clll61lfv0kgd01uiemf93bgu/master');

  ///if you want to pass token
  static ValueNotifier<GraphQLClient> graphInit() {
    // final AuthLink authLink = AuthLink(
    //   getToken: () async => 'Bearer $token',
    // );

    //final Link link = authLink.concat(httpLink);

    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(),
      ),
    );

    return client;
  }

  ///method to convert client to query
  GraphQLClient clientToQuery() => GraphQLClient(
        cache: GraphQLCache(),
        link: httpLink,
      );

  // AuthLink authLink = AuthLink(
  //   getToken: () async => 'Bearer $token',
  // );

  // final Link link = authLink.concat(httpLink);
}
