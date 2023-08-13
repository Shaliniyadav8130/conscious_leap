
class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final bool hasAcceptedTerms;

  const UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.hasAcceptedTerms,
  });

  toJson(){
    return{
      "Uid":id,
      "FirstName":firstName,
      "LastName":lastName,
      "Email":email,
      "Mobile":phone,
      "password":password,
      "HasAcceptedTerms": hasAcceptedTerms,
    };
  }

}