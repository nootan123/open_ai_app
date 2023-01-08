import 'dart:convert';

OpenaiRequestModel? openaiRequestModelFromJson(String str) =>
    OpenaiRequestModel.fromJson(json.decode(str));

String openaiRequestModelToJson(OpenaiRequestModel? data) =>
    json.encode(data!.toJson());

class OpenaiRequestModel {
  OpenaiRequestModel({
    this.model,
    this.prompt,
    this.maxTokens,
    this.temperature,
    this.topP,
    this.frequencyPenalty,
    this.presencePenalty,
  });

  String? model;
  String? prompt;
  int? maxTokens;
  double? temperature;
  int? topP;
  int? frequencyPenalty;
  int? presencePenalty;

  factory OpenaiRequestModel.fromJson(Map<String, dynamic> json) =>
      OpenaiRequestModel(
        model: json["model"],
        prompt: json["prompt"],
        maxTokens: json["max_tokens"],
        temperature: json["temperature"].toDouble(),
        topP: json["top_p"],
        frequencyPenalty: json["frequency_penalty"],
        presencePenalty: json["presence_penalty"],
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "prompt": prompt,
        "max_tokens": maxTokens,
        "temperature": temperature,
        "top_p": topP,
        "frequency_penalty": frequencyPenalty,
        "presence_penalty": presencePenalty,
      };
}
