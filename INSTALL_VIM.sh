#!/bin/bash

echo "Installing vim plugins."
echo "This might take a minute or two."

vim -E +'PlugInstall --sync' +qa
echo "DONE"
