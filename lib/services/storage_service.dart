import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/totp_item.dart';

class StorageService {
  static const String _storageKey = 'totp_items';

  static Future<List<TotpItem>> loadTotpItems() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);
    
    if (jsonString == null) return [];
    
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => TotpItem.fromJson(json)).toList();
  }

  static Future<void> saveTotpItems(List<TotpItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = items.map((item) => item.toJson()).toList();
    await prefs.setString(_storageKey, json.encode(jsonList));
  }

  static Future<void> addTotpItem(TotpItem item) async {
    final items = await loadTotpItems();
    items.add(item);
    await saveTotpItems(items);
  }

  static Future<void> removeTotpItem(String id) async {
    final items = await loadTotpItems();
    items.removeWhere((item) => item.id == id);
    await saveTotpItems(items);
  }
}