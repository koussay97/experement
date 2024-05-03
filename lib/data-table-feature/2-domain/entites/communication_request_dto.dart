class CommunicationRequest {
  String tm;
  int requestid;
  String type;
  String requestType;
  String mqttTopic;
  int messagesQuantity;
  int messagesLeft;
  String firmware;
  String technology;
  List<CommunicationRequestContent> content;

  CommunicationRequest({
    required this.tm,
    required this.requestid,
    required this.type,
    required this.requestType,
    required this.mqttTopic,
    required this.messagesQuantity,
    required this.messagesLeft,
    required this.firmware,
    required this.technology,
    required this.content,
  });

  factory CommunicationRequest.fromJson(Map<String, dynamic> json) =>
      CommunicationRequest(
        tm: json["tm"],
        requestid: json["requestid"],
        type: json["type"],
        requestType: json["requestType"],
        mqttTopic: json["mqttTopic"],
        messagesQuantity: json["messagesQuantity"],
        messagesLeft: json["MessagesLeft"],
        firmware: json["firmware"],
        technology: json["technology"],
        content: List<CommunicationRequestContent>.from(json["content"]
            .map((x) => CommunicationRequestContent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "tm": tm,
    "requestid": requestid,
    "type": type,
    "requestType": requestType,
    "mqttTopic": mqttTopic,
    "messagesQuantity": messagesQuantity,
    "MessagesLeft": messagesLeft,
    "firmware": firmware,
    "technology": technology,
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
  };
}

class CommunicationRequestContent {
  String tableid;
  String rowid;
  String fieldid;
  String valueHEX;
  String valueHR;
  String meteraca;
  List<DescriptionHR>? descriptionHR;
  String data;
  String error;
  String result;
  String protection;

  CommunicationRequestContent({
    required this.tableid,
    required this.rowid,
    required this.fieldid,
    required this.valueHEX,
    required this.valueHR,
    required this.meteraca,
    this.descriptionHR,
    required this.data,
    required this.error,
    required this.result,
    required this.protection,
  });

  factory CommunicationRequestContent.fromJson(Map<String, dynamic> json) =>
      CommunicationRequestContent(
        tableid: json["tableid"],
        rowid: json["rowid"],
        fieldid: json["fieldid"],
        valueHEX: json["valueHEX"],
        valueHR: json["valueHR"],
        meteraca: json["meteraca"],
        descriptionHR: json["descriptionHR"] != null
            ? List<DescriptionHR>.from(
            json["descriptionHR"].map((x) => DescriptionHR.fromJson(x)))
            : [],
        data: json["data"],
        error: json["error"],
        result: json["result"],
        protection: json["protection"],
      );

  Map<String, dynamic> toJson() => {
    "tableid": tableid,
    "rowid": rowid,
    "fieldid": fieldid,
    "valueHEX": valueHEX,
    "valueHR": valueHR,
    "meteraca": meteraca,
    "descriptionHR": descriptionHR != null
        ? List<dynamic>.from(descriptionHR!.map((x) => x.toJson()))
        : [],
    "data": data,
    "error": error,
    "result": result,
    "protection": protection,
  };
}

class DescriptionHR {
  String key;
  String value;

  DescriptionHR({
    required this.key,
    required this.value,
  });

  factory DescriptionHR.fromJson(Map<String, dynamic> json) => DescriptionHR(
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
  };
}
