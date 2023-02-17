class QuranModel {
  int? code;
  String? status;
  Data? data;

  QuranModel({this.code, this.status, this.data});

  QuranModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ?   Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['code'] =  code;
    data['status'] =  status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? number;
  List<Ayahs>? ayahs;
  Surahs? surahs;
  Edition? edition;

  Data({this.number, this.ayahs, this.surahs, this.edition});

  Data.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    if (json['ayahs'] != null) {
      ayahs = <Ayahs>[];
      json['ayahs'].forEach((v) {
        ayahs!.add(  Ayahs.fromJson(v));
      });
    }
    surahs =
    json['surahs'] != null ?   Surahs.fromJson(json['surahs']) : null;
    edition =
    json['edition'] != null ?   Edition.fromJson(json['edition']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['number'] =  number;
    if ( ayahs != null) {
      data['ayahs'] =  ayahs!.map((v) => v.toJson()).toList();
    }
    if ( surahs != null) {
      data['surahs'] =  surahs!.toJson();
    }
    if ( edition != null) {
      data['edition'] =  edition!.toJson();
    }
    return data;
  }
}

class Ayahs {
  int? number;
  String? text;
  Surah? surah;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  Ayahs(
      {this.number,
        this.text,
        this.surah,
        this.numberInSurah,
        this.juz,
        this.manzil,
        this.page,
        this.ruku,
        this.hizbQuarter,
        this.sajda});

  Ayahs.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    text = json['text'];
    surah = json['surah'] != null ?   Surah.fromJson(json['surah']) : null;
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['number'] =  number;
    data['text'] = text;
    if ( surah != null) {
      data['surah'] =  surah!.toJson();
    }
    data['numberInSurah'] =  numberInSurah;
    data['juz'] =  juz;
    data['manzil'] =  manzil;
    data['page'] =  page;
    data['ruku'] =  ruku;
    data['hizbQuarter'] =  hizbQuarter;
    data['sajda'] =  sajda;
    return data;
  }
}

class Surah {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  int? numberOfAyahs;

  Surah(
      {this.number,
        this.name,
        this.englishName,
        this.englishNameTranslation,
        this.revelationType,
        this.numberOfAyahs});

  Surah.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    numberOfAyahs = json['numberOfAyahs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =    <String, dynamic>{};
    data['number'] =  number;
    data['name'] =  name;
    data['englishName'] =  englishName;
    data['englishNameTranslation'] =  englishNameTranslation;
    data['revelationType'] =  revelationType;
    data['numberOfAyahs'] =  numberOfAyahs;
    return data;
  }
}

class Surahs {
  Surah? s2;
  Surahs({this.s2});

  Surahs.fromJson(Map<String, dynamic> json) {
    s2 = json['2'] != null ?   Surah.fromJson(json['2']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =    <String, dynamic>{};
    if ( s2 != null) {
      data['2'] =  s2!.toJson();
    }
    return data;
  }
}

class Edition {
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
  String? direction;

  Edition(
      {this.identifier,
        this.language,
        this.name,
        this.englishName,
        this.format,
        this.type,
        this.direction});

  Edition.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    language = json['language'];
    name = json['name'];
    englishName = json['englishName'];
    format = json['format'];
    type = json['type'];
    direction = json['direction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['identifier'] =  identifier;
    data['language'] = language;
    data['name'] =  name;
    data['englishName'] =  englishName;
    data['format'] =  format;
    data['type'] = type;
    data['direction'] = direction;
    return data;
  }
}
