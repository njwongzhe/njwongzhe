# Access Linux:

```html
Syntax | ssh <username>@<ipAddress> | Access Linux instance with headless mode.
 
<Example>
Access my Linux instance | ssh ngjaawei@192.168.56.10
```

# Linux Command Syntax

```html
Syntax | <commandName> <options> <parameters> | A command may contain an option or an parameter.
                                              | In some cases, it can still run without them.
                                              | <CommandName> | The rule that you want to perform.
                                              | <options>     | Modifies a command's operation. 
                                              |               | Use hyphens (-) or double hyphens (--) to invoke it.
```

# Navigating Directories

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

```html
Syntax | pwd                        | Display currect working directory.
Syntax | cd                         | Set currect working directory to one level upper than current directory.
Syntax | cd <directory>             | Set currect working directory to certain directory.

Syntax | ls <directory>             | Display content of current directory.
Syntax | ls <option> <directory>    | "ls <directory>" that with option. 
Option | -R                         | Lists all the files in the subdirectories
Option | -a                         | Shows hidden files in addition to the visible ones.
Option | -l                         | Shows Unix file types, number of hard links, permissions, group, owner, size, last modified date time and name.
Option | -lh                        | Shows the file sizes in easily readable formats such as MB, GB and TB.

Syntax | mkdir <directoryName>      | Create a new directory at current working directory.
Syntax | rmdir <emptyDirectoryName> | Delete empty directory at current working directory.

Others | ..                         | Double Dot mean one level upper than current directory. Can use in <directory>.
Others | ~                          | User's home directory.
Others | ~<username>                | User's home directory of other user.

<Example> 
If current working directory (pwd) is "home/ngjaawei":

- Set current working directory to "home"                                                     | cd
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

# File Permissions

```html

```

# Text File Manipulation

```html
Syntax | touch <fileName>                     | Create an empty file in currect working directory.
Syntax | echo <content> > <fileName>          | Write text to a file in currect working directory and overwrite the original text.
Syntax | echo <content> >> <fileName>         | Write text to a file in currect working directory and not overwrite the original text.
Syntax | <command> > <fileName>               | Capture command output and write into a file in currect working directory and overwrite the original text.
Syntax | <command> >> <fileName>              | Capture command output and write into a file in currect working directory and not overwrite the original text.
Syntax | cat <fileName>                       | View contents of the file in currect working directory.
Syntax | cat <fileName> <fileName>            | Display combined outout of two file in current working directory.
Syntax | mv <originalFileName> <newFileName>  | Rename an file in current working directory.
Syntax | cp <originalFileName> <copyFileName> | Copy an file in current working directory.

All the <fileName> can be changed to <directory> to perform file manipulation between different directory without changing the currect working directory.
```
