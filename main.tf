resource "datadog_metric_tag_configuration" "metric_tag_configurations" {
  for_each = var.metric_tag_configurations

  metric_name         = each.value.metric_name
  metric_type         = each.value.metric_type
  tags                = each.value.tags
  exclude_tags_mode   = each.value.exclude_tags_mode
  include_percentiles = each.value.include_percentiles

  dynamic "aggregations" {
    for_each = each.value.aggregations != null ? each.value.aggregations : []
    content {
      space = aggregations.value.space
      time  = aggregations.value.time
    }
  }
}

