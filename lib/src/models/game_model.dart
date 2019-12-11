// To parse this JSON data, do
//
//     final game = gameFromJson(jsonString);

import 'dart:convert';

Game gameFromJson(String str) => Game.fromJson(json.decode(str));

// String gameToJson(Game data) => json.encode(data.toJson());
class Games{
  List<Game> items = new List();
  Games();

  Games.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;
    jsonList.forEach((item){
        final game = new Game.fromJson(item);
        items.add(game);
    });
  }
}

class Game {
    String uniqueId;
    String slug;
    String name;
    int playtime;
    List<Platform> platforms;
    List<Store> stores;
    DateTime released;
    bool tba;
    String backgroundImage;
    double rating;
    int ratingTop;
    List<Rating> ratings;
    int ratingsCount;
    int reviewsTextCount;
    int added;
    AddedByStatus addedByStatus;
    dynamic metacritic;
    int suggestionsCount;
    int id;
    dynamic score;
    Clip clip;
    dynamic userGame;
    int reviewsCount;
    String saturatedColor;
    String dominantColor;
    List<ShortScreenshot> shortScreenshots;
    List<Platform> parentPlatforms;
    List<Genre> genres;

    Game({
        this.slug,
        this.name,
        this.playtime,
        this.platforms,
        this.stores,
        this.released,
        this.tba,
        this.backgroundImage,
        this.rating,
        this.ratingTop,
        this.ratings,
        this.ratingsCount,
        this.reviewsTextCount,
        this.added,
        this.addedByStatus,
        this.metacritic,
        this.suggestionsCount,
        this.id,
        this.score,
        this.clip,
        this.userGame,
        this.reviewsCount,
        this.saturatedColor,
        this.dominantColor,
        this.shortScreenshots,
        this.parentPlatforms,
        this.genres,
    });

    factory Game.fromJson(Map<String, dynamic> json) => Game(
        slug: json["slug"],
        name: json["name"],
        playtime: json["playtime"],
        platforms: List<Platform>.from(json["platforms"].map((x) => Platform.fromJson(x))),
        stores: json["sotres"] == null? null : List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
        released: DateTime.parse(json["released"]),
        tba: json["tba"],
        backgroundImage: json["background_image"],
        rating: json["rating"].toDouble(),
        ratingTop: json["rating_top"],
        ratings: List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
        ratingsCount: json["ratings_count"],
        reviewsTextCount: json["reviews_text_count"],
        added: json["added"],
        addedByStatus: AddedByStatus.fromJson(json["added_by_status"]),
        metacritic: json["metacritic"],
        suggestionsCount: json["suggestions_count"],
        id: json["id"],
        score: json["score"],
        clip: Clip.fromJson(json["clip"]),
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        saturatedColor: json["saturated_color"],
        dominantColor: json["dominant_color"],
        shortScreenshots: List<ShortScreenshot>.from(json["short_screenshots"].map((x) => ShortScreenshot.fromJson(x))),
        parentPlatforms: List<Platform>.from(json["parent_platforms"].map((x) => Platform.fromJson(x))),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    );
}

class AddedByStatus {
    int yet;
    int owned;
    int beaten;
    int toplay;
    int dropped;
    int playing;

    AddedByStatus({
        this.yet,
        this.owned,
        this.beaten,
        this.toplay,
        this.dropped,
        this.playing,
    });

    factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
        yet: json["yet"],
        owned: json["owned"],
        beaten: json["beaten"],
        toplay: json["toplay"],
        dropped: json["dropped"],
        playing: json["playing"],
    );

    Map<String, dynamic> toJson() => {
        "yet": yet,
        "owned": owned,
        "beaten": beaten,
        "toplay": toplay,
        "dropped": dropped,
        "playing": playing,
    };
}

class Clip {
    String clip;
    Clips clips;
    String video;
    String preview;

    Clip({
        this.clip,
        this.clips,
        this.video,
        this.preview,
    });

    factory Clip.fromJson(Map<String, dynamic> json) => Clip(
        clip: json["clip"],
        clips: Clips.fromJson(json["clips"]),
        video: json["video"],
        preview: json["preview"],
    );

    Map<String, dynamic> toJson() => {
        "clip": clip,
        "clips": clips.toJson(),
        "video": video,
        "preview": preview,
    };
}

class Clips {
    String the320;
    String the640;
    String full;

    Clips({
        this.the320,
        this.the640,
        this.full,
    });

    factory Clips.fromJson(Map<String, dynamic> json) => Clips(
        the320: json["320"],
        the640: json["640"],
        full: json["full"],
    );

    Map<String, dynamic> toJson() => {
        "320": the320,
        "640": the640,
        "full": full,
    };
}

class Genre {
    int id;
    String name;
    String slug;

    Genre({
        this.id,
        this.name,
        this.slug,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
    };
}

class Platform {
    Genre platform;

    Platform({
        this.platform,
    });

    factory Platform.fromJson(Map<String, dynamic> json) => Platform(
        platform: Genre.fromJson(json["platform"]),
    );

    Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
    };
}

class Rating {
    int id;
    String title;
    int count;
    double percent;

    Rating({
        this.id,
        this.title,
        this.count,
        this.percent,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        title: json["title"],
        count: json["count"],
        percent: json["percent"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "count": count,
        "percent": percent,
    };
}

class ShortScreenshot {
    int id;
    String image;

    ShortScreenshot({
        this.id,
        this.image,
    });

    factory ShortScreenshot.fromJson(Map<String, dynamic> json) => ShortScreenshot(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
    };
}

class Store {
    Genre store;

    Store({
        this.store,
    });

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        store: Genre.fromJson(json["store"]),
    );

    Map<String, dynamic> toJson() => {
        "store": store.toJson(),
    };
}
