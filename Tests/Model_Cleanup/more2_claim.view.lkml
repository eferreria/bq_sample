#include: "zz_ext_base_claim_fields.view"
# EAF: 16,372,454,068 row ct

view: claim {
  view_label: "Claims - Medical"
  sql_table_name: more2v1_20181101.claim ;;
#   sql_table_name: @{schema_name}.claim ;;

  dimension: claim_uid {
    label: "Claim ID"
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.CLAIMUID ;;
  }

  dimension_group: admit {
    description: "Date the member was admitted to hospital"
    type: time
    timeframes: [raw, date,  week,  month,  quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ADMITDATE ;;
  }

  dimension_group: discharge {
    description: "Date of Discharge; applicable to all inpatient visits"
    type: time
    timeframes: [raw, date,  week,  month,  quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DISCHARGEDATE ;;
  }

  dimension_group: service {
    description: "The date when the service was provided or began. Always has value"
    sql: ${TABLE}.servicedate ;;
    type: time
    timeframes: [raw, date,  week,  month,  quarter, year]
    convert_tz: no
    datatype: date
  }

  dimension_group: service_thru {
    description: "The date when the service ended.
    For claims that only have a single date of service, ServiceThruDate will be equal to ServiceDate."
    type: time
    timeframes: [raw, date,  week,  month,  quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.servicethrudate ;;
  }

  dimension: los {
    label: "Length of Stay (Days)"
    description: "Difference in days between admit and discharge dates"
    sql: datediff(day, ${admit_raw}, ${discharge_raw}) ;;
  }

  dimension: claim_status_code_raw {
    group_label: "Hospital and Professional Billing"
    type: string
    hidden: yes
    sql: ${TABLE}.CLAIMSTATUSCODE ;;
  }

  dimension: claim_status_code{
    group_label: "Hospital and Professional Billing"
    type: string
    case: {
      when: {
        label: "Adjusted to Original Claim"
        sql: ${claim_status_code_raw} = 'A' ;;
      }
      when: {
        label: "Denied Claim"
        sql: ${claim_status_code_raw} = 'D' ;;
      }
      when: {
        label: "Initial Pay Claim"
        sql: ${claim_status_code_raw} = 'I' ;;
      }
      when: {
        label: "Pended for Adjudication"
        sql: ${claim_status_code_raw} = 'P' ;;
      }
      when: {
        label: "Reversal to Original Claim"
        sql: ${claim_status_code_raw} = 'R' ;;
      }
      else: "Unknown"
    }
  }

  dimension: claim_type_raw {
    group_label: "Hospital and Professional Billing"
    description: "Indicates whether the claim is an institutional or Professional Claim:
    Claim Type values include:
    1) D -- Dental
    2) I -- Institutional
    3) P -- Professional
    4) U -- Unknown
    5) X -- Invalid"
    type: string
    sql: ${TABLE}.CLAIMTYPE ;;
  }

  dimension: claim_type {
    group_label: "Hospital and Professional Billing"
    description: "Indicates whether the claim is an institutional or Professional Claim"
    type: string
    case: {
      when: {label:"Institutional" sql:${claim_type_raw}='I'  ;;}
      when: {label:"Professional" sql:${claim_type_raw}='P';;}
      when: {label:"Dental" sql:${claim_type_raw}='D'  ;;}
      else: "Unknown/Invalid"
    }
  }

  dimension: claim_type_derived {
    group_label: "Indicators"
    type: yesno
    sql: ${TABLE}.CLAIMTYPEDERIVED ;;
  }

  dimension: claim_type_institutional {
    group_label: "Hospital and Professional Billing"
    type: string
    sql: ${TABLE}.CLAIMTYPEINSTITUTIONAL ;;
  }

  dimension: allowed_amount {
#     hidden: yes
  type: number
  sql: ${TABLE}.ALLOWEDAMOUNT ;;
}

dimension: billed_amount {
  hidden: yes
  type: number
  sql: ${TABLE}.BILLEDAMOUNT ;;
}

dimension: coinsurance_amount {
  hidden: yes
  type: number
  sql: ${TABLE}.COINSURANCEAMOUNT ;;
}

dimension: copay_amount {
  hidden: yes
  type: number
  sql: ${TABLE}.COPAYAMOUNT ;;
}

dimension: cost_amount {
  hidden: yes
  type: number
  sql: ${TABLE}.COSTAMOUNT ;;
}

dimension: deductible_amount {
  hidden: yes
  type: number
  sql: ${TABLE}.DEDUCTIBLEAMOUNT ;;
}

dimension: paid_amount {
  hidden: yes
  type: number
  sql: ${TABLE}.PAIDAMOUNT ;;
}

