# devops-projects
Repository that contains some side projects for the topic of devops

# Contents

- [Github terminal commands](#github-terminal-commands)

# Requirements

- Some of these commands use VSCode and would require some adjustments to work with the ide of your choice.
- You need to have all repositories inside of one folder in order for some commands to work as expected.

## Github terminal commands

- install Github CLI
  ```
  brew install gh
  ```
  ...or download from https://cli.github.com/

- setup auth for github cli and set as git credential manager
  ```
  gh auth login
  gh setup-git
  ```


## setup configs
- copy contents from `.zshrc` into `~/.zshrc` (or wherever your file is located)

- replace the placeholder inside variable GITHUB_BASE_NAME with the base name you want to use. This could be your username or organization, depending on where you want to point the commands to.

- copy contents from `config.yml` into Github CLI config YAML (Mac: `~/.config/gh/`)

- replace `code` inside `code-ct-pr` with the IDE command of your choice.



## How to use
I have created the tables in these commands so that you can copy the repository and the PR Number out of it and seamlessly use it together with other commands. Those commands are marked green

## available commands

- `prs`

  Creates a table with all PRs assigned to you. PRs with labels `dependencies` or `bump-dependencies` are ignored for this view.

- `prs-own`

  Creates a table with all PRs created by you.

- <span style="color:green">`pr-open-web`</span>

  Takes a repo and a pr number as input - opens in the browser

- <span style="color:green">`pr-code`</span>

  Checks out the branch of the PR inside the repository, pulls and opens in your set IDE

- `pr-create`

  Starts creating a PR for the current branch. Uses the current branch of the terminal.
  Opens the PR inside the browser
  

## Additional commands

I have added `cd-proj` and `code-proj` as zsh functions. `code-proj` can be changed to open in your IDE (if a terminal command is included).