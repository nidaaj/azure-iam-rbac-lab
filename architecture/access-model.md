# Access Model

This project uses **group-based access control** with **Microsoft Entra ID security groups** and **Azure RBAC** to manage access to Azure resources.

Users → Entra Groups → Azure Roles → Azure Resources

Instead of assigning Azure roles directly to individual users, users are added to security groups based on their job function. Azure roles are then assigned to those groups at the correct scope. This makes access easier to manage, easier to audit, and more consistent for onboarding and offboarding.

---

## Identity Layer

The identity layer is handled through **Microsoft Entra ID**.

Users are placed into security groups based on department or responsibility.

### Security Groups Used

- **HR-Team**
- **Finance-Team**
- **IT-Support**
- **Cloud-Admins**

---

## Authorization Layer

The authorization layer is handled through **Azure Role-Based Access Control (RBAC)**.

Each security group is assigned a built-in Azure role at a specific scope.

---

## Access Assignments

| Group | Role | Scope | Purpose |
|---|---|---|---|
| HR-Team | Reader | rg-hr-dev | Allows HR users to view HR resources without making changes |
| Finance-Team | Storage Blob Data Reader | finance storage account | Allows Finance users to read blob data only |
| IT-Support | Virtual Machine Contributor | rg-ops-dev | Allows IT Support to manage virtual machine operations |
| Cloud-Admins | Contributor | rg-hr-dev, rg-finance-dev, rg-ops-dev | Allows Cloud Admins to manage lab resources |

---

## Scope Design

This project uses **narrower scopes** to support **least privilege**.

### Scope choices in this lab

- **HR-Team** receives access only to the **HR resource group**
- **Finance-Team** receives access only to the **finance storage account**
- **IT-Support** receives access only to the **operations resource group**
- **Cloud-Admins** receive broader access across the project resource groups

This prevents users from receiving unnecessary permissions outside their job responsibilities.

---

## Why Group-Based Access Is Better

Using groups instead of direct role assignments to users improves access management.

### Benefits

- easier onboarding
- easier offboarding
- more consistent role assignment
- reduced manual errors
- simpler auditing
- supports scaling access management as teams grow

For example, when a new Finance employee joins, they can be added to the **Finance-Team** group and automatically receive the correct access instead of being assigned permissions one by one.

---

## Authentication vs Authorization

This project also demonstrates the difference between **authentication** and **authorization**.

### Authentication
Authentication answers:

**Who is the user?**

Microsoft Entra ID handles authentication by verifying the user identity.

### Authorization
Authorization answers:

**What is the user allowed to do?**

Azure RBAC handles authorization by determining which actions the user can perform on Azure resources.

In this lab:

- Entra ID identifies the user and group membership
- Azure RBAC determines what access that group has to Azure resources

---

## Least Privilege Approach

This project follows the **principle of least privilege**, meaning users receive only the minimum permissions needed for their job.

### Examples

- HR users only need to **view** HR resources, so they receive **Reader**
- Finance users only need to **read blob data**, so they receive **Storage Blob Data Reader**
- IT Support needs to manage VM operations, so they receive **Virtual Machine Contributor**
- Cloud Admins need to manage infrastructure, so they receive **Contributor**

Broader roles such as **Owner** are intentionally avoided because they grant unnecessary permissions for this lab.

---

## Example User-to-Access Flow

### HR Example
`hr.user` → `HR-Team` → `Reader` → `rg-hr-dev`

### Finance Example
`finance.user` → `Finance-Team` → `Storage Blob Data Reader` → finance storage account

### IT Support Example
`itsupport.user` → `IT-Support` → `Virtual Machine Contributor` → `rg-ops-dev`

### Cloud Admin Example
`cloudadmin.user` → `Cloud-Admins` → `Contributor` → project resource groups

---

## Summary

This access model demonstrates how Azure access can be managed in a structured and secure way using:

- Microsoft Entra ID security groups
- Azure RBAC built-in roles
- scope-based role assignments
- least privilege
- group-based access control

This design improves security, consistency, and operational efficiency while making the environment easier to manage and document.