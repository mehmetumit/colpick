DEST_DIR ?= /usr/bin

all:
	@echo Run \'make install\' to install colpick

install:
	@cp colpick $(DEST_DIR)/colpick
	@chmod 755 $(DEST_DIR)/colpick
	@echo colpick has been installed

uninstall:
	@rm -rf $(DEST_DIR)/colpick
	@echo colpick has been uninstalled

