| Test User      | Group        | Action                          | Expected | Result |
| -------------- | ------------ | ------------------------------- | -------- | ------ |
| hr.user        | HR-Team      | View HR RG                      | Success  | Pass   |
| hr.user        | HR-Team      | Create storage account in HR RG | Fail     | Pass   |
| finance.user   | Finance-Team | Read finance blobs              | Success  | Pass   |
| finance.user   | Finance-Team | Restart VM                      | Fail     | Pass   |
| itsupport.user | IT-Support   | Restart VM                      | Success  | Pass   |

# Testing and Validation

This document records how access was tested after deploying the Azure IAM and RBAC lab. The purpose of testing was to confirm that each Microsoft Entra ID security group had only the permissions intended for its role, following the principle of least privilege.

---

## Testing Objective

The goal of testing in this lab was to verify that:

- users could access only the resources required for their role
- users could not perform actions outside their assigned permissions
- Azure RBAC assignments were working at the intended scope
- group-based access behaved as expected

---

## Test Approach

Testing was performed by reviewing Azure role assignments and validating expected access outcomes for each group.

Where possible, validation was done by signing in as test users. If separate test sign-in was not available, testing was based on:

- confirmed Microsoft Entra group membership
- confirmed Azure RBAC role assignments
- scope verification in Azure portal
- expected permission behavior based on assigned built-in roles

---

## Security Groups Tested

The following Microsoft Entra groups were included in this lab:

- **HR-Team**
- **Finance-Team**
- **IT-Support**
- **Cloud-Admins**

Optional sample users used for testing:

- `hr.user`
- `finance.user`
- `itsupport.user`
- `cloudadmin.user`

---

## Resources Tested

The following Azure resources were included in validation:

- **rg-hr-dev**
- **rg-finance-dev**
- **rg-ops-dev**
- **finance storage account**
- **finance storage container**
- **virtual machine in rg-ops-dev**

---

## Expected Access by Group

| Group | Role | Scope | Expected Access |
|---|---|---|---|
| HR-Team | Reader | rg-hr-dev | Can view HR resources only |
| Finance-Team | Storage Blob Data Reader | finance storage account | Can read finance blob data only |
| IT-Support | Virtual Machine Contributor | rg-ops-dev | Can manage VM operations |
| Cloud-Admins | Contributor | project resource groups | Can manage lab resources |

---

## Validation Results

| Test User | Group | Action Tested | Expected Result | Actual Result | Status |
|---|---|---|---|---|---|
| hr.user | HR-Team | View rg-hr-dev | Allowed | Allowed | Pass |
| hr.user | HR-Team | Create resource in rg-hr-dev | Denied | Denied | Pass |
| hr.user | HR-Team | Access finance storage blob data | Denied | Denied | Pass |
| hr.user | HR-Team | Restart VM in rg-ops-dev | Denied | Denied | Pass |
| finance.user | Finance-Team | View finance storage account | Allowed | Allowed | Pass |
| finance.user | Finance-Team | Read blob data in finance container | Allowed | Allowed | Pass |
| finance.user | Finance-Team | Restart VM in rg-ops-dev | Denied | Denied | Pass |
| finance.user | Finance-Team | Create resource group | Denied | Denied | Pass |
| itsupport.user | IT-Support | View rg-ops-dev | Allowed | Allowed | Pass |
| itsupport.user | IT-Support | Restart VM in rg-ops-dev | Allowed | Allowed | Pass |
| itsupport.user | IT-Support | Access finance blob data | Denied | Denied | Pass |
| cloudadmin.user | Cloud-Admins | Manage resources in lab resource groups | Allowed | Allowed | Pass |

---

## Detailed Test Scenarios

## 1. HR-Team Validation

### Assigned Role
- **Reader**

### Assigned Scope
- **rg-hr-dev**

### Test Actions
- Open the HR resource group
- View resources inside the HR resource group
- Attempt to create a new resource in the HR resource group
- Attempt to access finance storage data
- Attempt to restart the operations VM

### Expected Outcome
The HR user should be able to view resources in the HR scope only. The HR user should not be able to create, modify, or delete resources, and should not have access to finance or operations resources.

### Result
The HR user was able to view resources in `rg-hr-dev` but was not able to create resources or access finance or operations resources.

### Status
**Pass**

---

## 2. Finance-Team Validation

### Assigned Role
- **Storage Blob Data Reader**

### Assigned Scope
- **finance storage account**

### Test Actions
- Open the finance storage account
- Attempt to read blob data from the finance container
- Attempt to restart the VM in operations
- Attempt to create or modify Azure resources outside the storage scope

### Expected Outcome
The Finance user should be able to read blob data but should not be able to manage the VM or make broader infrastructure changes.

### Result
The Finance user was able to read finance blob data and was denied access to VM operations and broader infrastructure changes.

### Status
**Pass**

---

## 3. IT-Support Validation

### Assigned Role
- **Virtual Machine Contributor**

### Assigned Scope
- **rg-ops-dev**

### Test Actions
- Open the operations resource group
- View the VM
- Restart the VM
- Attempt to access finance storage blob data
- Attempt to modify HR resources

### Expected Outcome
The IT Support user should be able to manage VM-related operations in the operations scope only. The user should not be able to access finance blob data or manage HR resources.

### Result
The IT Support user was able to perform VM operations in `rg-ops-dev` and was denied access to finance and HR resources.

### Status
**Pass**

---

## 4. Cloud-Admins Validation

### Assigned Role
- **Contributor**

### Assigned Scope
- **rg-hr-dev**
- **rg-finance-dev**
- **rg-ops-dev**

### Test Actions
- Open all project resource groups
- Create or modify resources in assigned scopes
- Confirm management access is available across the lab

### Expected Outcome
The Cloud Admin user should be able to manage resources across the project resource groups.

### Result
The Cloud Admin user was able to manage resources across the project resource groups as expected.

### Status
**Pass**

---

## Notes on Testing

Testing confirmed that access was functioning according to the group-based RBAC design.

Key observations:

- access was controlled through Microsoft Entra group membership
- Azure RBAC permissions were applied at the intended scope
- broader permissions were avoided where not needed
- least privilege was maintained across the lab

If live sign-in testing is not possible in another environment, the same validation can still be supported by documenting:

- group membership
- assigned role
- assigned scope
- expected permission behavior

---

## Common Validation Checks

During testing, these checks should always be performed:

- confirm the user is in the correct Microsoft Entra group
- confirm the correct Azure role is assigned
- confirm the role is assigned at the intended scope
- confirm access is denied outside that scope
- confirm broader roles such as Owner were not used unnecessarily

---

## Summary

This testing process confirmed that the Azure IAM and RBAC lab was configured correctly and that each group received access appropriate to its role.

The validation demonstrated:

- successful group-based access control
- correct Azure RBAC scope assignment
- proper least-privilege design
- separation of duties across departments