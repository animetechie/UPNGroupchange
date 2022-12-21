# UPNGroupchange
A Powershell script that creates a a group inside of a OU, copies users to that OU and then changes their UPN Suffix
This script uses the ActiveDirectory module to perform the following actions:

Import the ActiveDirectory module.
Set the name of the OU and group.
Create the group in the OU using the New-ADGroup cmdlet.
Get the users in the OU using the Get-ADUser cmdlet.
Add the users to the group using the Add-ADGroupMember cmdlet.
Change the UPN suffix for each user using the Set-ADUser cmdlet and add them to an array of changed users.
Remove the users from the group using the Remove-ADGroupMember cmdlet.
Export the array of changed users to a CSV file using the Export-Csv cmdlet.
