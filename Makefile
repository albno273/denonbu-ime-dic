#
# このファイルは MITライセンスです。詳細はGithub上のリポジトリを参照してください。
# https://github.com/Umichang/nijisanji-ime-dic
#
# Microsoft IME形式の dic.txt からmacOS向けの dic.plist とGboard向けの dic.zip を生成します。
# 実行にはiconv、Rubyの実行環境と userdic-ng 1.0 以降が必要です。
# https://github.com/Umichang/userdic-ng
#

SOURCE = characters.txt	songs.txt world.txt
TARGET = characters.plist characters.zip songs.plist songs.zip world.zip world.plist

.SUFFIXES: .txt .plist .zip

all: ${TARGET}

.txt.plist:
	userdic-ng msime apple < $< > $@

.txt.zip:
	iconv -f UTF-16LE -t UTF-8 < $< > dictionary.txt; zip -u $@ dictionary.txt ; rm dictionary.txt

clean:
	rm ${TARGET}