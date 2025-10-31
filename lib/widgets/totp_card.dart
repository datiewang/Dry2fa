import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'dart:async';
import '../models/totp_item.dart';
import '../services/totp_service.dart';

class TotpCard extends StatefulWidget {
  final TotpItem item;
  final VoidCallback? onDelete;

  const TotpCard({
    Key? key,
    required this.item,
    this.onDelete,
  }) : super(key: key);

  @override
  _TotpCardState createState() => _TotpCardState();
}

class _TotpCardState extends State<TotpCard> {
  String _currentCode = '';
  int _remainingSeconds = 0;
  Timer? _timer;
  bool _isCodeVisible = true; // Always show code by default

  @override
  void initState() {
    super.initState();
    _updateCode();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateCode() {
    setState(() {
      _currentCode = TotpService.generateCode(widget.item);
      _remainingSeconds = TotpService.getRemainingSeconds(widget.item.period);
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final remaining = TotpService.getRemainingSeconds(widget.item.period);
      if (remaining != _remainingSeconds) {
        _updateCode();
      } else {
        setState(() {
          _remainingSeconds = remaining;
        });
      }
    });
  }

  Future<void> _copyCode() async {
    await TotpService.copyToClipboard(_currentCode);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(width: 12),
            Text(
              AppLocalizations.of(context)!.codeCopied,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green[600],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.all(16),
        duration: Duration(seconds: 2),
        elevation: 3,
      ),
    );
  }

  void _toggleCodeVisibility() {
    setState(() {
      _isCodeVisible = !_isCodeVisible;
    });
    if (_isCodeVisible) {
      _copyCode();
    }
  }

  String _formatCode(String code) {
    if (code.length == 6) {
      return '${code.substring(0, 3)} ${code.substring(3)}';
    }
    return code;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        // Tap to copy only; no show/hide toggle
        onTap: _copyCode,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.item.displaySubtitle.isNotEmpty)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              widget.item.displaySubtitle,
                              style: TextStyle(
                                fontSize: 11,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        SizedBox(height: widget.item.displaySubtitle.isNotEmpty ? 8 : 0),
                        Text(
                          widget.item.displayName.isEmpty 
                              ? AppLocalizations.of(context)!.unnamedAccount
                              : widget.item.displayName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.onDelete != null)
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.delete_outline_rounded, color: Colors.grey[600]),
                        onPressed: widget.onDelete,
                        iconSize: 20,
                      ),
                    ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      decoration: BoxDecoration(
                        color: _isCodeVisible 
                            ? Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3)
                            : Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                        border: _isCodeVisible 
                            ? Border.all(
                                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                                width: 1.5,
                              ) 
                            : Border.all(
                                color: Colors.grey.withValues(alpha: 0.2),
                                width: 1,
                              ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_isCodeVisible)
                            Icon(
                              Icons.copy_rounded,
                              size: 16,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          if (_isCodeVisible) SizedBox(width: 8),
                          Text(
                            _isCodeVisible ? _formatCode(_currentCode) : '●●● ●●●',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'monospace',
                              color: _isCodeVisible 
                                  ? Theme.of(context).colorScheme.primary 
                                  : Colors.grey[500],
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    width: 40,
                    height: 40,
                    child: Stack(
                      children: [
                        CircularProgressIndicator(
                          value: _remainingSeconds / widget.item.period,
                          strokeWidth: 3,
                          color: _remainingSeconds <= 5 
                              ? Colors.red[400] 
                              : Theme.of(context).colorScheme.primary,
                          backgroundColor: Colors.grey[200],
                        ),
                        Center(
                          child: Text(
                            '$_remainingSeconds',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: _remainingSeconds <= 5 
                                  ? Colors.red[600] 
                                  : Colors.grey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (_isCodeVisible)
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timer_rounded,
                        size: 14,
                        color: Colors.grey[500],
                      ),
                      SizedBox(width: 6),
                      Text(
                        AppLocalizations.of(context)!.updateIn(_remainingSeconds),
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
