# How to setup git in Linux bash

Create the main ssh key for authentication with password & the signing key without password:
```
ssh-keygen -t ed25519 -C "your@mail.com"
ssh-keygen -t ed25519 -C "your@mail.com" -f ~/.ssh/id_ed25519_signing
```

Open [github.com settings](https://github.com/settings/keys).  
Add the generated `.pub` files respectively as authentication & signing key:
```
cat ~/.ssh/id_ed25519.pub
cat ~/.ssh/id_ed25519_signing.pub
```

Finish up:
```
git config --global user.name "Your name"
git config --global user.email your@mail.com
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519_signing.pub
git config --global commit.gpgsign true

mkdir -p ~/.config/git
echo "$(whoami) $(cat ~/.ssh/id_ed25519_signing.pub)" > ~/.config/git/allowed_signers
git config --global gpg.ssh.allowedSignersFile ~/.config/git/allowed_signers
```

Add this to ~/.ssh/config to specify explicitly what key should be used instead of default, which may be whatever:
```
Host github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
    IdentitiesOnly yes
```

Check available keys, check if you're authed correctly with github:
```
ssh-add -l
ssh -T git@github.com
```
