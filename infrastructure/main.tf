module "site-main" {
   source = "./site-main"

   region = "${var.region}"
   domain = "${var.subdomain}"
   bucket_name = "${var.bucket_name}"
   duplicate-content-penalty-secret = "${var.duplicate_content_penalty_secret}"
   deployer = "${vars.iam_deployer_username}"
   acm-certificate-arn = "arn:aws:acm:us-east-1:${var.account_id}:certificate/${var.acm_cert_id}"
   not-found-response-path = "/404.html"
}

module "site-redirect" {
   source = "./site-redirect"

   region = "${var.region}"
   domain = "${var.subdomain}"
   duplicate-content-penalty-secret = "${var.duplicate_content_penalty_secret}"
   deployer = "${vars.iam_deployer_username}"
   acm-certificate-arn = "arn:aws:acm:us-east-1:${var.account_id}:certificate/${var.acm_cert_id}"
}

module "dns-cname" {
   source = "./r53-cname"

   domain = "${var.subdomain}"
   target = "${module.site-main.website_cdn_hostname}"
   route53_zone_id = "${var.r53_zone_id}"
}

module "dns-alias" {
   source = "./r53-alias"

   domain = "${var.apex_domain}"
   target = "${module.site-main.website_cdn_hostname}"
   cdn_hosted_zone_id = "${module.site-main.website_cdn_zone_id}"
   route53_zone_id = "${var.r53_zone_id}"
}