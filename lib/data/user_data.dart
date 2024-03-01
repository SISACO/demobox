
class UserModel{
  final String ?id;
  final String name;
  final String email;
  final String username;
  final String pass;

  UserModel({required this.id, required this.name, required this.email, required this.username, required this.pass,});

  tojson(){
    return{
      "Name" : name,
      "EmailId" : email,
      "Username" : username,
      "Password" : pass,
    };
  }

}