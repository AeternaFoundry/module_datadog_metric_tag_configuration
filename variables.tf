variable "metric_tag_configurations" {
  description = <<EOT
Map of metric_tag_configurations, attributes below
Required:
    - metric_name
    - metric_type
    - tags
Optional:
    - exclude_tags_mode
    - include_percentiles
    - aggregations (block):
        - space (required)
        - time (required)
EOT

  type = map(object({
    metric_name         = string
    metric_type         = string
    tags                = set(string)
    exclude_tags_mode   = optional(bool)
    include_percentiles = optional(bool)
    aggregations = optional(list(object({
      space = string
      time  = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.metric_tag_configurations : (
        (can(regex("^[A-Za-z][A-Za-z0-9\\.\\_]*$", v.metric_name))) && (length(v.metric_name) >= 1 && length(v.metric_name) <= 200)
      )
    ])
    error_message = "all of: metric name must be valid; must be between 1 and 200 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.metric_tag_configurations : (
        alltrue([for x in v.tags : (can(regex("^[A-Za-z][A-Za-z0-9\\.\\-\\_:\\/]*$", x))) && (length(x) >= 1 && length(x) <= 200)])
      )
    ])
    error_message = "all of: tags must be valid; must be between 1 and 200 characters"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

