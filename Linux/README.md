# 1.0 Access Linux:

```html
Syntax | ssh <username>@<ipAddress> | Access Linux instance with headless mode.
 
<Example>
Access my Linux instance | ssh ngjaawei@192.168.56.10
```

<br />

# 2.0 Linux Command Syntax

```html
Syntax | <commandName> <options> <parameters> | A command may contain an option or an parameter.
                                              | In some cases, it can still run without them.
                                              | <CommandName> | The rule that you want to perform.
                                              | <options>     | Modifies a command's operation. 
                                              |               | Use hyphens (-) or double hyphens (--) to invoke it.

Others | clear | Clear the terminal interface.

All the <fileName> can be changed to <directory> to perform file manipulation between different directory without changing the currect working directory.
```

<br />

# 3.0 Option Reference List

```html
Option | -R  | Recursive.             Lists all the files in the subdirectories.
Option | -a  | All files.             Shows hidden files in addition to the visible ones.
Option | -l  | Long listing format.   Shows Unix file types, number of hard links, permissions, group, owner, size, last modified date time and name.
Option | -lh | Long + human-readable. Shows the file sizes in easily readable formats such as MB, GB and TB.

Option | -r  | Reverse order. Reverses the sorting order.

Option | -name <fileName>  | Search file based on name.
Option | -iname <fileName> | Search file based on name (Case-Insensitive).
Option | -type f           | Search file only.
Option | -type d           | Search directory only.
```

<br />

# 4.0 Command Reference List

<br />

## 4.1 Navigating Directories

Example of Directory: 
```html
/                         | Root
    home                  | Directory: home
        ngjaawei          | Directory: home/ngjaawei
            Folder_A      | Directory: home/ngjaawei/Folder_A
                Folder_A1 | Directory: home/ngjaawei/Folder_A/Folder_A1
                Folder_A2 | Directory: home/ngjaawei/Folder_A/Folder_A2
```        

<br />

Syntax:
```html
Syntax | pwd                        | Display currect working directory.
Syntax | cd                         | Set currect working directory to user's home directory.
Syntax | cd <directory>             | Set currect working directory to certain directory.

Syntax | ls <directory>             | Display all files and directories of current directory.
Syntax | ls <option> <directory>    | "ls <directory>" that with <option>. 

Syntax | mkdir <directoryName>      | Create a new directory at current working directory.
Syntax | rmdir <emptyDirectoryName> | Delete a empty directory at current working directory.

Others | .                          | Current directory. Can use in <directory>.
Others | ..                         | Parent directory. Can use in <directory>.
Others | ~                          | User's home directory.
Others | ~<username>                | User's home directory of other user.

<Example> 
If current working directory (pwd) is "home/ngjaawei":

- Set current working directory to user's home directory                                      | cd
- Set current working directory to user's home directory                                      | cd ~
- Set current working directory to "Folder_A1"                                                | cd Folder_A/Folder_A1

- Show contents in current working directory                                                  | ls
- Show contents in "Folder_A2"                                                                | ls Folder_A/Folder_A2
             
- Show contents in "home"                                                                     | ls ..                
- Show contents in root of all directory                                                      | ls ../..
- Show contents in root of all directory at any current working directory                     | ls /

- Show list of all files in "Folder_A"                                                        | ls -R Folder_A
- Show list of all files in "Folder_A1"                                                       | ls -R Folder_A/Folder_A1
- Show contents in "Folder_A" include hidden files                                            | ls -a Folder_A
- Show contents in "Folder_A" include hidden files                                            | ls -a Folder_A/Folder_A1
- Show contents in "Folder_A" and their data such as file types...                            | ls -l Folder_A
- Show contents in "Folder_A" and their data such as file types... in easily readable formats | ls -lh Folder_A 
```

<br />

## 4.2 File Permissions

File Permissions String:
```html
A string with 10 characters.
      1st  characters is File Type.
2nd - 4th  characters is Owner Permissions.
5th - 7th  characters is Group Permissions.
8th - 10th characters is Other Permissions (Everyone Else).

<Example>
Example 1: -rw-r--r--
Example 2: drwxr-xr-x
Example 3: -rw-rw-r--
```

<br />

Syntax:
```html
File Type  | -  | Regular File.

Permission | rw | Can read and write.
Permission | r  | Can read.
Permission | w  | Can write.

User       | u  | Owner.
User       | g  | Group.
User       | o  | Other.

Syntax | chmod <user>-<permission> <fileName> | Remove a permission from user to an file in currect working directory.
Syntax | chmod <user>+<permission> <fileName> | Add a permission from user to an file in currect working directory.

<Example>
If permission string of "text.txt" is "-rw-r--r--":
- Remove write permission from owner. | chmod o-w test.txt | "-rw-r--r--" => "-r--r--r--"
- Add write permission to group.      | chmod o+w test.txt | "-r--r--r--" => "-r--rw-r--"
- Add write permission to other.      | chmod o+w test.txt | "-r--rw-r--" => "-r--rw-rw-"
```

<br />

## 4.3 Text File Manipulation

```html
Syntax | touch <fileName>                     | Create an empty file in currect working directory.
Syntax | rm <fileName>                        | Delete an file in current working directory.
Syntax | rm <option> <fileName>               | "rm <fileName>" that with <option>.                      

Syntax | echo <content> > <fileName>          | Write text to a file in currect working directory and overwrite the original text.
Syntax | echo <content> >> <fileName>         | Write text to a file in currect working directory and not overwrite the original text.
Syntax | <command> > <fileName>               | Capture command output and write into a file in currect working directory and overwrite the original text.
Syntax | <command> >> <fileName>              | Capture command output and write into a file in currect working directory and not overwrite the original text.

Syntax | cat <fileName>                       | Display contents of the file in currect working directory.
Syntax | cat <fileName> <fileName>            | Display combined output of two file in current working directory.

Syntax | mv <originalFileName> <newFileName>  | Rename an file in current working directory.
Syntax | cp <originalFileName> <copyFileName> | Copy an file in current working directory.

<Example> 
- Remove all things in "Test" directory in current working directory | rm -r Test
```

<br />

## 4.4 Search Files & Content

```html
Syntax | grep <content> <fileName>      | Search the content inside of a file in current working directory.
Syntax | find <startDirectory> <option> | Search file in start from <startDirectory> to all its subdirectories.

<Example>
- Search "subTest.txt" in all directory start from current working directory. | find . -name "subTest.txt" 
- Search txt file in all directory start from current working directory.      | find . -name ".txt"
```





