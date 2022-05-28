class HomeDataModel {
  HomeDataModel({
    required this.data,
    required this.message,
  });
  late final Data data;
  late final String message;

  HomeDataModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.banners,
    required this.homeBanners,
  });
  late final List<Banners> banners;
  late final List<HomeBanners> homeBanners;

  Data.fromJson(Map<String, dynamic> json){
    banners = List.from(json['banners']).map((e)=>Banners.fromJson(e)).toList();
    homeBanners = List.from(json['home_banners']).map((e)=>HomeBanners.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['banners'] = banners.map((e)=>e.toJson()).toList();
    _data['home_banners'] = homeBanners.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Banners {
  Banners({
    required this.img,
    required this.url,
  });
  late final String img;
  late final String url;

  Banners.fromJson(Map<String, dynamic> json){
    img = json['img'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['img'] = img;
    _data['url'] = url;
    return _data;
  }
}

class HomeBanners {
  HomeBanners({
    required this.img,
    required this.url,
  });
  late final String img;
  late final String url;

  HomeBanners.fromJson(Map<String, dynamic> json){
    img = json['img'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['img'] = img;
    _data['url'] = url;
    return _data;
  }
}