$Users = import-Csv "users.csv"
foreach ($user in $users) {
	$user.name
	$account = get-AdUser -Identity $user.name | set-aduser -office $user.office -department $user.department -manager "$user.manager" -title "$user.title"
	#$account | move-AdObject -TargetPath "CN=$account.name,OU=Employees,DC=domain,DC=com"
}