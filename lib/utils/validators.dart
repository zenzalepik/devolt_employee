class FormValidator {
  static String? validateEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName harus diisi';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Alamat email harus diisi';
    } else if (!value.contains('@')) {
      return 'Email tidak valid';
    }
    return null;
  }

  static String? validateAmmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nominal biaya belum diisi';}
    return null;
  }

  static String? validateTanggal(String? value) {
    if (value == null || value.isEmpty) {
      return 'Silahkan pilih tanggal dahulu';}
    return null;
  }

  static String? validateAlokasi(String? value) {
    if (value == null || value.isEmpty) {
      return 'Alokasi belum ditentukan';}
    return null;
  }

  static String? validateProofs(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bukti gambar belum diunggah';}
    return null;
  }

  static String? validateKeterangan(String? value) {
    if (value == null || value.isEmpty) {
      return 'Keterangan belum diisi';}
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Silahkan ketik password dahulu';}
    return null;
  }

  static String? validatePasswordUlangi(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ulangi password lagi';}
    return null;
  }

  // Tambahkan fungsi validator tambahan sesuai kebutuhan Anda.
}
