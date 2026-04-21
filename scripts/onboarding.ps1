param(
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName,

    [Parameter(Mandatory=$true)]
    [ValidateSet("HR","Finance","ITSupport","CloudAdmins")]
    [string]$Department
)

$groupMap = @{
    "HR"          = "HR-Team"
    "Finance"     = "Finance-Team"
    "ITSupport"   = "IT-Support"
    "CloudAdmins" = "Cloud-Admins"
}

$targetGroup = $groupMap[$Department]

Write-Host "Starting onboarding for $UserPrincipalName"
Write-Host "Target group: $targetGroup"

# Example logic only
# In a real tenant, use Microsoft Graph PowerShell commands to:
# 1. Find user object ID
# 2. Find group object ID
# 3. Add membership

Write-Host "User would be added to $targetGroup"
Write-Host "Onboarding complete"