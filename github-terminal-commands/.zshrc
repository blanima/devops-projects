# Github Org Name to be used with github cli commands
GITHUB_ORG_NAME="YOUR_ORG_NAME"

# Path to your github projects folder
GITHUB_REPOS_PATH=~/path/to/your/github/projects

cd-proj() {
  cd $GITHUB_REPOS_PATH/"$1" 
}


code-proj() {
  # replace code with the IDE command of your choice
  code $GITHUB_REPOS_PATH/"$1" ${2:-""}
}

_proj-files() {
  _files -W $GITHUB_REPOS_PATH/ -/
}

compdef _proj-files cd-proj
compdef _proj-files code-proj

prs() {
  gh get-prs-no-deps-gql --jq "[\"REPO\",\"#\", \"AUTHOR\", \"TITLE\"], [\"------------\",\"----\", \"--------\", \"-------------------\"], (.data.search.edges[] | [.node.repository.name, (.node.number|tostring), .node.author.login, .node.title]) | @tsv" | column -t -s $'\t'
}

pr-code() {
  gh code-ct-pr $GITHUB_REPOS_PATH $1 $2 $3
}

prs-own() {
  gh get-own-prs --jq "[\"REPO\",\"#\", \"STATUS\", \"LAST_UPDATE\",\"TITLE\"], [\"------------\",\"----\", \"--------\", \"-----------\", \"-----------\"], (.data.search.edges[] | [.node.repository.name, (.node.number|tostring), .node.reviewDecision, (if .node.latestReviews.nodes | length > 0 then .node.latestReviews.nodes[0].createdAt else \"--\" end), .node.title]) | @tsv" | column -t -s $'\t'
}

pr-open-web() {
  gh open-web-pr $GITHUB_ORG_NAME $1 $2
}

pr-create() {
  gh pr create -a @me -w
}