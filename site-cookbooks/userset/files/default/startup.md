#startup.md
###はじめに
chefによる自動セットアップ後、ユーザにて設定する事項をまとめます。

###perlbrew
`perlbrew install-cpanm`
`perlbrew install-ack`

###vim
vim起動後にNeoBundleInstallの実行

###githubの設定
1. ~/.ssh/id_rsa.pubをgithub.comへ登録
1. `git config --global github.user Username`で.gitconfigの設定
1. ssh github で接続確認

###Dropboxの設定
必要があれば設定する

###課題
+ yum updateの実行(epel後）
+ hostnameの設定
+ selinuxのオフ設定
+ python env
+ rbenv

