import 'dart:convert';

import 'package:http/http.dart'as http;

class BaseClient{
  var client = http.Client();

  static const String baseUrl = 'https://jsonplaceholder.typicode.com';


 Future<dynamic> get(String api) async{
  var uri = Uri.parse(baseUrl + api);
 var response = await client.get(uri);

 if(response.statusCode == 200){
   return response.body;
 }
 else{

 }
 }
 Future<dynamic> post(String api , dynamic object) async{
   var uri = Uri.parse(baseUrl + api);
   var _payload = json.encode(object);
   var response = await client.post(uri,body: _payload);
   print('posted to json');

   if(response.statusCode == 201){
     return response.body;
   }
   else{

   }
 }
 Future<dynamic> put(String api, dynamic object) async{
   var uri = Uri.parse(baseUrl + api);
   var _payload = json.encode(object);
   var response = await client.put(uri,body: _payload);
   if(response.statusCode == 200){
     return response.body;
   }
   else{

   }
 }
 Future<dynamic> delet(String api,dynamic object) async{
   var uri = Uri.parse(baseUrl + api);
   var _payload = json.encode(object);
   var response = await client.delete(uri,body: _payload);
   if(response.statusCode == 200){
     return response.body;
   }
   else{

   }
 }
}