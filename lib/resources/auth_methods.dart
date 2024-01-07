import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:instagram_flutter_clone/resources/storage_methods.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  /// [signUpUser] method used to sign up user
  Future<String> signUpUser({
    required String email,
    required String passWord,
    required String userName,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty ||
          passWord.isNotEmpty ||
          bio.isNotEmpty ||
          userName.isNotEmpty ||
          file.isNotEmpty) {
        /// register the user
        final UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: passWord,
        );
        debugPrint(userCredential.user!.uid);

        final String photoURL = await StorageMethods().uploadImageToStorage(
          childName: 'profilePics',
          file: file,
          isPost: false,
        );

        /// save user detail in firestore database
        await _firebaseFirestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': userName,
          'uid': userCredential.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoURL': photoURL,
        });

        /// alternative way to save user which document ID creates automatically
        /* await _firebaseFirestore.collection('users').add({
          'username': userName,
          'uid': userCredential.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
         }); */

        res = 'success';
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'This email is badly formatted';
      } else if (err.code == 'email-already-in-use') {
        res = 'This email is already in use';
      } else if (err.code == 'weak-password') {
        res = 'The password should be atleast 6 characters';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
