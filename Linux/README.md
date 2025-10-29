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

If current working directory is "home/ngjaawei":
- Check the contents in current working directory : ls
- Check the contents in "Folder_A2"               : ls Folder_A/Folder_A2

".." (Double Dot) mean one level upper than current directory.
- Check the contents in "home"                                                 : ls ..                
- Check the contents in root of all directory                                  : ls ../..
- Check the contents in root of all directory at any current working directory : ls /
```
