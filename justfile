# List all recipies
default:
    just --list --unsorted

# Generate chapters
build:
    cp -r images src/
    fd --type file --extension org | awk 'BEGIN { FS="."} {print $1}' | xargs -I {} pandoc --to=commonmark {}.org -o src/{}.md

# Serve book
serve:
    mdbook serve --dest-dir ./docs

# Clean markdown files
clean:
    rm docs/*.md
