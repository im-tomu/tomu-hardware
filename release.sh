#!/bin/bash

set -x
set -e

if git diff-index --quiet HEAD --; then
	echo "Clean repo, good!"
else
	echo "Dirty repo, commit before running."
	exit 1
fi

CURRENT_VERSION=$(git describe --abbrev=0)

VERSION_MATCH='v\([0-9]\+\)\.\([0-9]\+\)'
MAJOR_VERSION=$(echo $CURRENT_VERSION | sed -e"s/$VERSION_MATCH/\1/")
MINOR_VERSION=$(echo $CURRENT_VERSION | sed -e"s/$VERSION_MATCH/\2/")

echo "Current version: $CURRENT_VERSION"

# Work out the next version
NEXT_VERSION="v$MAJOR_VERSION.$((MINOR_VERSION+1))"
echo "Next version: $NEXT_VERSION"
OUTDIR=releases/$NEXT_VERSION
mkdir $OUTDIR

# Update the version embedded in the PCB
sed -e"s/(gr_text \"tomu.im  $CURRENT_VERSION\"/(gr_text \"tomu.im  $NEXT_VERSION\"/" --in-place=.bak tomu.kicad_pcb
git add tomu.kicad_pcb

# Generate the gerber files
python2 third_party/gen_gerber_and_drill_files_board.py tomu.kicad_pcb $OUTDIR/gerbers
git add $OUTDIR/gerbers/*

# Update the kitnic.yaml
sed -e"s/$CURRENT_VERSION/$NEXT_VERSION/" kitnic.yaml --in-place
git add kitnic.yaml

git commit -m "Bumping version to $NEXT_VERSION"
git tag --annotate $NEXT_VERSION -m"Releasing $NEXT_VERSION"

cd $OUTDIR/gerbers
ZIP="tomu-$(git describe --long).zip"
zip -r ../$ZIP .

cd ..; md5sum $ZIP

exit 0
