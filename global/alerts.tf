resource "aws_sns_topic" "alerts_nonprod" {
  name = "CHANGEME-alerts-nonprod"
}

resource "aws_sns_topic" "alerts_prod" {
  name = "CHANGEME-alerts-prod"
}
