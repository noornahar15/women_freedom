import 'package:flutter/material.dart';
import 'package:women_freedom/login_json.dart';
import 'package:http/http.dart' as http;
import 'login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
 class _MyAppState extends State<MyApp> {
   User user = User();
   bool isLoading = false;

   Future<bool> getUser() async {
     String serviceUrl = "https://reqres.in/api/users?page=2";
     var response = await http.get(Uri.parse(serviceUrl));
     setState(() {
       user = userFromJson(response.body.toString());
       isLoading = true;
     });
     return true;
   }
@override
void initState(){
     super.initState();
     isLoading = false;
     getUser();
}

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: "title",
       home: Scaffold(
         appBar: AppBar(title: const Text("Get data in API")),
         body:  LoginPage(
           user: user,
           loading: isLoading,
         ),
       ),
     );
   }
 }


