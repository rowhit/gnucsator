GNUCAP_CONF = $(shell which gnucap-conf$(SUFFIX))

include Make2

ifneq ($(GNUCAP_CONF),)
    $(info asking $(GNUCAP_CONF))
    CXX = $(shell $(GNUCAP_CONF) --cxx)
    GNUCAP_CPPFLAGS = $(shell $(GNUCAP_CONF) --cppflags) -DADD_VERSION
    GNUCAP_CXXFLAGS = $(shell $(GNUCAP_CONF) --cxxflags)
	 GNUCAP_PKGLIBDIR = $(shell $(GNUCAP_CONF) --pkglibdir)
	 GNUCAP_EXECPREFIX=$(shell $(GNUCAP_CONF) --exec-prefix)
	 GNUCSATOR_PKGLIBDIR=${GNUCAP_PKGLIBDIR}/qucs
else
    $(error no gnucap-conf, this will not work)
endif

ifneq ($(PREFIX),)
    $(info prefix is ${PREFIX}. overriding some)
	 GNUCAP_LIBDIR = ${PREFIX}/lib
	 GNUCAP_EXECPREFIX = ${PREFIX}
	 GNUCSATOR_PKGLIBDIR = ${GNUCAP_LIBDIR}/gnucap/qucs
endif

GNUCAP_CXXFLAGS+= -fPIC -shared -Wall

# QUCS_DEVS = opamp cccs
QUCS_DEVS_SO = $(QUCS_DEVS:%=d_qucs_%.so)

# LDLIBS =

QUCS_PLUGINS = \
	$(QUCS_DEVS_SO) \
	lang_qucs.so \
	c_hide.so \
	c_qucslib.so \
	d_eqn.so \
	d_probe.so \
	functions.so \
	bm_value.so \
	bm_trivial.so \
	bm_wrapper.so \
	cmd_wrapper.so \
	s_sparam.so

CLEANFILES = $(QUCS_PLUGINS) *.o *~ gnucsator.sh

all: $(QUCS_PLUGINS) gnucsator.sh

lang_qucs.so: l_qucs.h
cmd_wrapper.so: l_qucs.h

dbg:
	echo $(QUCS_DEVS_SO)

$(QUCS_DEVS_SO): d_qucs_%.so: qucs_wrapper.cc
	$(CXX) -std=c++11 $(CXXFLAGS) $(GNUCAP_CXXFLAGS) -DQUCS_DEVICE=$* \
		$(CPPFLAGS) $(QUCS_CPPFLAGS) $(GNUCAP_CPPFLAGS) -o $@ \
		$< $(QUCS_LDFLAGS) $(QUCS_LIBS) \
	$(LDLIBS)

%.so : %.cc
	$(CXX) $(CXXFLAGS) $(GNUCAP_CXXFLAGS) $(CPPFLAGS) $(GNUCAP_CPPFLAGS) -o $@ $< $(LDLIBS)

s_sparam.so: LDLIBS=-lgsl -lblas

d_eqn.so: CXXFLAGS+=-std=c++11
cmd_wrapper.so: CXXFLAGS+=-std=c++11

QUCS_INCLUDEDIR = $(QUCS_PREFIX)/include
QUCS_CPPFLAGS = -I$(QUCS_INCLUDEDIR) -I$(QUCS_INCLUDEDIR)/qucs-core
QUCS_LDFLAGS = -L$(QUCS_PREFIX)/lib
QUCS_LIBS = -lqucs

# hmm, here?
PKGINCLUDEDIR=${GNUCSATOR_PKGLIBDIR}

install: $(QUCS_PLUGINS) gnucsator.sh
	install -d $(GNUCSATOR_PKGLIBDIR)
	install $(QUCS_PLUGINS) $(GNUCSATOR_PKGLIBDIR)
	install gnucsator.sh $(GNUCAP_EXECPREFIX)/bin
	${MAKE} -C include PKGINCLUDEDIR=${PKGINCLUDEDIR}

uninstall:
	(cd $(GNUCAP_LIBDIR)/qucs ; rm $(QUCS_PLUGINS))

clean :
	rm -f $(CLEANFILES)

distclean: clean
	rm Make.override

define NOTICE
#THIS FILE IS AUTOMATICALLY GENERATED
endef

gnucsator.sh: gnucsator.sh.in Makefile
	sed -e 's/@SUFFIX@/$(SUFFIX)/' \
	    -e 's#@GNUCAP_LIBDIR@#$(GNUCAP_LIBDIR)#' \
	    -e 's#@GNUCAP_PKGLIBDIR@#$(GNUCAP_PKGLIBDIR)#' \
	    -e 's#@GNUCSATOR_PKGLIBDIR@#$(GNUCSATOR_PKGLIBDIR)#' \
	    -e 's#@INCLUDEDIR@#$(PKGINCLUDEDIR)#' \
	    -e 's/@NOTICE@/$(NOTICE)/' < $< > $@
	chmod +x $@

Make2:
	[ -e $@ ] || echo "# here you may override settings" > $@

check: all
	$(MAKE) -C tests check GNUCAP_PLUGPATH=${GNUCAP_PKGLIBDIR}
