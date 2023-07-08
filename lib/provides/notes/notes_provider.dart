import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:structured_todo/models/http/json_response.dart';
import 'package:structured_todo/models/todo_model/todo.dart';

import '../../services/api_services.dart';

class NotesProviser{

  static Future<List<ToDo>?> getAllNotes() async {
    List<ToDo> _notes = [];
    final response = await APIService.get(
        "/todo", authenticationRequired: true);
    print(response.code);
    print(response);
    print("1111111111111111111");
    print("================== ${response.data}");
    print(response.code);
    if (response != null) {
      if (response.code == 200) {

        for(Map<String,dynamic> index in response.data){
          _notes.add(ToDo.fromJson(index));
        }
        print("notsssssss");
        print(_notes);
        return _notes;
      }
    }
    return null;
  }

  static addNotes ({content = ""}) async {
        return await APIService.post(
        "/todo",
        {
        'content': content,
        'checked': 0,
        },
        authenticationRequired: true
        );
  }


  static deleteNotes({id}) async{
    return await APIService.delete(
        "/todo/$id",
        authenticationRequired: true
    );
  }

  static  updateNote({id,newcontent = ""})async {
    final body = {
      'content': newcontent,
      'checked': 0,
    };
    return await APIService.put(
      "/todo/$id",
      body,
      authenticationRequired: true,
    );
  }

}