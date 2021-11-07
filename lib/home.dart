

import 'package:flutter/material.dart';

class TodoUI extends StatefulWidget {
  const TodoUI({Key? key}) : super(key: key);

  @override
  _TodoUIState createState() => _TodoUIState();
}

class _TodoUIState extends State<TodoUI> {
  var lst = [];


  String gettext = "";
  TextEditingController txt = TextEditingController();

  get index => null;

  addtask() {
    setState(() {
      lst.add(gettext);
     
    });
  }

  removetask(){
    setState(() {
      lst.remove(gettext);
    });
  }

 

 

  void showalertdialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              title: const Center(
                child: Text( 
                  "Add Task",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                      child: TextField(
                        decoration: const InputDecoration(hintText: "enter your task"),
                        
                        
                    autofocus: true,
                    controller: txt,
                  
                    
                    onChanged: (value) {
                      gettext = value;
                     
                      
                    },
                  )),
                 const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            addtask();
                            txt.clear();
                          },
                          child:  const Center(
                            child: Text(
                              "ADD", style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
          toolbarHeight: 80,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(180, 10),
          )),
          
          title: const Center(
              child: Text(
            "My Todo List",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          actions: const [
        Padding(
               padding: EdgeInsets.all(8.0),
              child:  Icon(
                Icons.account_circle,
                size: 34,
              ),
            ),
          ],
        ),
        drawer: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Drawer(
            child: Column( 
              children: [

                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: 
                    NetworkImage("https://cdn.pixabay.com/photo/2020/04/14/10/15/flag-of-pakistan-5041782_1280.jpg"),
                  ),
                ),

                Column( children: const [

                  Center(child: Text("Ahmed Ali", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),))


                ],
               
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: showalertdialog,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: lst.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: (Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            lst[index],
                            style: const TextStyle(
                              
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                              
                            ),
                          ),
                            )
    
                          ),
                          trailing: SizedBox(
                          
                            width: 150,
                            child: Row(
                             
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
    
                                 IconButton(onPressed: (){
                               
                                  
                                 }, 
                                 icon: const Padding(
                                   padding: EdgeInsets.only(bottom: 8.0),
                                   child: Icon(Icons.edit, size: 22,),
                                 ),),
                               
                       
                                
                                
                                const SizedBox(width: 20,),
    
                                 IconButton(onPressed: (){
                                   removetask();
                                 }, 
                                 icon: const Padding(
                                   padding: EdgeInsets.only(bottom: 8.0),
                                   child: Icon(Icons.delete_sweep, size: 24,),
                                 ),),
    
                                
                                
                                
                              ],
                            ),
                          ),
                            
                           
                          
                        ),),
                        
                         
                           
                        
                      
                      
                      );
                    
                    
                  } ),
            ],
          ),
        ),
      ),
    );
  }
}



  