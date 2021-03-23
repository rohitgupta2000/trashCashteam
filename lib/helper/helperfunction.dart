import 'package:shared_preferences/shared_preferences.dart';
// this is made to save the information locally in the devices

class HelperFunctions{
  static String sharedPrefenceUserLoggedInKey="ISLOGGEDIN"; //satic means we can use the function anywhere without creating objects
  static String sharedPreferenceUserNameKey="USERNAMEKEY";
  static String sharedPreferenceUserEmailKey="USEREMAILKEY"; //these are the keys to identify the information
  static String sharedPreferenceUserDpKey="USERDPKEY";

  //saving data to shared preference

  static Future<bool> saveuserLoggedInSharedPreference(bool isUserLoggedIn) async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPrefenceUserLoggedInKey, isUserLoggedIn);
  }

 static Future<bool> saveUserNameSharedPreference(String userName) async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserNameKey, userName);
  }
   static Future<bool> saveUserEmailSharedPreference(String userEmail) async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserEmailKey, userEmail);
  }

 static Future<bool> saveUserDpSharedPreference(bool userDp) async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPreferenceUserDpKey, userDp);
  }

//getting data from SharedPreferences

 static Future<bool> getUserLoggedInSharedPreference() async{  //static so that the function can be used from anywhere without creating objects,bool is the datatype
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return await  prefs.getBool(sharedPrefenceUserLoggedInKey);
  }
   static Future<String> getUserNameSharedPreference() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return  await prefs.getString(sharedPreferenceUserNameKey);
    
  }

   static Future<String> getUserEmailSharedPreference() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return  prefs.getString(sharedPreferenceUserEmailKey);
  }

   static Future<bool> getUserDpSharedPreference() async{  //static so that the function can be used from anywhere without creating objects,bool is the datatype
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return await  prefs.getBool(sharedPreferenceUserDpKey);
  }
}
