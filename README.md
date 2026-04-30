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


# References

- [chrisman/m4-blog](https://github.com/chrisman/m4-blog)
- [GNU m4 - Macros for text handling](https://web.mit.edu/gnu/doc/html/m4_10.html)
- [Building text files with m4 macros](http://www.linuxfocus.org/English/September1999/article111.html)
- [Notes on the M4 Macro Language](https://mbreen.com/m4.html)
- [Working with the m4 Macro Language – James Howard](https://jameshoward.us/2021/08/03/working-with-m4-macro-language)
