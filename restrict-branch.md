## Restrict myself from pushing secret branch

**Case:** I have branch which is secret, and I want to restrict myself from accidentally pushing it to `origin`

**Solution:** git hooks!

```
touch ./.git/hooks/pre-push
chmod +x ./.git/hooks/pre-push
```

Open `./.git/hooks/pre-push` and paste:
```
#!/bin/bash

PROTECTED_BRANCH="testing-branch-must-be-private"

# Check which branch is being pushed
while read local_ref local_sha remote_ref remote_sha
do
  if [ "$local_ref" = "refs/heads/$PROTECTED_BRANCH" ]; then
    echo "Error: Push to '$PROTECTED_BRANCH' is not allowed."
    exit 1
  fi
done
```
