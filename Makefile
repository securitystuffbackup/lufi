EXTRACTFILES=utilities/locales_files.txt
EN=themes/default/lib/Lufi/I18N/en.po
FR=themes/default/lib/Lufi/I18N/fr.po
XGETTEXT=carton exec local/bin/xgettext.pl
CARTON=carton exec
REAL_LUFI=script/application
LUFI=script/lufi

locales:
	$(XGETTEXT) -f $(EXTRACTFILES) -o $(EN)
	$(XGETTEXT) -f $(EXTRACTFILES) -o $(FR)

test:
	$(CARTON) $(REAL_LUFI) test

clean:
	rm -rf lufi.db files/
dev: clean
	$(CARTON) morbo $(LUFI) --listen http://0.0.0.0:3000 --watch lib/ --watch script/ --watch themes/

devlog:
	multitail log/development.log

prod:
	$(CARTON) hypnotoad $(LUFI)
