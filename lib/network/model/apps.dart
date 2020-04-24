
// To parse this JSON data, do
//
//     final apps = appsFromJson(jsonString);

import 'dart:convert';
import 'base_paginated.dart';

class Apps implements Paginated<AppModel>{
  List<AppModel> data;
  Paging paging;

  Apps({
    this.data,
    this.paging,
  });

  factory Apps.fromRawJson(String str) => Apps.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Apps.fromJson(Map<String, dynamic> json) => Apps(
    data: List<AppModel>.from(json["data"].map((x) => AppModel.fromJson(x))),
    paging: Paging.fromJson(json["paging"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "paging": paging.toJson(),
  };
}

class AppModel {
  String slug;
  String title;
  String projectType;
  String provider;
  String repoOwner;
  String repoUrl;
  String repoSlug;
  bool isDisabled;
  int status;
  bool isPublic;
  Owner owner;
  String avatarUrl;

  AppModel({
    this.slug,
    this.title,
    this.projectType,
    this.provider,
    this.repoOwner,
    this.repoUrl,
    this.repoSlug,
    this.isDisabled,
    this.status,
    this.isPublic,
    this.owner,
    this.avatarUrl,
  });

  factory AppModel.fromRawJson(String str) => AppModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppModel.fromJson(Map<String, dynamic> json) => AppModel(
    slug: json["slug"],
    title: json["title"],
    projectType: json["project_type"],
    provider: json["provider"],
    repoOwner: json["repo_owner"],
    repoUrl: json["repo_url"],
    repoSlug: json["repo_slug"],
    isDisabled: json["is_disabled"],
    status: json["status"],
    isPublic: json["is_public"],
    owner: Owner.fromJson(json["owner"]),
    avatarUrl: json["avatar_url"],
  );

  Map<String, dynamic> toJson() => {
    "slug": slug,
    "title": title,
    "project_type": projectType,
    "provider": provider,
    "repo_owner": repoOwner,
    "repo_url": repoUrl,
    "repo_slug": repoSlug,
    "is_disabled": isDisabled,
    "status": status,
    "is_public": isPublic,
    "owner": owner.toJson(),
    "avatar_url": avatarUrl,
  };
}

class Owner {
  String accountType;
  String name;
  String slug;

  Owner({
    this.accountType,
    this.name,
    this.slug,
  });

  factory Owner.fromRawJson(String str) => Owner.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    accountType: json["account_type"],
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "account_type": accountType,
    "name": name,
    "slug": slug,
  };
}
