import 'package:flutter/material.dart';
import '../models/totp_item.dart';
import '../services/storage_service.dart';
import '../widgets/totp_card.dart';
import 'add_totp_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TotpItem> _totpItems = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTotpItems();
  }

  Future<void> _loadTotpItems() async {
    setState(() => _isLoading = true);
    try {
      final items = await StorageService.loadTotpItems();
      setState(() {
        _totpItems = items;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('データの読み込みに失敗しました: $e')),
      );
    }
  }

  Future<void> _navigateToAddPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTotpPage()),
    );
    
    if (result == true) {
      _loadTotpItems();
    }
  }

  Future<void> _deleteItem(String id) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('削除の確認'),
        content: Text('この2FA認証を削除してよろしいですか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('キャンセル'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('削除'),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await StorageService.removeTotpItem(id);
      _loadTotpItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          '2FA認証マネージャー',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_rounded, size: 24),
            onPressed: _loadTotpItems,
          ),
          SizedBox(width: 8),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _totpItems.isEmpty
              ? Center(
                  child: Container(
                    padding: EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Icon(
                            Icons.shield_outlined,
                            size: 60,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        SizedBox(height: 32),
                        Text(
                          'まだ、2FA認証がありません',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          '下のボタンで最初の2FA認証を追加してください',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: _totpItems.length,
                  itemBuilder: (context, index) {
                    final item = _totpItems[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: TotpCard(
                        item: item,
                        onDelete: () => _deleteItem(item.id),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddPage,
        icon: Icon(Icons.add_rounded, size: 24),
        label: Text('追加', style: TextStyle(fontWeight: FontWeight.w600)),
        tooltip: '2FA認証を追加',
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}