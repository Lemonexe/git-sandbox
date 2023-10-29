# How to setup git in win10 cmd

Simple and effective 🙂

1. [Install git for win10](https://git-scm.com/download/win), add to path, gracefully ignore git bash
2. open cmd, run:
```
ssh-keygen
```
4. open [github.com settings](https://github.com/settings/keys), add the generated `.pub` file both as authentication & signing key
5. restart cmd, run:
```
git config --global user.name "Jiri Zbytovsky"
git config --global user.email zbytek@gmail.com
git config --global user.signingkey c:\Users\Jiri\.ssh\id_rsa.pub
git config --global commit.gpgsign true
git config --global gpg.format ssh
```
5. try it 🚀

Run `start-ssh-agent` if auth fails..
