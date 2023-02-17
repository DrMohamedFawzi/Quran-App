
 import 'package:dio/dio.dart';
class DataQuran {

 Future<Map<String,dynamic>> getData (int pageNumber) async{
   var response = await Dio().get('https://api.alquran.cloud/v1/page/$pageNumber/ar.asad');
   return response.data;
 }
 }


