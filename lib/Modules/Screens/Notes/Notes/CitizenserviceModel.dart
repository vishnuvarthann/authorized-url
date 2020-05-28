class CitizenserviceModel {
  D _d;

  CitizenserviceModel({D d}) {
    this._d = d;
  }

  D get d => _d;
  set d(D d) => _d = d;

  CitizenserviceModel.fromJson(Map<String, dynamic> json) {
    _d = json['d'] != null ? new D.fromJson(json['d']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._d != null) {
      data['d'] = this._d.toJson();
    }
    return data;
  }
}

class D {
  List<Results> _results;

  D({List<Results> results}) {
    this._results = results;
  }

  List<Results> get results => _results;
  set results(List<Results> results) => _results = results;

  D.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      _results = new List<Results>();
      json['results'].forEach((v) {
        _results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._results != null) {
      data['results'] = this._results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  Metadata _mMetadata;
  String _serviceID;
  String _activityID;
  String _activityDesc;
  String _errorMsg;

  Results(
      {Metadata mMetadata,
      String serviceID,
      String activityID,
      String activityDesc,
      String errorMsg}) {
    this._mMetadata = mMetadata;
    this._serviceID = serviceID;
    this._activityID = activityID;
    this._activityDesc = activityDesc;
    this._errorMsg = errorMsg;
  }

  Metadata get mMetadata => _mMetadata;
  set mMetadata(Metadata mMetadata) => _mMetadata = mMetadata;
  String get serviceID => _serviceID;
  set serviceID(String serviceID) => _serviceID = serviceID;
  String get activityID => _activityID;
  set activityID(String activityID) => _activityID = activityID;
  String get activityDesc => _activityDesc;
  set activityDesc(String activityDesc) => _activityDesc = activityDesc;
  String get errorMsg => _errorMsg;
  set errorMsg(String errorMsg) => _errorMsg = errorMsg;

  Results.fromJson(Map<String, dynamic> json) {
    _mMetadata = json['__metadata'] != null
        ? new Metadata.fromJson(json['__metadata'])
        : null;
    _serviceID = json['ServiceID'];
    _activityID = json['ActivityID'];
    _activityDesc = json['ActivityDesc'];
    _errorMsg = json['ErrorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._mMetadata != null) {
      data['__metadata'] = this._mMetadata.toJson();
    }
    data['ServiceID'] = this._serviceID;
    data['ActivityID'] = this._activityID;
    data['ActivityDesc'] = this._activityDesc;
    data['ErrorMsg'] = this._errorMsg;
    return data;
  }
}

class Metadata {
  String _id;
  String _uri;
  String _type;

  Metadata({String id, String uri, String type}) {
    this._id = id;
    this._uri = uri;
    this._type = type;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get uri => _uri;
  set uri(String uri) => _uri = uri;
  String get type => _type;
  set type(String type) => _type = type;

  Metadata.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _uri = json['uri'];
    _type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['uri'] = this._uri;
    data['type'] = this._type;
    return data;
  }
}