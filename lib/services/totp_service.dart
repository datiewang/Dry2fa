import 'package:otp/otp.dart';
import 'package:clipboard/clipboard.dart';
import '../models/totp_item.dart';

class TotpService {
  static String generateCode(TotpItem item) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return OTP.generateTOTPCodeString(
      item.secret,
      now,
      length: item.digits,
      interval: item.period,
      algorithm: Algorithm.SHA1,
      isGoogle: true,
    );
  }

  static int getRemainingSeconds(int period) {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return period - (now % period);
  }

  static Future<void> copyToClipboard(String code) async {
    await FlutterClipboard.copy(code);
  }
}