

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:structured_todo/models/todo_model/todo.dart';
import 'package:structured_todo/provides/notes/notes_provider.dart';

import '../../globals/loading.dart';
import '../../services/token_storage_services.dart';
import '../auth/auth_controller.dart';
import 'homepage_controller.dart';

class NotesController extends GetxController {
  final RxBool viewNoteFetching = false.obs;
  final notes = <ToDo>[].obs;
  final RxBool loading = false.obs;

  static NotesController get to => Get.find();
  load() async {
    Future.delayed(Duration(seconds: 2), () async {
      await LoadingPage();
      Get.offAllNamed('/home');
    });
  }
  final HomepageController homepageController = Get.put(HomepageController());
  AuthController authController = AuthController.to;
        Future<void> getdata() async{
          viewNoteFetching(true);
                try{
                  final response = await NotesProviser.getAllNotes();
                  print("===================___");
                  print(response);
                  print("getdata======");
                  if(response != null ) {
                    this.notes.assignAll(response);
                  }
                }catch(e){
                    print(e);
                }finally{
                  viewNoteFetching(false);
                }
      }
      Future<void> addData({name = " "}) async{
        viewNoteFetching(true);
        try{
          final response = await NotesProviser.addNotes(
            content: name,
          );
          if(response != null){
            if(response.code == 200){
              this.notes.clear();
              this.getdata();
            }
          }
        }catch(e){
          print(e);
        }finally{
          viewNoteFetching(false);
        }
      }
      Future<void> deleteData(id) async{
        try{
          final response = await NotesProviser.deleteNotes(
            id: id
          );
          if(response != null){
            if(response.code == 200){
              notes.remove(id);
              this.getdata();
            }
          }
        }catch(e){
          print(e);
        }
      }
      Future<void> updateData({id,name = "" }) async{
          try{
            final response = await NotesProviser.updateNote(
              newcontent: name,
              id: id
            );
            if(response != null){
              if(response.code == 200){
                   this.getdata();
              }
            }
            else{
              load();
            }
          }catch(e){
            print(e);
          }
      }

}

