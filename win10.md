# How to setup git in win10 cmd

Simple and effective 🙂

1. [Install git for win10](https://git-scm.com/download/win), add to path.  
_Ignore git bash, you can use git just fine in cmd or PS_
2. Open cmd, run the following twice.  
	Ideally, create the main key with password (for auth) and a signing key w/ password.
```
ssh-keygen
```
4. Open [github.com settings](https://github.com/settings/keys), add the generated `.pub` file both as authentication & signing key
5. Restart cmd, run:
```
git config --global user.name "Your Name"
git config --global user.email your@mail.com
git config --global user.signingkey c:\Users\USER\.ssh\id_rsa.pub
git config --global commit.gpgsign true
git config --global gpg.format ssh
```
5. Try it 🚀

Run `start-ssh-agent` if auth fails..
