
class UserModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
});

  toJson(){
    return{
      "Uid":id,
      "FirstName":firstName,
      "LastName":lastName,
      "Phone":email,
      "Mobile":password,
    };
  }

}