dimension: denied_days_count {
  group_label: "Hospital and Professional Billing"
  type: number
  sql: ${TABLE}.DENIEDDAYSCOUNT ;;
}

dimension: exclude_discharge_indicator {
  group_label: "Indicators"
  type: yesno
  sql: ${TABLE}.EXCLUDEDISCHARGEINDICATOR ;;
}

dimension: member_uid {
  label: "Member ID"
  type: number
  value_format_name: id
  sql: ${TABLE}.MEMBERUID ;;
}

dimension: provider_uid {
  group_label: "Provider Information"
  label: "Provider ID"
  type: number
  value_format_name: id
  sql: ${TABLE}.PROVIDERUID ;;
}

dimension: rendering_provider_uid {
  group_label: "Provider Information"
  label: "Rendering Provider ID"
  type: number
  value_format_name: id
  sql: ${TABLE}.RENDERINGPROVIDERUID ;;
}

dimension: billing_provider_uid {
  group_label: "Provider Information"
  label: "Billing Provider ID"
  type: number
  value_format_name: id
  sql: ${TABLE}.BILLINGPROVIDERUID ;;
}

dimension: is_pcp_provider {
  group_label: "Indicators"
  type: yesno
  sql: ${TABLE}.PCPPROVIDERINDICATOR ;;
}

dimension: is_room_board {
  group_label: "Indicators"
  type: yesno
  sql: ${TABLE}.ROOMBOARDINDICATOR ;;
}

dimension: is_rx_provider {
  group_label: "Indicators"
  type: yesno
  sql: ${TABLE}.RXPROVIDERINDICATOR ;;
}

dimension: is_sequence_status {
  group_label: "Indicators"
  type: string
  sql: ${TABLE}.SEQUENCESTATUSINDICATOR ;;
}

dimension: is_hospitalization {
  group_label: "Indicators"
  type: yesno
  sql: ${discharge_date} is not null ;;
}

dimension: service_unit_quantity {
  type: number
  sql: ${TABLE}.SERVICEUNITQUANTITY ;;
}

dimension: source_id {
  description: "Medical Claim Submitter Source ID"
  hidden: no
  type: number
  value_format_name: id
  sql: ${TABLE}.SOURCEID ;;
}

dimension: transaction_type_code {
  type: string
  sql: ${TABLE}.TRANSACTIONTYPECODE ;;
}

dimension: ub_patient_discharge_status_code {
  label: "UB Patient Discharge Status Code"
  type: string
  sql: ${TABLE}.UBPATIENTDISCHARGESTATUSCODE ;;
}

dimension: has_payment_amount {
  group_label: "Indicators"
  type: yesno
  sql: ${paid_amount} is not null ;;
}

dimension: has_copay_amount {
  group_label: "Indicators"
  type: yesno
  sql: ${copay_amount} is not null;;
}

dimension: has_coinsurance_amount {
  group_label: "Indicators"
  type: yesno
  sql: ${coinsurance_amount} is not null ;;
}

dimension: has_deductible_amount {
  group_label: "Indicators"
  type: yesno
  sql: ${deductible_amount} is not null ;;
}

dimension: has_billed_amount {
  group_label: "Indicators"
  type: yesno
  sql: ${billed_amount} is not null ;;
}

dimension: has_allowed_amount {
  group_label: "Indicators"
  type: yesno
  sql: ${allowed_amount} is not null ;;
}

dimension: has_cost_amount {
  group_label: "Indicators"
  type: yesno
  sql: ${cost_amount} is not null ;;
}

dimension: has_paid_and_billed_amounts{
  group_label: "Indicators"
  type: yesno
  sql: ${paid_amount}*${billed_amount} is not null ;;
}

measure: total_medical_claims {
  description: "Count of Medical Claims"
  type: count_distinct
  sql: ${claim_uid} ;;
  drill_fields: [member_uid, service_date, claim_type, claim_status_code, coverage.measure_details*]
}

measure: total_claims_with_pcp {
#     view_label: " Key Metrics"
description: "Total Claims with PCP"
type: count_distinct
sql:  ${claim_uid};;
filters: {
  field: is_pcp_provider
  value: "Yes"
}
}

measure: total_hospitalization {
  type: count_distinct
  sql: ${claim_uid} ;;
  filters: {
    field: is_hospitalization
    value: "Yes"
  }
}

measure: pct_with_hospitalization {
#     view_label: " Key Metrics"
type: number
label: "Percent of Claims with Hospitalization"
sql: ${total_hospitalization}/${total_medical_claims} ;;
value_format_name: percent_2
}

