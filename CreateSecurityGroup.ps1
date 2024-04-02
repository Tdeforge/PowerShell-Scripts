# Install the Microsoft Graph PowerShell module (if not already installed)
Install-Module Microsoft.Graph

# Connect to Microsoft Graph using interactive sign-in
Connect-Graph

# Define the group name
$groupName = "Administrators"

# Create the security group
$group = New-MgGroup -DisplayName $groupName -MailEnabled $false -SecurityEnabled $true

# Get the current user's object ID
$currentUser = Get-MgMe
$userObjectId = $currentUser.Id

# Add the user to the security group
New-MgGroupMember -GroupId $group.Id -DirectoryObjectId $userObjectId

Write-Host "User added to the '$groupName' security group."

# Clean up the session (optional)
Disconnect-Graph
