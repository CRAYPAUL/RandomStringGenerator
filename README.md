# RandomStringGenerator.ps1
PowerShell script that creates, outputs a randomized string. Helps with quickly generating random passwords.

The random string generated can have a potential length of 20-40 characters. To determine length, the script selects 4-10 characters from 4 sets of symbols (uppercase, lowercase, single digits, other symbols) until the total sum is at least 20 characters.
