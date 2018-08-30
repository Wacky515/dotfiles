# cd ~/Download
# curl -fsSL https://github.com/miiton/Cica/releases/download/v2.1.0/Cica_v2.1.0.zip
# ＃ mktemp && cd $_
# unzip Cica_v2.1.0.1.zip
# # フォントをインストール

$ wget https://github.com/miiton/Cica/releases/download/v2.1.0/Cica_v2.1.0.zip
$ unzip Cica_v2.1.0.zip
$ mkdir -p ~/.fonts
$ mv Cica-*.ttf ~/.fonts/.
$ sudo fc-cache -fv
$ rm -f Cica_v2.1.0.zip
