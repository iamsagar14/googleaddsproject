import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninManager {
  final GoogleSignIn _googleSignIn;

  GoogleSigninManager({
    required GoogleSignIn googleSignIn,
  }) : _googleSignIn = googleSignIn;

  Future<GoogleSignInAuthentication?> signInWithGoogle() async {
    await _googleSignIn.signOut();
    var googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      return googleSignInAccount.authentication;
    } else {
      return null;
    }
  }
}
