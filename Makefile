
PYTHON_SHARED=$(DESTDIR)/usr/share/pyshared/
BINDIR=$(DESTDIR)/usr/bin

all:

install:
	rm -Rf dist _tmp
	./setup.py bdist --format=tar
	mkdir -p $(PYTHON_SHARED) _tmp
	( cd _tmp && tar -xf ../dist/*.tar )
	mv _tmp/usr/local/openerp $(PYTHON_SHARED)
	mv _tmp/usr/local/localedata $(PYTHON_SHARED)/openerp
	mv _tmp/usr/local/bin $(BINDIR)

clean:
	rm -Rf _tmp dist

.PHONY:	all install clean
