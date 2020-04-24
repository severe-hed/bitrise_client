// To parse this JSON data, do
//
//     final builds = buildsFromJson(jsonString);

import 'dart:convert';
import 'base_paginated.dart';

class Builds implements Paginated<Build> {
  List<Build> data;
  Paging paging;

  Builds({
    this.data,
    this.paging,
  });

  factory Builds.fromRawJson(String str) => Builds.fromJson(json.decode(str));

  factory Builds.fromJson(Map<String, dynamic> json) => Builds(
    data: List<Build>.from(json["data"].map((x) => Build.fromJson(x))),
    paging: Paging.fromJson(json["paging"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "paging": paging.toJson(),
  };
}

class Build {
  DateTime triggeredAt;
  DateTime startedOnWorkerAt;
  DateTime environmentPrepareFinishedAt;
  DateTime finishedAt;
  String slug;
  int status;
  String statusText;
  String abortReason;
  bool isOnHold;
  String branch;
  int buildNumber;
  dynamic commitHash;
  dynamic commitMessage;
  dynamic tag;
  String triggeredWorkflow;
  String triggeredBy;
  String machineTypeId;
  String stackIdentifier;
  OriginalBuildParams originalBuildParams;
  int pullRequestId;
  dynamic pullRequestTargetBranch;
  dynamic pullRequestViewUrl;
  dynamic commitViewUrl;
  Repository repository;

  Build({
    this.triggeredAt,
    this.startedOnWorkerAt,
    this.environmentPrepareFinishedAt,
    this.finishedAt,
    this.slug,
    this.status,
    this.statusText,
    this.abortReason,
    this.isOnHold,
    this.branch,
    this.buildNumber,
    this.commitHash,
    this.commitMessage,
    this.tag,
    this.triggeredWorkflow,
    this.triggeredBy,
    this.machineTypeId,
    this.stackIdentifier,
    this.originalBuildParams,
    this.pullRequestId,
    this.pullRequestTargetBranch,
    this.pullRequestViewUrl,
    this.commitViewUrl,
    this.repository,
  });

  factory Build.fromRawJson(String str) => Build.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Build.fromJson(Map<String, dynamic> json) => Build(
    triggeredAt: DateTime.parse(json["triggered_at"]),
    startedOnWorkerAt: DateTime.parse(json["started_on_worker_at"]),
    environmentPrepareFinishedAt: DateTime.parse(json["environment_prepare_finished_at"]),
    finishedAt: DateTime.parse(json["finished_at"]),
    slug: json["slug"],
    status: json["status"],
    statusText: json["status_text"],
    abortReason: json["abort_reason"] == null ? null : json["abort_reason"],
    isOnHold: json["is_on_hold"],
    branch: json["branch"],
    buildNumber: json["build_number"],
    commitHash: json["commit_hash"],
    commitMessage: json["commit_message"],
    tag: json["tag"],
    triggeredWorkflow: json["triggered_workflow"],
    triggeredBy: json["triggered_by"] == null ? null : json["triggered_by"],
    machineTypeId: json["machine_type_id"],
    stackIdentifier: json["stack_identifier"],
    originalBuildParams: OriginalBuildParams.fromJson(json["original_build_params"]),
    pullRequestId: json["pull_request_id"],
    pullRequestTargetBranch: json["pull_request_target_branch"],
    pullRequestViewUrl: json["pull_request_view_url"],
    commitViewUrl: json["commit_view_url"],
    repository: Repository.fromJson(json["repository"]),
  );

  Map<String, dynamic> toJson() => {
    "triggered_at": triggeredAt.toIso8601String(),
    "started_on_worker_at": startedOnWorkerAt.toIso8601String(),
    "environment_prepare_finished_at": environmentPrepareFinishedAt.toIso8601String(),
    "finished_at": finishedAt.toIso8601String(),
    "slug": slug,
    "status": status,
    "status_text": statusText,
    "abort_reason": abortReason == null ? null : abortReason,
    "is_on_hold": isOnHold,
    "branch": branch,
    "build_number": buildNumber,
    "commit_hash": commitHash,
    "commit_message": commitMessage,
    "tag": tag,
    "triggered_workflow": triggeredWorkflow,
    "triggered_by": triggeredBy == null ? null : triggeredBy,
    "machine_type_id": machineTypeId,
    "stack_identifier": stackIdentifier,
    "original_build_params": originalBuildParams.toJson(),
    "pull_request_id": pullRequestId,
    "pull_request_target_branch": pullRequestTargetBranch,
    "pull_request_view_url": pullRequestViewUrl,
    "commit_view_url": commitViewUrl,
    "repository": repository.toJson(),
  };
}

class OriginalBuildParams {
  String branch;
  String workflowId;
  bool remoteAccess;

  OriginalBuildParams({
    this.branch,
    this.workflowId,
    this.remoteAccess,
  });

  factory OriginalBuildParams.fromRawJson(String str) => OriginalBuildParams.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OriginalBuildParams.fromJson(Map<String, dynamic> json) => OriginalBuildParams(
    branch: json["branch"],
    workflowId: json["workflow_id"],
    remoteAccess: json["remote_access"] == null ? null : json["remote_access"],
  );

  Map<String, dynamic> toJson() => {
    "branch": branch,
    "workflow_id": workflowId,
    "remote_access": remoteAccess == null ? null : remoteAccess,
  };
}

class Repository {
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

  Repository({
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

  factory Repository.fromRawJson(String str) => Repository.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Repository.fromJson(Map<String, dynamic> json) => Repository(
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

