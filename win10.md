# How to setup git in win10 cmd

[Install git for win10](https://git-scm.com/download/win), add to path.  
_Ignore git bash, you can use git just fine in cmd or PS_

Open cmd, run the following twice (Create the main ssh key for authentication with password & the signing key without password):
```
ssh-keygen -f "%USERPROFILE%\.ssh\id_ed25519"
ssh-keygen -f "%USERPROFILE%\.ssh\id_ed25519_signing"
```

Open [github.com settings](https://github.com/settings/keys).
Add the generated `.pub` files respectively as authentication & signing key:

Restart cmd, run:
```
git config --global user.name "Your Name"
git config --global user.email your@mail.com
git config --global gpg.format ssh
git config --global user.signingkey "%USERPROFILE%\.ssh\id_ed25519.pub"
git config --global commit.gpgsign true
git config --global gpg.ssh.allowedSignersFile "%USERPROFILE%\.config\git\allowed_signers"
```

To the `allowed_signers` file, add output of `echo %USERNAME%` and content of `id_ed25519_signing.pub` delimited by space.  
e.g. `Jiri ssh-rsa ABCD...`

Try it 🚀 Check available keys, check if you're authed correctly with github:
```
ssh-add -l
ssh -T git@github.com
```

Run `start-ssh-agent` if auth fails..
