class CreateGameModel {
  bool? success;
  Data? data;
  String? message;
  List<Players>? players;

  CreateGameModel({this.success, this.data, this.message, this.players});

  CreateGameModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(new Players.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? gameId;
  bool? isCourtReserved;
  bool? isCancelled;
  String? gameStatus;
  String? hostUserId;
  int? courtId;
  String? locationLatitude;
  String? locationLongitude;
  String? gameDate;
  String? startTime;
  String? endTime;
  String? gameFormat;
  String? skillLevel;
  bool? isPublic;
  bool? inviteOthers;
  bool? bringGuest;
  bool? seeContact;
  String? notes;
  bool? isAvailable;
  String? invitedType;
  String? updatedAt;
  String? createdAt;
  Null? winningTeamScore;
  Null? losingTeamScore;
  Null? durationMinutes;

  Data(
      {this.gameId,
        this.isCourtReserved,
        this.isCancelled,
        this.gameStatus,
        this.hostUserId,
        this.courtId,
        this.locationLatitude,
        this.locationLongitude,
        this.gameDate,
        this.startTime,
        this.endTime,
        this.gameFormat,
        this.skillLevel,
        this.isPublic,
        this.inviteOthers,
        this.bringGuest,
        this.seeContact,
        this.notes,
        this.isAvailable,
        this.invitedType,
        this.updatedAt,
        this.createdAt,
        this.winningTeamScore,
        this.losingTeamScore,
        this.durationMinutes});

  Data.fromJson(Map<String, dynamic> json) {
    gameId = json['game_id'];
    isCourtReserved = json['is_court_reserved'];
    isCancelled = json['is_cancelled'];
    gameStatus = json['game_status'];
    hostUserId = json['host_user_id'];
    courtId = json['court_id'];
    locationLatitude = json['location_latitude'];
    locationLongitude = json['location_longitude'];
    gameDate = json['game_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    gameFormat = json['game_format'];
    skillLevel = json['skill_level'];
    isPublic = json['is_public'];
    inviteOthers = json['invite_others'];
    bringGuest = json['bring_guest'];
    seeContact = json['see_contact'];
    notes = json['notes'];
    isAvailable = json['is_available'];
    invitedType = json['invited_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    winningTeamScore = json['winning_team_score'];
    losingTeamScore = json['losing_team_score'];
    durationMinutes = json['duration_minutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_id'] = this.gameId;
    data['is_court_reserved'] = this.isCourtReserved;
    data['is_cancelled'] = this.isCancelled;
    data['game_status'] = this.gameStatus;
    data['host_user_id'] = this.hostUserId;
    data['court_id'] = this.courtId;
    data['location_latitude'] = this.locationLatitude;
    data['location_longitude'] = this.locationLongitude;
    data['game_date'] = this.gameDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['game_format'] = this.gameFormat;
    data['skill_level'] = this.skillLevel;
    data['is_public'] = this.isPublic;
    data['invite_others'] = this.inviteOthers;
    data['bring_guest'] = this.bringGuest;
    data['see_contact'] = this.seeContact;
    data['notes'] = this.notes;
    data['is_available'] = this.isAvailable;
    data['invited_type'] = this.invitedType;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['winning_team_score'] = this.winningTeamScore;
    data['losing_team_score'] = this.losingTeamScore;
    data['duration_minutes'] = this.durationMinutes;
    return data;
  }
}

class Players {
  var playerId;
  String? status;

  Players({this.playerId, this.status});

  Players.fromJson(Map<String, dynamic> json) {
    playerId = json['player_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['player_id'] = this.playerId;
    data['status'] = this.status;
    return data;
  }
}
