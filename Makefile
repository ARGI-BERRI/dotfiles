.PHONY: install
install:
	@echo Installing dotfiles
	@cp -r .config ~/
	@cp .bashrc ~/
	@cp .bash_profile ~/