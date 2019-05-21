# AppCode-vm-options
iOS AppCode IDE (JetBrains Co.) Java VM (Virtual Machine) options to maximize IDE performance

Taken from https://stackoverflow.com/questions/5651538/speedup-intellij-idea and a bit modified.

## Better RAM using

If you have a lot of not used RAM you can turn it into very handy thing as create a separate volume mapped to RAM and use it for DerivedData reference, what will give you couple benefits:

- Fast writing on disc the compiled things
- HDD/SSD disc will not spend its recources for these kind of things.

[Here you find a script that creates Volume mapped to RAM and creates simlink between RAM's DerivedData and Xcode/AppCode DerivedData.](./Map%20DerivedData%20to%20RAM/ram_disk_mapper.sh)
