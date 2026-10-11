output "metric_tag_configurations_id" {
  description = "Map of id values across all metric_tag_configurations, keyed the same as var.metric_tag_configurations except keys with no id are omitted"
  value       = { for k, v in datadog_metric_tag_configuration.metric_tag_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "metric_tag_configurations_aggregations" {
  description = "Map of aggregations values across all metric_tag_configurations, keyed the same as var.metric_tag_configurations except keys with no aggregations are omitted"
  value       = { for k, v in datadog_metric_tag_configuration.metric_tag_configurations : k => v.aggregations if v.aggregations != null && length(v.aggregations) > 0 }
}
output "metric_tag_configurations_exclude_tags_mode" {
  description = "Map of exclude_tags_mode values across all metric_tag_configurations, keyed the same as var.metric_tag_configurations except keys with no exclude_tags_mode are omitted"
  value       = { for k, v in datadog_metric_tag_configuration.metric_tag_configurations : k => v.exclude_tags_mode if v.exclude_tags_mode != null }
}
output "metric_tag_configurations_include_percentiles" {
  description = "Map of include_percentiles values across all metric_tag_configurations, keyed the same as var.metric_tag_configurations except keys with no include_percentiles are omitted"
  value       = { for k, v in datadog_metric_tag_configuration.metric_tag_configurations : k => v.include_percentiles if v.include_percentiles != null }
}
output "metric_tag_configurations_metric_name" {
  description = "Map of metric_name values across all metric_tag_configurations, keyed the same as var.metric_tag_configurations except keys with no metric_name are omitted"
  value       = { for k, v in datadog_metric_tag_configuration.metric_tag_configurations : k => v.metric_name if v.metric_name != null && length(v.metric_name) > 0 }
}
output "metric_tag_configurations_metric_type" {
  description = "Map of metric_type values across all metric_tag_configurations, keyed the same as var.metric_tag_configurations except keys with no metric_type are omitted"
  value       = { for k, v in datadog_metric_tag_configuration.metric_tag_configurations : k => v.metric_type if v.metric_type != null && length(v.metric_type) > 0 }
}
output "metric_tag_configurations_tags" {
  description = "Map of tags values across all metric_tag_configurations, keyed the same as var.metric_tag_configurations except keys with no tags are omitted"
  value       = { for k, v in datadog_metric_tag_configuration.metric_tag_configurations : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

