# Access Linux:

ssh <username>@<ipAddress>
Example : ssh ngjaawei@192.168.56.10


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

Navigating Directory: 
```html
pwd            | Display currect working directory.

--------------------------------------------------------------------------------------------------------

ls <directory> | Display content of current directory.
".." (Double Dot) mean one level upper than current directory.

If current working directory (pwd) is "home/ngjaawei", show:

- Contents in current working directory                                                  | ls
- Contents in "Folder_A2"                                                                | ls Folder_A/Folder_A2
             
- Contents in "home"                                                                     | ls ..                
- Contents in root of all directory                                                      | ls ../..
- Contents in root of all directory at any current working directory                     | ls /

- List of all files in "Folder_A"                                                        | ls -R Folder_A
- List of all files in "Folder_A1"                                                       | ls -R Folder_A/Folder_A1

- Contents in "Folder_A" include hidden files                                            | ls -a Folder_A
- Contents in "Folder_A" include hidden files                                            | ls -a Folder_A/Folder_A1

- Contents in "Folder_A" and their data such as file types...                            | ls -l Folder_A
- Contents in "Folder_A" and their data such as file types... in easily readable formats | ls -lh Folder_A 
--------------------------------------------------------------------------------------------------------


```
