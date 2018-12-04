rule puk {
meta:
  description = "Yara rule for puk file"
  author = "Yoroi - ZLab"
  last_updated = "2018-11-21"
  tlp = "white"
  category = "informational"
strings:
$a = { A5 66 A5 8D 95 DC FE FF FF 52 8D 85 B4 FE FF FF } 
$b = { 2B 8D 18 FF FF FF 2B 4D }
condition:
all of them
}
