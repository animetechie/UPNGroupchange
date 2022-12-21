# Import the ActiveDirectory module
Import-Module ActiveDirectory

# Set the name of the OU and the group
$ouName = "OU=Users,DC=contoso,DC=com"
$groupName = "My Group"

# Set the new UPN suffix
$newUPNSuffix = "contoso.com"

# Create the group in the OU
New-ADGroup -Name $groupName -Path $ouName

# Get the users in the OU
$users = Get-ADUser -SearchBase $ouName -Filter *

# Add the users to the group
Add-ADGroupMember -Identity $groupName -Members $users

# Change the UPN suffix for each user
$changedUsers = @()
foreach ($user in $users) {
  Set-ADUser -Identity $user -UserPrincipalName $user.UserPrincipalName -UPNSuffix $newUPNSuffix
  $changedUsers += $user
}

# Remove the users from the group
Remove-ADGroupMember -Identity $groupName -Members $users

# Create a CSV file with the list of changed users
$changedUsers | Export-Csv -Path "Changed Users.csv" -NoTypeInformation
