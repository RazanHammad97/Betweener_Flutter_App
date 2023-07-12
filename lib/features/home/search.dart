import 'package:bootcamp_starter/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../core/util/api_base_helper.dart';
import '../../pref/shared_pref.dart';

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: search(name: query),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.done
              ? snapshot.data != null
                  ? ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(snapshot.data![index].name!),
                          onTap: () => Navigator.pushNamed(
                              context, '/profileView',
                              arguments: snapshot.data![index].id)),
                    )
                  : const Center(child: Text('No users found'))
              : const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

Future<List<User>> search({required String name}) async {
  var responseJson = await ApiBaseHelper().post('/search', {'name': name},
      {'Authorization': SharedPrefController().getValueFor('token')});
  var jsonUsersList = responseJson['user'] as List;
  List<User> usersList = [];
  for (var jsonUser in jsonUsersList) {
    usersList.add(User.fromJson(jsonUser));
  }
  return usersList;
}
