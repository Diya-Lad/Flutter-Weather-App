import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 fav()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme:ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.orange
  ),
  home: MyApp(),
));
class MyApp extends StatefulWidget {
   MyApp({Key key}) : super(key: key);

  @override

  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos = [];
  String input = "";
  deleteTodos(item)
  {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("Location")
        .doc(input);
    documentReference.delete().whenComplete(() {
      print("deleted");
    });
  }
  createTodoc()
  {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("Location")
        .doc(input);
    Map<String, String> todos={
      "todosTitle":input
    };
    documentReference.set(todos).whenComplete(() {
      print("$input created");
    });
  }

  // final CollectionReference list = FirebaseFirestore.instance.collection("Location");

  // Future getUsersList() async{
  //   List cityList = [];
  //   try{
  //     await list.get().then((querySnapshot){
  //       querySnapshot.docs.forEach((element) {
  //           cityList.add(element.data);
  //       });
  //     });
  //   }
  //   catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // List cityInfoList = [];

  // fetchDatabaseList() async{
  //   dynamic resultant = await DatabaseManager[].getUserList();
  //   if(resultant == null){
  //     print("Unable to retrive");
  //   }
  //   else{
  //       setState(() {
  //         cityInfoList = resultant;
  //       });
  //   }
  // }

  @override
  void initState()
  {
    super.initState();
    // todos.add("valsad");
    // todos.add("vapi");
    // todos.add("surat");

      super.initState();
      Firebase.initializeApp().whenComplete(() {
        print("completed");
        setState(() {});
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: ()
      //   {
      //     showDialog(
      //         context: context,
      //         builder: (BuildContext context) {
      //           return AlertDialog(
      //             title: Text("Add Todolist"),
      //             content: TextField(
      //                 onChanged: (String value) {
      //                   input = value;
      //                 }
      //             ),
      //
      //             actions: <Widget>[
      //               ElevatedButton(onPressed: () {
      //                 createTodoc();
      //                 Navigator.of(context).pop();
      //
      //               },
      //                   child: Text("Add")),
      //             ],
      //           );
      //         });
      //     child:
      //     Icon(
      //       Icons.add,
      //       color: Colors.white,
      //     );
      //   },
      // ),
      body: StreamBuilder(stream: FirebaseFirestore.instance.collection("Location").snapshots(),builder: (context, snapshots){
        if(snapshots.data == null || !snapshots.hasData) return CircularProgressIndicator();
          return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshots.data.docs.length ,itemBuilder: (context, index){
                DocumentSnapshot documentSnapshot = snapshots.data.docs[index];
                print("Helllllo");
                print(documentSnapshot["LocationTitle"]) ;
            return Dismissible(
                key: Key(index.toString()),
                child: Card(
                  elevation: 4,
                  margin:EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                      title:Text(documentSnapshot["LocationTitle"]),
                      trailing:  IconButton(
                        icon: Icon(Icons.delete , color:Colors.red),
                        onPressed: (){
                          deleteTodos(documentSnapshot["LocationTitle"]);
                        },
                      )
                  ),
                )

            );
          });

      })
    );
  }
}
