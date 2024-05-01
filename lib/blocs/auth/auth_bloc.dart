import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/blocs/auth/auth_event.dart';
import 'package:payment_app/blocs/auth/auth_state.dart';
import 'package:payment_app/data/models/form_status.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(
          const AuthState(
            statusMessage: '',
            formStatus: FormStatus.pure,
            errorMessage: '',
          ),
        ) {
    on<CheckAuthenticationEvent>(_checkAuthentication);
    on<LoginUserEvent>(_loginUser);
    on<RegisterUserEvent>(_registerUser);
    on<LogOutUserEvent>(_logOutUser);
    on<SignInWithGoogleUserEvent>(_googleSignIn);
  }

  _checkAuthentication(CheckAuthenticationEvent event, emit) {}

  _loginUser(LoginUserEvent event, emit) {}

  _registerUser(RegisterUserEvent event, emit) {}

  _logOutUser(LogOutUserEvent event, emit) {}

  _googleSignIn(SignInWithGoogleUserEvent event, emit) {}
}

// Future<void> signInWithGoogle(BuildContext context,
//     [String? clientId]) async {
//   // Trigger the authentication flow
//   _notify(true);
//
//   final GoogleSignInAccount? googleUser =
//   await GoogleSignIn(clientId: clientId).signIn();
//
//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth =
//   await googleUser?.authentication;
//
//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );
//
//   // Once signed in, return the UserCredential
//   UserCredential userCredential =
//   await FirebaseAuth.instance.signInWithCredential(credential);
//   _notify(false);
//   if (userCredential.user != null) {
//     Navigator.pushReplacementNamed(context, RouteNames.tabRoute);
//   }
// }
