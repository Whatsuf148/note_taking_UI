import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  Future<bool> signUp(
      String email, String password, BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading = false;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      notifyListeners();
      if (e.code == 'weak-password') {
        const snackbar =
            SnackBar(content: Text("The password provided is too weak."));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      } else if (e.code == 'email-already-in-use') {
        const snackbar = SnackBar(
            content: Text("The account already exists for that email."));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }else {
        const snackbar = SnackBar(
            content: Text("Error try again"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
      return false;
    } catch(e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