measure: pct_claims_with_pcp {
#     view_label: " Key Metrics"
label: "Percent of Medical Claims with PCP"
type: number
sql: ${total_claims_with_pcp}/${total_medical_claims} ;;
value_format_name: percent_2
}

measure: total_allowed_amount {
  group_label: "Hospital and Professional Billing"
  description: "The amount the insurance company allows the provider to charge under contract with the provider for the service performed."
  type: sum
  sql: coalesce(${allowed_amount}, 0) ;;
  value_format_name: usd
}

measure: total_billed_amount {
  group_label: "Hospital and Professional Billing"
  type: sum
  sql: coalesce(${billed_amount},0) ;;
  value_format_name: usd
}

measure: total_copay_amount {
  group_label: "Hospital and Professional Billing"
  description: "The amount the member is responsible to pay for the service performed. This includes copayment and coinsurance amounts."
  type: sum
  value_format_name: usd
  sql: ${copay_amount} ;;
}

measure: total_cost_amount {
  group_label: "Hospital and Professional Billing"
  description: "The total medical service cost incurred to the healthcare system. It may be the same as Allowed Amount, depending on how each insurance company handles COB/co-insurance."
  type: sum
  value_format_name: usd
  sql: ${cost_amount} ;;
}

measure: total_paid_amount {
  group_label: "Hospital and Professional Billing"
  description: "The amount the insurance company actually paid to the provider for the claim."
  type: sum
  value_format_name: usd
  sql: coalesce(${paid_amount},0) ;;
}

measure: total_coinsurance_amount {
  group_label: "Hospital and Professional Billing"
  type: sum
  value_format_name: usd
  sql: ${coinsurance_amount} ;;
}

measure: avg_los {
  label: "Average LOS (Days)"
  type: average
  sql: ${los} ;;
}

measure: total_claims_with_payments {
  group_label: "Hospital and Professional Billing"
  description: "Claims where Paid Amount is not null"
  type: count
  filters: {
    field: has_payment_amount
    value: "Yes"
  }
}

measure: total_claims_with_billed_amount {
  group_label: "Hospital and Professional Billing"
  description: "Claims where billed amount is not null"
  type: count
  filters: {
    field: has_billed_amount
    value: "Yes"
  }
}

measure: total_claims_with_allowed_amount {
  group_label: "Hospital and Professional Billing"
  description: "Claims where Allowed amount is not null"
  type: count
  filters: {
    field: has_allowed_amount
    value: "Yes"
  }
}

measure: total_claims_with_cost_amount {
  group_label: "Hospital and Professional Billing"
  description: "Claims where Cost amount is not null"
  type: count
  filters: {
    field: has_cost_amount
    value: "Yes"
  }
}

measure: total_claims_with_copay_amount {
  group_label: "Hospital and Professional Billing"
  description: "Claims where Copay amount is not null"
  type: count
  filters: {
    field: has_copay_amount
    value: "Yes"
  }
}

measure: total_claims_with_coinsurance_amount {
  group_label: "Hospital and Professional Billing"
  description: "Claims where Coinsurance amount is not null"
  type: count
  filters: {
    field: has_coinsurance_amount
    value: "Yes"
  }
}

measure: total_claims_with_deductible_amount {
  group_label: "Hospital and Professional Billing"
  description: "Claims where Deductible amount is not null"
  type: count
  filters: {
    field: has_deductible_amount
    value: "Yes"
  }
}


measure: total_claims_with_payments_and_billed_amounts {
  group_label: "Hospital and Professional Billing"
  description: "Claims where billed and paid amounts are not null"
  type: count
  filters: {
    field: has_paid_and_billed_amounts
    value: "Yes"
  }
}


# ------------------------------------ SET DEFINITIONS -------------------------------
set: base_claim_fields {
  fields: [claim_uid
    , source_id
    , admit_date, admit_month, admit_quarter, admit_raw, admit_week, admit_year
    , service_date, service_month, service_quarter, service_raw, service_week, service_year
    , discharge_date, discharge_month, discharge_quarter, discharge_raw, discharge_week, discharge_year
    , billing_provider_uid, rendering_provider_uid, provider_uid
    , total_medical_claims
  ]
}

set: fs_claim_fields {
  fields: [ claim_status_code, ub_patient_discharge_status_code, transaction_type_code, service_unit_quantity
    ,total_allowed_amount, total_billed_amount, total_copay_amount, total_cost_amount, total_paid_amount
    , total_claims_with_payments, total_claims_with_billed_amount, total_claims_with_payments_and_billed_amounts
  ]
}

set: sel_claim_fields {
  fields: [
    service_year, coverage.line_of_business, total_medical_claims
  ]
}

set: sel_patient_fields {
  fields: [
    service_year, coverage.line_of_business, coverage.total_patients
  ]
}

}
