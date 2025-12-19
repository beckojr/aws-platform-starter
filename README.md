# AWS Platform Engineering Starter Kit

A production-ready template for building Internal Developer Platforms on AWS.

## 🎯 What is this?

This starter kit provides everything you need to bootstrap a Platform Engineering practice on AWS:

- Multi-account AWS Organization setup
- Self-service infrastructure via AWS Service Catalog
- Security guardrails with AWS Config
- Cost controls and observability
- GitOps workflows

## 🏗️ Architecture

[Architecture diagram - TO ADD]

### Components

1. **Multi-Account Foundation** (Control Tower + Organizations)
2. **Network Hub-and-Spoke** (Transit Gateway + VPC)
3. **Service Catalog** (Golden path templates)
4. **Guardrails** (Config rules + auto-remediation)
5. **Observability** (CloudWatch + X-Ray)

## 🚀 Quick Start

_Coming soon - Deploy in under 1 hour_

## 📋 Prerequisites

- AWS Account with Organization access
- OpenTofu >= 1.11
- AWS CLI configured

## 🛠️ Service Catalog Templates

### 1. Three-Tier Web Application

- Application Load Balancer
- ECS Fargate
- RDS PostgreSQL
- Automated backups, monitoring, alerts

### 2. Serverless API

- API Gateway
- Lambda functions
- DynamoDB
- X-Ray tracing

### 3. Static Website

- S3 + CloudFront
- ACM certificate
- Route53 DNS

## 🔒 Security & Compliance

- Encryption at rest (all resources)
- Least privilege IAM
- No public access by default
- Compliance checks with AWS Config
- Automated remediation

## 💰 Cost Management

- Mandatory tagging
- Budget alerts
- Cost anomaly detection
- Rightsizing recommendations

## 📚 Documentation

See [docs/](./docs) for:

- Architecture decisions
- Deployment guide
- Troubleshooting
- Best practices

## 🎥 Demo

[Demo video - TO ADD]

## 🤝 Contributing

This is a learning project, but contributions welcome!

## 📝 License

MIT

## 👤 Author

**Becko Junior Camara**

- Website: [beckojr.github.io](https://beckojr.github.io)
- LinkedIn: [Linkedin](https://www.linkedin.com/in/becko-junior-camara-227892ab/)
- Blog: [My Blog](https://beckojr.github.io)

---

_Built with ☕ and Terraform_
