param(
    [Parameter(Mandatory=$true)]
    [string]$AssigneeObjectId,

    [Parameter(Mandatory=$true)]
    [string]$RoleName,

    [Parameter(Mandatory=$true)]
    [string]$Scope
)

az role assignment create `
  --assignee-object-id $AssigneeObjectId `
  --role $RoleName `
  --scope $Scope