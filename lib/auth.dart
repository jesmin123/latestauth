
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods{


  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future SignUp(String email,String password) async{

      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }}

  }