import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'AdminPage.dart';
import 'Animation/FadeAnimation.dart';
import 'UserPage.dart';

void main() => runApp(new MyApp());

String username='';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: new MyHomePage(),
      routes: <String,WidgetBuilder>{
        '/AdminPage': (BuildContext context)=> new AdminPage(),
        '/UserPage': (BuildContext context)=> new UserPage(),
        '/MyHomePage': (BuildContext context)=> new MyHomePage(),
      },
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();

  String msg='';

  Future<List> _login() async{
    final response = await http.post("http://192.168.43.33:8080/app_pariwisata/login.php", body: {
      "username": user.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);

    if(datauser.length==0){
      setState(() {
        msg="Login Failed";
      });
    }else{
      if(datauser[0]['level']=='admin'){
        Navigator.pushReplacementNamed(context, '/AdminPage');
      }else if(datauser[0]['level']=='user'){
        Navigator.pushReplacementNamed(context, '/UserPage');
      }

      setState(() {
        username= datauser[0]['username'];
      });
    }

    return datauser;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg1.jpg'),
                  fit: BoxFit.fill
                )
              ),


              child: Stack(
                children: <Widget>[
                  Positioned(
                    width: 80,
                    height: 200,
                    child: FadeAnimation(1, Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/light-1.png')
                        )
                      ),
                    )),
                  ),
                  
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: FadeAnimation(1.3, Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/light-2.png')
                        )
                      ),
                    )),
                  ),

                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 150,
                    child: FadeAnimation(1.5, Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/clock.png')
                        )
                      ),
                    )),
                  ),

                  Positioned(
                    child: FadeAnimation(1.6, Container(
                      margin: EdgeInsets.only(top:50),
                      child: Center(
                        child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                      ),
                    )),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  FadeAnimation(1.8, Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10),
                        )
                      ]
                    ),

                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey[100]))

                          ),

                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.grey[400])
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(

                          ),

                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey[400])
                            ),
                          ),
                        ),

                        SizedBox(height:10,),
                        FadeAnimation(2, Container(
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                              Color.fromRGBO(0, 148, 139, .1),
                              Color.fromRGBO(0, 148, 251, .6),
                              ]
                            )
                          ),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        )),

    
                      ],
                    ),
                  ))
                ],
              ),
              
              )
          ],
        ),

      ),
      
    );
  }
}