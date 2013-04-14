#Markdownチートシート
##これはH2
###これはH3
####これはH4
#####これはH5
######これはH6

###コード挿入

####ブロックで挿入
```javascript:vm2.json
{
    "run_list":[
        "userset",
        "yum::epel",
        "git",
        "zsh",
        "perlbrew",
        "patch",
        "tmux",
        "vim",
        "man",
        "yum-utils"
    ]
}
```

####oneliner挿入
`knife cookbook create hogehoge -o site-cookbook`とするとレシピのひな形が作れるよ。

