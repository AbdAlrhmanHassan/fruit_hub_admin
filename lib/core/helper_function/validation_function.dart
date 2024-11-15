// Validation functions
String? validateFullName(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء ادخال الاسم الكامل';
  } else if (value.length < 3) {
    return 'الاسم يجب ان يكون اكثر من حرفين';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء ادخال البريد الالكتروني';
  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return 'الرجاء ادخال بريد الكتروني صحيح';
  }
  return null;
}

String? validateField(String? value, String fieldName) {
  if (value == null || value.isEmpty) {
    return 'الرجاء ادخال $fieldName';
  }
  return null;
}

String? validatepassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'يرجى إدخال كلمة المرور';
  } else if (value.length < 6) {
    return 'يجب أن تكون كلمة المرور مكونة من 6 أحرف على الأقل';
  }
  return null;
}
