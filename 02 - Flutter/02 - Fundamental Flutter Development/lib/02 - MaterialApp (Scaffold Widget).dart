import 'package:flutter/material.dart'; 

void main() {
  runApp(
    MaterialApp(                                        
      title: "02 - MaterialApp (Scaffold Widget)",                                            
      theme: ThemeData(scaffoldBackgroundColor: Colors.pink[50]), 
      home: Scaffold(
        appBar: AppBar(                                      
          title: Text("My App")                         
        ),
        
        body: Container(
          child: Center(
            child: Text("Body")
          )
        ),

        bottomNavigationBar: Container(
          height: 80,
          child: Center(
            child: Text("Bottom Tab Nav")
          )
        )                                                                                                
      )
    )
  );                                      
}
