import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:qic/core/constants/app_constants.dart';
import 'package:qic/data/models/data_model.dart';

class DataRepo {
  Future<List<DataModel>> fetchData() async {
    const endpoint = "/posts";
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        log(response.body);
        log(response.statusCode.toString());
        List result = jsonDecode(response.body);
        return result.map((i) => DataModel.fromJson(i)).toList();
      } else {
        throw Exception("error on fetching data ❌");
      }
    } catch (e) {
      log("error : $e");
      throw Exception("error on fetching data ❌");
    }
  }
}
