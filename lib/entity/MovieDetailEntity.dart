// {
// "rating": {
// "max": 10,
// "average": 8.5,
// "stars": "45",
// "min": 0
// },
// "reviews_count": 5101,
// "wish_count": 45177,
// "douban_site": "",
// "year": "2018",
// "images": {
// "small": "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2514119443.webp",
// "large": "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2514119443.webp",
// "medium": "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2514119443.webp"
// },
// "alt": "https://movie.douban.com/subject/26861685/",
// "id": "26861685",
// "mobile_url": "https://movie.douban.com/subject/26861685/mobile",
// "title": "红海行动",
// "do_count": null,
// "share_url": "https://m.douban.com/movie/subject/26861685",
// "seasons_count": null,
// "schedule_url": "https://movie.douban.com/subject/26861685/cinema/",
// "episodes_count": null,
// "countries": [
// "中国大陆",
// "香港"
// ],
// "genres": [
// "剧情",
// "动作",
// "犯罪"
// ],
// "collect_count": 346736,
// "casts": [
// {
// "alt": "https://movie.douban.com/celebrity/1274761/",
// "avatars": {
// "small": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1489386626.47.webp",
// "large": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1489386626.47.webp",
// "medium": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1489386626.47.webp"
// },
// "name": "张译",
// "id": "1274761"
// },
// {
// "alt": "https://movie.douban.com/celebrity/1354442/",
// "avatars": {
// "small": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1458138265.51.webp",
// "large": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1458138265.51.webp",
// "medium": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1458138265.51.webp"
// },
// "name": "黄景瑜",
// "id": "1354442"
// },
// {
// "alt": "https://movie.douban.com/celebrity/1272245/",
// "avatars": {
// "small": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p49399.webp",
// "large": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p49399.webp",
// "medium": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p49399.webp"
// },
// "name": "海清",
// "id": "1272245"
// },
// {
// "alt": "https://movie.douban.com/celebrity/1322949/",
// "avatars": {
// "small": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1502100680.45.webp",
// "large": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1502100680.45.webp",
// "medium": "https://img3.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1502100680.45.webp"
// },
// "name": "杜江",
// "id": "1322949"
// }
// ],
// "current_season": null,
// "original_title": "红海行动",
// "summary": "索马里海域外，中国商船遭遇劫持，船员全数沦为阶下囚。蛟龙突击队沉着应对，潜入商船进行突袭，成功解救全部人质。\n返航途中，非洲北部伊维亚共和国发生政变，恐怖组织连同叛军攻入首都， 当地华侨面临危险，海军战舰接到上级命令改变航向，前往执行撤侨任务。蛟龙突击队八人，整装待发。\n时间紧迫，在“撤侨遇袭可反击，相反则必须避免交火，以免引起外交冲突”的大原则下，海军战舰及蛟龙突击队深入伊维亚，在恶劣的环境之下，借助海陆等多种装备，成功转移等候在码头的中国侨民，并在激烈的遭遇战之后，营救了被恐怖分子追击的中国领事馆巴士。\n然而事情尚未完结，就在掩护华侨撤离之际，蛟龙突击队收到中国人质被恐怖分子劫持的消息。众人深感责任重大，义无反顾地再度展开营救行动。前方路途险恶，蛟龙突击队即将遭遇的，远不止人质营救那么简单,恐怖分子的惊天阴谋即将浮出水面…..",
// "subtype": "movie",
// "directors": [
// {
// "alt": "https://movie.douban.com/celebrity/1275075/",
// "avatars": {
// "small": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1372934445.18.webp",
// "large": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1372934445.18.webp",
// "medium": "https://img1.doubanio.com/view/celebrity/s_ratio_celebrity/public/p1372934445.18.webp"
// },
// "name": "林超贤",
// "id": "1275075"
// }
// ],
// "comments_count": 156147,
// "ratings_count": 334073,
// "aka": [
// "刀锋·红海行动",
// "Operation Red Sea"
// ]
// }

import 'MovieEntity.dart';

