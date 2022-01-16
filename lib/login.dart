import 'package:flutter/material.dart';
import 'login_json.dart';

class LoginPage extends StatelessWidget {
  final User user;
  final bool loading;

  const LoginPage({
    Key? key,
    required this.user,
    required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: loading == true ? user.data!.length:1 ,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  height: 180.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                       CircleAvatar(
                        backgroundImage: NetworkImage( loading  ? user.data![index].avatar!:"Url"),
                        radius: 40.0,
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Text(
                              loading ==true ? user.data![index].firstName! :"Name",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              loading ? user.data![index].email!:"Email",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
