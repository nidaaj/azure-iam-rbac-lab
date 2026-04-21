param(
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName
)

Write-Host "Starting offboarding for $UserPrincipalName"

# Example logic only:
# 1. Identify all relevant access groups
# 2. Remove user from groups
# 3. Document action

$groups = @("HR-Team","Finance-Team","IT-Support","Cloud-Admins")

foreach ($group in $groups) {
    Write-Host "Checking membership in $group"
    Write-Host "If member, remove $UserPrincipalName from $group"
}

Write-Host "Offboarding complete"