# Rebase conflicts with 3diff tool

`master`: A — B — C  
`branch`: A — D — E

```
git checkout branch
git rebase master
```
→ conflict between B & D

3 diff tool displays: D → A ← B  
Meaning:
- left = diffs from `branch` D to A
- middle = initially state of A, then the new state of D' against C
- right = diffs from `master` B to A

`branch`: A — B — C — D' — E'
