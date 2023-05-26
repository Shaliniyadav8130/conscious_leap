
class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message = "An unknown error occured"]);
  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password' : return SignUpWithEmailAndPasswordFailure('Please enter a string password');
      case 'invalid-email' : return SignUpWithEmailAndPasswordFailure('Email is not valid pr badly formatted');
      case 'email-already-in-use' : return SignUpWithEmailAndPasswordFailure('An account already exsits for that email');
      case 'operation-not-allowed' : return SignUpWithEmailAndPasswordFailure('Operation is not allowed. Please contact suppost');
      case 'user-disabled' : return SignUpWithEmailAndPasswordFailure('This user has been disabled. Please contact support for help');
      default: return SignUpWithEmailAndPasswordFailure();
    }
  }
}