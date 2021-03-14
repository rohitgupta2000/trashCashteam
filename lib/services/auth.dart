import 'package:firebase_auth/firebase_auth.dart';
import 'package:trashcash_home/modals.dart/user.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance; // made this for shorthand

  UserIdGeneration _userFromFirebaseUser(User user) {
    return user != null
        ? UserIdGeneration(userId: user.uid)
        : null; //dont convert into id if receiving null
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser =
          result.user; //converting this firebase user into userId
      return _userFromFirebaseUser(firebaseUser);

      //we will create a userId for all uique users for that user.dart is made
    } catch (e) {
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async{
      try{
        UserCredential result= await _auth.createUserWithEmailAndPassword
        (email: email, password: password);
        User firebaseUser =result.user;
        return _userFromFirebaseUser(firebaseUser);
      }catch(e){
        print(e.toString());
              }
    }


   Future resetPass(String email) async{
      try{
        return await _auth.sendPasswordResetEmail(email: email);

      }catch(e){
        print(e.toString());
      }
    }
   
   Future signOut() async{
      try{
          return await _auth.signOut();//Firebaseauth.instance.signOut();
      }catch(e){

      }
    }

}
