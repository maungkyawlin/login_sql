class UserModel {
  late String user_id;
  late String user_name;
  late String email;
  late String password;
  UserModel(this.user_id, this.user_name, this.email, this.password);


//to catch data from sign up form
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_id': user_id,
      'user_name': user_name,
      'email': email,
      'password': password,
    };
    return map;
  }
 //to call data front end pages and send database
  UserModel.fromMap(Map<String, dynamic> map) {
    user_id = map['user_id'];
    user_name = map['user_name'];
    email = map['email'];
    password = map['password'];
  }

//this is otherway creation object type


  // UserModel.fromMap(dynamic obj){
  //   this.user_id=obj['user_id'];
  //   this.user_name=obj['user_name'];
  //   this.email=obj['email'];
  //   this.password=obj['password'];
  // }
}
