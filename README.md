# Setup

```sh
# Create an empty, orphan branch
git checkout --orphan gh-pages
# Clear all files from the new branch
git reset --hard
# Create an initial empty commit to establish the branch
git commit --allow-empty -m "Initial gh-pages commit"
# Push it to GitHub
git push origin gh-pages
# Return to the main branch
git checkout main

# Clean the local build folder first to avoid conflicts
make clean

# Add the gh-pages branch as a worktree at the 'dist' path
git worktree add dist gh-pages
```
