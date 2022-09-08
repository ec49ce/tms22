on windows 10
create files in folder c:\Users\<username>\.ssh\
	.bash_profile
	.bashrc
	config

add to config file init lines:
Host github.com
 Hostname github.com
 IdentityFile ~/.ssh/<private-file-key> 

https://proglib.io/p/git-cheatsheet

https://habr.com/ru/company/ruvds/blog/599929/
