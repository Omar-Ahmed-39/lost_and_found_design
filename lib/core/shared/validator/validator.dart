class MyValidators {
  // التحقق من أن الحقل ليس فارغاً
  static String? validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }

  // التحقق من البريد الإلكتروني
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال البريد الإلكتروني';
    }
    // Regex للتحقق من صيغة الإيميل
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'يرجى إدخال بريد إلكتروني صحيح';
    }
    return null;
  }
  static String? validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء اختيار أحد الخيارات من القائمة';
    }
    return null; // القيمة صحيحة
  }

  // التحقق من كلمة المرور (مثلاً: لا تقل عن 6 أحرف)
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال كلمة المرور';
    }
    if (value.length < 6) {
      return 'كلمة المرور يجب أن لا تقل عن 6 أحرف';
    }
    return null;
  }

  // التحقق من أرقام الهاتف (مثلاً: أرقام فقط وبطول معين)
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال رقم الهاتف';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'يرجى إدخال أرقام فقط';
    }
    if (value.length < 10) {
      return 'رقم الهاتف غير مكتمل';
    }
    return null;
  }

  // التحقق من تطابق كلمتي المرور (Confirm Password)
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'يرجى تأكيد كلمة المرور';
    }
    if (value != password) {
      return 'كلمتا المرور غير متطابقتين';
    }
    return null;
  }
}