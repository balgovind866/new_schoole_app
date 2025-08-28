import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';


import '../model/otp_model.dart';


class UserSecureStorage{
  static const storage = FlutterSecureStorage();
static saveUser(User data) async {
  String jsonData=jsonEncode(data);
  await storage.write(key: 'user', value: jsonData);
}
  static Future<User?> getUser() async {
  String? jsonData=await storage.read(key: 'user');
  if(jsonData!=null){
    Map<String, dynamic> userMap = jsonDecode(jsonData);
    return User.fromJson(userMap);
  }
  return null;
  }
  static Future<void> saveToken(String token) async {
    await storage.write(key: 'token', value: token); // ✅ Save raw string
  }

  static Future<String?> getToken() async {
    return await storage.read(key: 'token'); // Already returns raw string
  }


  static Future<bool> isPlayerCreated() async {
    String? isCreated = await storage.read(key: 'player_created');
    return isCreated == 'true';
  }

  // NEW METHOD: Mark player as created
  static Future<void> markPlayerAsCreated() async {
    await storage.write(key: 'player_created', value: 'true');
  }

  // NEW METHOD: Save player data


  static Future<void> clearAll() async {
    await storage.deleteAll();
  }

}