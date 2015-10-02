NOTE: This setup is only tested on Mac.

### Requirements
Make sure the following are already installed on your machine.

1. Git
2. iTerm2
3. CMake
4. zsh

### Setup
1. Import Railscast color scheme located in `vim-themes` directory to your iTerm2 profile colors.
2. Change iTerm2 font to Menlo with size of 14
3. Run `./install`
4. Open `.vimrc` on `vim` and run `:VundleInstall` 
5. Compile YCM (YouCompleteMe):


```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```
