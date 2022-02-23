
import 'package:flutter/material.dart';
import 'package:latestauth/auth.dart';
import 'package:latestauth/error.dart';




class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {



  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  AuthMethods authMethods = new AuthMethods();
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text(''),
        ),
        body: isLoading ? Center(child: CircularProgressIndicator()) :
        Center(
          child: SingleChildScrollView(
            child: Padding(

              padding: const EdgeInsets.all(12.0),
              child: Column(

                children: [
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(

                          validator:(input){
                            if(input.isEmpty){
                              return 'Enter your Name';
                            }
                          },

                          decoration: InputDecoration(labelText: 'Name',),
                          controller: nameTextEditingController,

                        ),
                        TextFormField(
                          validator:(input){
                            if(input.isEmpty){
                              return 'enter your Email';
                            }
                          },
                          decoration: InputDecoration(labelText: 'Email',),
                          controller: emailTextEditingController,

                        ),
                        TextFormField(
                          validator:(input){
                            if (input.length < 6){
                              return "Password must be greater than 6 letters";
                            }
                          },
                          decoration: InputDecoration(labelText: 'Password',),
                          controller: passwordTextEditingController,
                          obscureText: true,

                        ),
                        RaisedButton(

                          color: Colors.amberAccent,
                          onPressed: () {authMethods.SignUp(emailTextEditingController.text, passwordTextEditingController.text);
                            setState(() {

                              isLoading = true;
                              if(authMethods.SignUp(emailTextEditingController.text, passwordTextEditingController.text) != null){
                                Navigator.push(context, MaterialPageRoute(builder: error()));
                              }
                            });

                          },
                          child: Text('Register'),),

                      ],
                    ),
                  ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(30),),
                      child: Text('Login'),
                    )



                ],
              ),
            ),
            ),
        ),
        );

  }
}
