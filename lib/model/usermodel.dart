

class UserModel {
  final String id;
  final String myname;
  final String myemail;
  final String myprofilpic;
  final int mywallet;


  UserModel({required this.id, required this.myname, required this.myemail, required this.myprofilpic,required this.mywallet});

  Map <String , dynamic> toJson(){
  return{
    'name': myname,
    'email': myemail,
    'profilepic':myprofilpic,
    'wallet':mywallet,

  };
}

}

