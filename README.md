# claude-batcher
Combine different source code files into a single file that can be uploaded to Claude AI

Tested on Ubuntu only.

# Setup
Put the batch-files.sh into your route directory

chmod +x batch-files.sh


# Usage

I use it with python and generally use poetry as my package manage (so .venv is ignored, you might wish to ignore venv).

go to you project root, `cd /home/[USER]/code/project` and issue `~/batch-files.sh` 

That should walk your entire project structure recurively and put all source code files into `for-claude.txt` which you can upload to Claude AI or feed to a different AI.


![image](https://github.com/user-attachments/assets/c73ddaa2-7eab-46e2-8de7-3f7307cb6c1c)
