# Azure IAM & RBAC Lab

This project demonstrates secure identity and access management in Azure using Microsoft Entra ID security groups and Azure RBAC. The lab uses group-based role assignments, least-privilege design, and validation testing across Azure resource groups, a storage account, and a virtual machine.

## Objectives
- Build a small Azure lab environment with Terraform
- Implement group-based Azure RBAC
- Apply least-privilege access at the correct scope
- Demonstrate onboarding/offboarding workflow with PowerShell
- Validate access with real test scenarios
- Document architecture, testing, and troubleshooting

## Architecture
See `architecture/iam-rbac-diagram.png`

## Project Structure
- `terraform/` Infrastructure deployment
- `scripts/` Onboarding, offboarding, and RBAC helper scripts
- `docs/` Project documentation
- `screenshots/` Visual proof of setup and testing

## Azure Resources
- Resource groups for HR, Finance, and Operations
- Storage account for finance data
- Virtual network and subnet
- Virtual machine for operations support
- Optional Log Analytics workspace

## Access Model

| Group | Role | Scope | Purpose |
|---|---|---|---|
| HR-Team | Reader | rg-hr-dev | View HR resources |
| Finance-Team | Storage Blob Data Reader | Finance storage account | Read finance blob data only |
| IT-Support | Virtual Machine Contributor | rg-ops-dev | Manage VM operations |
| Cloud-Admins | Contributor | Project resource groups | Manage lab resources |

## Key Concepts Demonstrated
- Authentication vs authorization
- Microsoft Entra groups for access management
- Azure RBAC role assignments
- Scope and inheritance
- Least privilege
- Group-based access instead of direct user assignment

## Deployment Steps
1. Sign in to Azure
2. Deploy infrastructure with Terraform
3. Create Microsoft Entra security groups
4. Assign Azure roles at the correct scope
5. Validate access using test users
6. Capture screenshots and document outcomes

## Testing
See `docs/testing-and-validation.md`

## Troubleshooting
See `docs/troubleshooting.md`

## Skills Demonstrated
- Azure RBAC
- Microsoft Entra ID
- Terraform
- Azure IAM design
- PowerShell scripting
- Access validation and documentation