class MovieDetailEntity {
  Rating rating;
  int reviewsCount;
  int wishCount;
  String doubanSite;
  String year;
  Images images;
  String alt;
  String id;
  String mobileUrl;
  String title;
  Null doCount;
  String shareUrl;
  Null seasonsCount;
  String scheduleUrl;
  Null episodesCount;
  List<String> countries;
  List<String> genres;
  int collectCount;
  List<Casts> casts;
  Null currentSeason;
  String originalTitle;
  String summary;
  String subtype;
  List<Directors> directors;
  int commentsCount;
  int ratingsCount;
  List<String> aka;

  MovieDetailEntity(
      {this.rating,
        this.reviewsCount,
        this.wishCount,
        this.doubanSite,
        this.year,
        this.images,
        this.alt,
        this.id,
        this.mobileUrl,
        this.title,
        this.doCount,
        this.shareUrl,
        this.seasonsCount,
        this.scheduleUrl,
        this.episodesCount,
        this.countries,
        this.genres,
        this.collectCount,
        this.casts,
        this.currentSeason,
        this.originalTitle,
        this.summary,
        this.subtype,
        this.directors,
        this.commentsCount,
        this.ratingsCount,
        this.aka});

  MovieDetailEntity.fromJson(Map<String, dynamic> json) {
    rating =
    json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    reviewsCount = json['reviews_count'];
    wishCount = json['wish_count'];
    doubanSite = json['douban_site'];
    year = json['year'];
    images =
    json['images'] != null ? new Images.fromJson(json['images']) : null;
    alt = json['alt'];
    id = json['id'];
    mobileUrl = json['mobile_url'];
    title = json['title'];
    doCount = json['do_count'];
    shareUrl = json['share_url'];
    seasonsCount = json['seasons_count'];
    scheduleUrl = json['schedule_url'];
    episodesCount = json['episodes_count'];
    countries = json['countries'].cast<String>();
    genres = json['genres'].cast<String>();
    collectCount = json['collect_count'];
    if (json['casts'] != null) {
      casts = new List<Casts>();
      json['casts'].forEach((v) {
        casts.add(new Casts.fromJson(v));
      });
    }
    currentSeason = json['current_season'];
    originalTitle = json['original_title'];
    summary = json['summary'];
    subtype = json['subtype'];
    if (json['directors'] != null) {
      directors =[];
      json['directors'].forEach((v) {
        directors.add(new Directors.fromJson(v));
      });
    }
    commentsCount = json['comments_count'];
    ratingsCount = json['ratings_count'];
    aka = json['aka'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['reviews_count'] = this.reviewsCount;
    data['wish_count'] = this.wishCount;
    data['douban_site'] = this.doubanSite;
    data['year'] = this.year;
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['mobile_url'] = this.mobileUrl;
    data['title'] = this.title;
    data['do_count'] = this.doCount;
    data['share_url'] = this.shareUrl;
    data['seasons_count'] = this.seasonsCount;
    data['schedule_url'] = this.scheduleUrl;
    data['episodes_count'] = this.episodesCount;
    data['countries'] = this.countries;
    data['genres'] = this.genres;
    data['collect_count'] = this.collectCount;
    if (this.casts != null) {
      data['casts'] = this.casts.map((v) => v.toJson()).toList();
    }
    data['current_season'] = this.currentSeason;
    data['original_title'] = this.originalTitle;
    data['summary'] = this.summary;
    data['subtype'] = this.subtype;
    if (this.directors != null) {
      data['directors'] = this.directors.map((v) => v.toJson()).toList();
    }
    data['comments_count'] = this.commentsCount;
    data['ratings_count'] = this.ratingsCount;
    data['aka'] = this.aka;
    return data;
  }
}

class Rating {
  int max;
  double average;
  String stars;
  int min;

  Rating({this.max, this.average, this.stars, this.min});

  Rating.fromJson(Map<String, dynamic> json) {
    max = json['max'];
    average = json['average'];
    stars = json['stars'];
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max'] = this.max;
    data['average'] = this.average;
    data['stars'] = this.stars;
    data['min'] = this.min;
    return data;
  }
}

class Images {
  String small;
  String large;
  String medium;

  Images({this.small, this.large, this.medium});

  Images.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}

class Casts {
  String alt;
  Images avatars;
  String name;
  String id;

  Casts({this.alt, this.avatars, this.name, this.id});

  Casts.fromJson(Map<String, dynamic> json) {
    alt = json['alt'];
    avatars =
    json['avatars'] != null ? new Images.fromJson(json['avatars']) : null;
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt'] = this.alt;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
