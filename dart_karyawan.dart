import 'karyawan.dart';

void main(List<String> arguments) {
  List<Karyawan> dataKaryawan = genData(dummyData());

  dataKaryawan[0].presensi(DateTime.parse('2023-08-08 07:00:00'));
  dataKaryawan[1].presensi(DateTime.parse('2023-08-08 09:01:01'));
  dataKaryawan[2].presensi(DateTime.parse('2023-08-08 09:01:00'));

  dataKaryawan[1].gaji = 500000;
  dataKaryawan[2].gaji = 5000000;

  dataKaryawan[0].alamat = "Semarang, Indonesia";

  for (var staff in dataKaryawan) {
    print(staff.deskripsi());
  }
}

List<Karyawan> genData(var listData) {
  List<Karyawan> data = [];

  for (var dtPegawai in listData) {
    Karyawan pegawai;
    if (dtPegawai.containsKey('jabatan')) {
      pegawai =
          Pejabat(dtPegawai['npp'], dtPegawai['nama'], dtPegawai['jabatan']);
    } else {
      pegawai = StafBiasa(dtPegawai['npp'], dtPegawai['nama']);
    }

    if (dtPegawai.containsKey('thn_masuk')) {
      pegawai.thnMasuk = dtPegawai['thn_masuk'];
    }

    if (dtPegawai.containsKey('alamat')) {
      pegawai.alamat = dtPegawai['alamat'];
    }

    data.add(pegawai);
  }

  return data;
}

List<Map<String, dynamic>> dummyData() {
  List<Map<String, dynamic>> data = [
    {
      "npp": "A123",
      "nama": "Lars Bak",
      "thn_masuk": 2017,
      "jabatan": TipeJabatan.direktur,
      "alamat": "Semarang Indonesia"
    },
    {
      "npp": "A345",
      "nama": "Kasper Lund",
      "thn_masuk": 2018,
      "jabatan": TipeJabatan.manajer,
      "alamat": "Semarang Indonesia"
    },
    {"npp": "B231", "nama": "Guido Van Rossum", "alamat": "California Amerika"},
    {
      "npp": "B355",
      "nama": "Rasmus Lerdorf",
      "thn_masuk": 2015,
      "alamat": "Bandung Indonesia"
    },
    {
      "npp": "B355",
      "nama": "Dennis MacAlistair Ritchie",
      "jabatan": TipeJabatan.kabag,
      "alamat": "Semarang Indonesia"
    },
  ];
  return data;
}
