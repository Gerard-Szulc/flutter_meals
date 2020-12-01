import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meals/models/userModel.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  AppUser _userFromFirebaseUser(User user) {
    return user != null
        ? AppUser(
            uid: user.uid,
            displayName: user.displayName,
            email: user.email,
            photoURL: user.photoURL)
        : null;
  }

  Stream<AppUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(email, password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      _userFromFirebaseUser(user);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  signOut() {
    try {
      _auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);
      return _userFromFirebaseUser(user);
    }

    return null;
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Signed Out");
  }
}
