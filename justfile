# List all recipies
default:
    just --list --unsorted

# Generate chapters
build:
    fd --type file --extension org | awk 'BEGIN { FS="."} {print $1}' | xargs -I {} pandoc --to=commonmark {}.org -o src/{}.md

# Clean markdown files
clean:
    rm docs/*.md
