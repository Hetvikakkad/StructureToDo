

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:structured_todo/controllers/home/homepage_controller.dart';
import 'package:structured_todo/controllers/home/notes_controller.dart';
import 'package:structured_todo/globals/buttons.dart';
import 'package:structured_todo/globals/drawer.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final globalKey = GlobalKey<ScaffoldState>();
  final HomepageController homepageController = Get.put(HomepageController());
  final NotesController authNotesController =  NotesController.to;
  bool isLoading = false;

  // final notes = <ToDo>[].obs;
  // final argument = Get.arguments;

 _triggerGetData(){
  try{
    var resp = authNotesController.getdata();
    return resp;
  }catch(e){

    print(e);
  }
}
 _triggerAddData(){
  try{
    var resp = authNotesController.addData(
     name: homepageController.notesController.text.toString(),
    );
    return resp;
  }catch(e){
    print(e);
  }
}
  void performTask() async {
    // Simulating an asynchronous task
    setState(() {
      isLoading = true; // Show the loader
    });

    await Future.delayed(Duration(seconds: 2));
    _triggerAddData();// Simulating a task delay

    setState(() {
      isLoading = false; // Hide the loader
    });
  }
  void deleteItem(String id){
    authNotesController.deleteData(id);
  }
  void updateitem(String id, String name){
    authNotesController.updateData(id: id,name: name);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _triggerGetData();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text("home page"),
      ),
      endDrawer: TodoDrawer(),
     body : Obx(
            () => authNotesController.notes.isEmpty
            ? Center(
            child: CircularProgressIndicator(),
        )
        : ListView.builder(
              itemCount: authNotesController.notes.length,
              itemBuilder: (context, index) {
                final data = authNotesController.notes[index];
                return ListTile(
                  title: Text('${data.content}'),
                  trailing: PopupMenuButton(
                    onSelected: (value){
                      if(value == "update"){
                        showDialog(context: context, barrierDismissible: false,
                            builder:(BuildContext context){
                              return AlertDialog(
                                title: Text("Edit data"),
                                //To show old content prefilx
                                semanticLabel: homepageController.notesController.text = data.content,
                                content: TextField(
                                  controller: homepageController.notesController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintText: "Enter new content",
                                    filled: true,
                                  ),
                                ),
                                actions: <Widget> [
                                  ElevatedButton(
                                      onPressed: () {
                                        if(homepageController.notesController.text.isEmpty){
                                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" ${jsonResponse["msg"]}")));
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("empty data not valid")));
                                          Navigator.pop(context);
                                        }
                                        else{
                                          // Navigator.pop(context);


                                         authNotesController.updateData(id: data.id,name: homepageController.notesController.text.toString());
                                          // _triggerGetData();

                                          homepageController.notesController.clear();

                                         Navigator.pop(context);
                                        }
                                      },
                                      child: Text("update")),
                                      ElevatedButton(onPressed: () {
                                        Navigator.pop(context);
                                      }, child: Text("cancel"))

                                    ],
                              );
                            });
                      }
                      else if(value == "delete"){
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Are you sure'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: Text('yes'),
                                  onPressed: () {
                                        deleteItem(data.id);
                                        Navigator.pop(context);
                                Future.delayed(Duration(seconds: 1), () async {
                                        CircularProgressIndicator();
                                });

                                  },
                                ),
                                ElevatedButton(
                                  child: Text('No'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    itemBuilder: (context){
                      return[
                            PopupMenuItem(child: Text("Update"),
                              value: "update",
                            ),
                            PopupMenuItem(child: Text("Delete"),
                                value:"delete"),
                          ];
                    },
                  ),
                );
          },
        ),
     ),

      floatingActionButton: FloatingActionButton(
        child: isLoading ? CircularProgressIndicator() : Icon(Icons.add),
        onPressed:()=> isLoading ? null : showDialog(context: context, barrierDismissible: false,
          builder:(BuildContext context){
          return AlertDialog(
          content: TextField(
          controller: homepageController.notesController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
          hintText: "Enter new content",
          filled: true,
          // suffixText: data.content,
          )
          // prefixText: data.content,
          ),
          actions: [
          ElevatedButton(
          child: Text('Add'),
          onPressed: () {

          _triggerAddData();
          homepageController.notesController.text;
          homepageController.notesController.clear();


          // Navigator.push(context, MaterialPageRoute(builder: (context) => LoaderPage()));
          // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          }
          ),

          CustomButton(buttonText: 'cancel', onPressed: ()=> Navigator.pop(context)),
          ],
          );
    }
    ),
      )
          );
  }
}


