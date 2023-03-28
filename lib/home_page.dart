import 'package:flutter/material.dart';
import 'package:rest_api_ex2/base_client.dart';
import 'package:rest_api_ex2/post.dart';

import 'app_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const FlutterLogo(size: 72),
              AppButton(
                operation: 'GET',
                operationColor: Colors.lightGreen,
                description: 'Fetch users',
                onPressed: () async {
                  var response = await BaseClient().get('/posts').catchError((e){});
                  if(response == null) {
                    return;
                  }

                  var posts = postFromJson(response);
                  debugPrint(posts.length.toString());
                  debugPrint('successful');

                },
              ),
              AppButton(
                operation: 'POST',
                operationColor: Colors.lightBlue,
                description: 'Add user',
                onPressed: () async {
                  var userPost =  Post(
                      title: 'Lokesh n y',
                     );
                  var response = await BaseClient().post('/posts/newPost', userPost ).catchError((e){});
                  if(response == null) {
                    return;
                  }
                  debugPrint('successful');

                },
              ),
              AppButton(
                operation: 'PUT',
                operationColor: Colors.orangeAccent,
                description: 'Edit user',
                onPressed: () async {
                  var id = 2;
                  var userPost =  Post(
                    title: 'new value is added',
                  );
                  var response = await BaseClient().put('/posts/$id', userPost ).catchError((e){});
                  if(response == null) {
                    return;
                  }
                  debugPrint('successful');
                },
              ),
              AppButton(
                operation: 'DEL',
                operationColor: Colors.red,
                description: 'Delete user',
                onPressed: ()  async {
                  var id = 2;
                  var userPost =  Post(
                    title: 'new value is added',
                  );
                  var response = await BaseClient().delet('/posts/$id', userPost ).catchError((e){});
                  if(response == null) {
                    return;
                  }
                  debugPrint('successful');

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}