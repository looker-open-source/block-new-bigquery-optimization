connection: "looker_application"

# include all the views
include: "/views/**/*.view"

datagroup: newtest_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: newtest_default_datagroup

explore: cloudaudit_googleapis_com_data_access {
  join: cloudaudit_googleapis_com_data_access__resource {
    view_label: "Cloudaudit Googleapis Com Data Access: Resource"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access.resource}]) as cloudaudit_googleapis_com_data_access__resource ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access__resource__labels {
    view_label: "Cloudaudit Googleapis Com Data Access: Resource Labels"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access__resource.labels}]) as cloudaudit_googleapis_com_data_access__resource__labels ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access__http_request {
    view_label: "Cloudaudit Googleapis Com Data Access: Httprequest"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access.http_request}]) as cloudaudit_googleapis_com_data_access__http_request ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access__source_location {
    view_label: "Cloudaudit Googleapis Com Data Access: Sourcelocation"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access.source_location}]) as cloudaudit_googleapis_com_data_access__source_location ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata {
    view_label: "Cloudaudit Googleapis Com Data Access: Protopayload Auditlog Requestmetadata"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access__protopayload_auditlog.request_metadata}]) as cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata__request_attributes__headers {
    view_label: "Cloudaudit Googleapis Com Data Access: Protopayload Auditlog Requestmetadata Requestattributes Headers"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata__request_attributes.headers}) as cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata__request_attributes__headers ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata__request_attributes {
    view_label: "Cloudaudit Googleapis Com Data Access: Protopayload Auditlog Requestmetadata Requestattributes"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata.request_attributes}]) as cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata__request_attributes ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata__request_attributes__auth {
    view_label: "Cloudaudit Googleapis Com Data Access: Protopayload Auditlog Requestmetadata Requestattributes Auth"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata__request_attributes.auth}]) as cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata__request_attributes__auth ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata__destination_attributes {
    view_label: "Cloudaudit Googleapis Com Data Access: Protopayload Auditlog Requestmetadata Destinationattributes"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata.destination_attributes}]) as cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata__destination_attributes ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata__destination_attributes__labels {
    view_label: "Cloudaudit Googleapis Com Data Access: Protopayload Auditlog Requestmetadata Destinationattributes Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata__destination_attributes.labels}) as cloudaudit_googleapis_com_data_access__protopayload_auditlog__request_metadata__destination_attributes__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access__protopayload_auditlog__authentication_info {
    view_label: "Cloudaudit Googleapis Com Data Access: Protopayload Auditlog Authenticationinfo"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access__protopayload_auditlog.authentication_info}]) as cloudaudit_googleapis_com_data_access__protopayload_auditlog__authentication_info ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access__protopayload_auditlog__authentication_info__service_account_delegation_info__first_party_principal {
    view_label: "Cloudaudit Googleapis Com Data Access: Protopayload Auditlog Authenticationinfo Serviceaccountdelegationinfo Firstpartyprincipal"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access__protopayload_auditlog__authentication_info__service_account_delegation_info.first_party_principal}]) as cloudaudit_googleapis_com_data_access__protopayload_auditlog__authentication_info__service_account_delegation_info__first_party_principal ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access__protopayload_auditlog__authorization_info {
    view_label: "Cloudaudit Googleapis Com Data Access: Protopayload Auditlog Authorizationinfo"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access__protopayload_auditlog.authorization_info}) as cloudaudit_googleapis_com_data_access__protopayload_auditlog__authorization_info ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access__protopayload_auditlog__authorization_info__resource_attributes {
    view_label: "Cloudaudit Googleapis Com Data Access: Protopayload Auditlog Authorizationinfo Resourceattributes"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access__protopayload_auditlog__authorization_info.resource_attributes}]) as cloudaudit_googleapis_com_data_access__protopayload_auditlog__authorization_info__resource_attributes ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access__protopayload_auditlog__authorization_info__resource_attributes__labels {
    view_label: "Cloudaudit Googleapis Com Data Access: Protopayload Auditlog Authorizationinfo Resourceattributes Labels"
    sql: LEFT JOIN UNNEST(${cloudaudit_googleapis_com_data_access__protopayload_auditlog__authorization_info__resource_attributes.labels}) as cloudaudit_googleapis_com_data_access__protopayload_auditlog__authorization_info__resource_attributes__labels ;;
    relationship: one_to_many
  }

  join: cloudaudit_googleapis_com_data_access__protopayload_auditlog {
    view_label: "Cloudaudit Googleapis Com Data Access: Protopayload Auditlog"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access.protopayload_auditlog}]) as cloudaudit_googleapis_com_data_access__protopayload_auditlog ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access__protopayload_auditlog__resource_location {
    view_label: "Cloudaudit Googleapis Com Data Access: Protopayload Auditlog Resourcelocation"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access__protopayload_auditlog.resource_location}]) as cloudaudit_googleapis_com_data_access__protopayload_auditlog__resource_location ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access__protopayload_auditlog__status {
    view_label: "Cloudaudit Googleapis Com Data Access: Protopayload Auditlog Status"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access__protopayload_auditlog.status}]) as cloudaudit_googleapis_com_data_access__protopayload_auditlog__status ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access__operation {
    view_label: "Cloudaudit Googleapis Com Data Access: Operation"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access.operation}]) as cloudaudit_googleapis_com_data_access__operation ;;
    relationship: one_to_one
  }

  join: cloudaudit_googleapis_com_data_access__protopayload_auditlog__authentication_info__service_account_delegation_info {
    view_label: "Cloudaudit Googleapis Com Data Access: Protopayload Auditlog Authenticationinfo Serviceaccountdelegationinfo"
    sql: LEFT JOIN UNNEST([${cloudaudit_googleapis_com_data_access__protopayload_auditlog__authentication_info.service_account_delegation_info}]) as cloudaudit_googleapis_com_data_access__protopayload_auditlog__authentication_info__service_account_delegation_info ;;
    relationship: one_to_one
  }
}
