// ignore_for_file: null_check_always_fails


//import 'package:path_provider/path_provider.dart';
//import 'dart:io' as io;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


import '../model/UserModel.dart';

class DBHelper {
  static Database? _db;
  static const String DB_Name = 'login.db';
  static const String TABLE_Name = 'user';


  static const String U_userId = 'user_id';
  static const String U_userName = 'user_name';
  static const String U_email = 'email';
  static const String U_password = 'password';

//this method is for request methods / insert ,update ,read ,delete (var db)
  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    // io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    // print('db location :' + documentDirectory.path);
    // String path = join(documentDirectory.path, DB_Name);
    
    String db_path=await getDatabasesPath();
    String path=join(db_path,"DB _Name");
    


    Database _onCreatedb= await openDatabase(path, version: 1, onCreate: _onCreate);
    return _onCreatedb;
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE_Name("
        "$U_userId TEXT ,"
        "$U_userName TEXT,"
        "$U_email TEXT,"
        "$U_password TEXT ,"
        "PRIMARY KEY ($U_userId)"
        ")");
  }

 //to send data form signup form to database 
  Future<int> saveUser(UserModel user) async{
    var userDb=await db;
    var res=await userDb.insert(TABLE_Name, user.toMap());
    return res;

  }

//to request data from database to login form
  Future<UserModel> getLoginUser(String uid, String password) async{
    var userDb=await db;
    var res=await userDb.rawQuery("SELECT * FROM $TABLE_Name WHERE $U_userId='$uid' AND $U_password='$password'");
    
    //check data input /output from database
    if(res.length>0){

      //data list type from UserModal to ui  by Map
    return UserModel.fromMap(res.first);
  }
  return null!;
  }
  
}
