import 'lib/services/totp_service.dart';
import 'lib/models/totp_item.dart';

void main() {
  print('=== 2FA应用功能测试 ===\n');
  
  // 创建测试项目
  final testItem = TotpItem(
    id: '1',
    name: 'test@example.com',
    secret: 'JBSWY3DPEHPK3PXP',
    issuer: 'Test',
  );
  
  print('测试账户信息:');
  print('发行商: ${testItem.issuer}');
  print('账户名: ${testItem.name}');
  print('密钥: ${testItem.secret}');
  print('');
  
  // 生成验证码
  print('正在生成TOTP验证码...');
  try {
    final code = TotpService.generateCode(testItem);
    final remaining = TotpService.getRemainingSeconds(testItem.period);
    
    print('当前验证码: $code');
    print('剩余时间: ${remaining}秒');
    print('');
    print('✅ TOTP生成功能正常');
    
    // 验证码格式检查
    if (code.length == 6 && int.tryParse(code) != null) {
      print('✅ 验证码格式正确 (6位数字)');
    } else {
      print('❌ 验证码格式错误');
    }
    
    print('\n=== 测试完成 ===');
    print('你可以使用任意在线TOTP工具验证这个验证码是否正确');
    print('推荐使用: https://totp.danhersam.com/');
    print('输入密钥 JBSWY3DPEHPK3PXP 对比结果');
    
  } catch (e) {
    print('❌ 生成验证码失败: $e');
  }
}