class GamesModel {
  bool? success;
  List<GamesData>? data;

  GamesModel({this.success, this.data});

  GamesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <GamesData>[];
      json['data'].forEach((v) {
        data!.add(new GamesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GamesData {
  String? gameId;
  String? hostUserId;
  int? courtId;
  String? locationLatitude;
  String? locationLongitude;
  String? gameDate;
  String? startTime;
  String? endTime;
  bool? isCourtReserved;
  String? gameFormat;
  List<String>? skillLevel;
  bool? isPublic;
  bool? inviteOthers;
  bool? bringGuest;
  bool? seeContact;
  var winningTeamScore;
  var losingTeamScore;
  var durationMinutes;
  String? notes;
  bool? isCancelled;
  String? gameStatus;
  bool? isAvailable;
  String? invitedType;
  String? createdAt;
  String? updatedAt;
  Host? host;
  Court? court;
  List<GameParticipations>? gameParticipations;

  GamesData(
      {this.gameId,
        this.hostUserId,
        this.courtId,
        this.locationLatitude,
        this.locationLongitude,
        this.gameDate,
        this.startTime,
        this.endTime,
        this.isCourtReserved,
        this.gameFormat,
        this.skillLevel,
        this.isPublic,
        this.inviteOthers,
        this.bringGuest,
        this.seeContact,
        this.winningTeamScore,
        this.losingTeamScore,
        this.durationMinutes,
        this.notes,
        this.isCancelled,
        this.gameStatus,
        this.isAvailable,
        this.invitedType,
        this.createdAt,
        this.updatedAt,
        this.host,
        this.court,
        this.gameParticipations});

  GamesData.fromJson(Map<String, dynamic> json) {
    gameId = json['game_id'];
    hostUserId = json['host_user_id'];
    courtId = json['court_id'];
    locationLatitude = json['location_latitude'];
    locationLongitude = json['location_longitude'];
    gameDate = json['game_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    isCourtReserved = json['is_court_reserved'];
    gameFormat = json['game_format'];
    skillLevel = json['skill_level'].cast<String>();
    isPublic = json['is_public'];
    inviteOthers = json['invite_others'];
    bringGuest = json['bring_guest'];
    seeContact = json['see_contact'];
    winningTeamScore = json['winning_team_score'];
    losingTeamScore = json['losing_team_score'];
    durationMinutes = json['duration_minutes'];
    notes = json['notes'];
    isCancelled = json['is_cancelled'];
    gameStatus = json['game_status'];
    isAvailable = json['is_available'];
    invitedType = json['invited_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    host = json['host'] != null ? new Host.fromJson(json['host']) : null;
    court = json['court'] != null ? new Court.fromJson(json['court']) : null;
    if (json['gameParticipations'] != null) {
      gameParticipations = <GameParticipations>[];
      json['gameParticipations'].forEach((v) {
        gameParticipations!.add(new GameParticipations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_id'] = this.gameId;
    data['host_user_id'] = this.hostUserId;
    data['court_id'] = this.courtId;
    data['location_latitude'] = this.locationLatitude;
    data['location_longitude'] = this.locationLongitude;
    data['game_date'] = this.gameDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['is_court_reserved'] = this.isCourtReserved;
    data['game_format'] = this.gameFormat;
    data['skill_level'] = this.skillLevel;
    data['is_public'] = this.isPublic;
    data['invite_others'] = this.inviteOthers;
    data['bring_guest'] = this.bringGuest;
    data['see_contact'] = this.seeContact;
    data['winning_team_score'] = this.winningTeamScore;
    data['losing_team_score'] = this.losingTeamScore;
    data['duration_minutes'] = this.durationMinutes;
    data['notes'] = this.notes;
    data['is_cancelled'] = this.isCancelled;
    data['game_status'] = this.gameStatus;
    data['is_available'] = this.isAvailable;
    data['invited_type'] = this.invitedType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.host != null) {
      data['host'] = this.host!.toJson();
    }
    if (this.court != null) {
      data['court'] = this.court!.toJson();
    }
    if (this.gameParticipations != null) {
      data['gameParticipations'] =
          this.gameParticipations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Host {
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  Host({this.id, this.firstName, this.lastName, this.email});

  Host.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    return data;
  }
}

class Court {
  int? id;
  String? name;
  String? address;
  String? city;
  String? courtType;

  Court({this.id, this.name, this.address, this.city, this.courtType});

  Court.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    courtType = json['court_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['city'] = this.city;
    data['court_type'] = this.courtType;
    return data;
  }
}

class GameParticipations {
  int? gamePlayerId;
  String? gameId;
  int? playerId;
  int? teamNumber;
  var score;
  var isServingPlayer;
  String? playerStatus;
  var joinedAt;
  String? createdAt;
  String? updatedAt;
  Player? player;

  GameParticipations(
      {this.gamePlayerId,
        this.gameId,
        this.playerId,
        this.teamNumber,
        this.score,
        this.isServingPlayer,
        this.playerStatus,
        this.joinedAt,
        this.createdAt,
        this.updatedAt,
        this.player});

  GameParticipations.fromJson(Map<String, dynamic> json) {
    gamePlayerId = json['game_player_id'];
    gameId = json['game_id'];
    playerId = json['player_id'];
    teamNumber = json['team_number'];
    score = json['score'];
    isServingPlayer = json['is_serving_player'];
    playerStatus = json['player_status'];
    joinedAt = json['joined_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    player =
    json['player'] != null ? new Player.fromJson(json['player']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_player_id'] = this.gamePlayerId;
    data['game_id'] = this.gameId;
    data['player_id'] = this.playerId;
    data['team_number'] = this.teamNumber;
    data['score'] = this.score;
    data['is_serving_player'] = this.isServingPlayer;
    data['player_status'] = this.playerStatus;
    data['joined_at'] = this.joinedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    return data;
  }
}

class Player {
  int? playerId;
  String? firstName;
  String? lastName;
  String? skillLevel;
  String? profileImage;

  Player(
      {this.playerId,
        this.firstName,
        this.lastName,
        this.skillLevel,
        this.profileImage});

  Player.fromJson(Map<String, dynamic> json) {
    playerId = json['player_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    skillLevel = json['skill_level'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['player_id'] = this.playerId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['skill_level'] = this.skillLevel;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
