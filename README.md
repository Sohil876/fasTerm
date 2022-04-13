## fasTerm

### Run the workflow
Go to GitHub actions tab of your repo, click on `Select workflow` and select your workflow.\
Then run your workflow from there by clicking on `Run workflow`, then click on `Run workflow`.

### Access the shell
If the new workflow doesnt show up automatically, refresh your page.\
Click on your newly run workflow, then click on "build".\
Wait for it to run `Setup tmate session`, once it's done setting up, it will repeatedly print this:
```
WebURL: https://tmate.io/t/rXbusP3qkYsfALDSLMQZVwG3d

SSH: ssh rXbusP3qkYsfALDSLMQZVwG3d@sfo2.tmate.io
```
Use that to connect via ssh or web browser.\
After connecting you'll see a welcome message, press <kbd>q</kbd> or <kbd>Ctrl+c</kbd> to continue to shell.\
**NOTE**: Upterm does not supports RSA keys, so if you're using rsa keys to connect to upterm you can use this [workaround](https://github.com/owenthereal/upterm/commit/0f410ca8f3f88119a570adf13dae37d9817ae894) (the removed text in this commit) to connect.

### Continue a workflow
If you want to continue a workflow and you are inside a tmate session, just create a empty file with the name `continue` either in the root directory or in the project directory by running `touch continue` or `sudo touch /continue`.\
Closing the terminal will also continue the workflow. However you won't be able to reconnect in that case.\
It's possible to detach from the terminal and not continue by first pressing `Ctrl+b` and then `d` key (tmux detach command keys).

### Stop your session
Your workflow will run for ~6 hours.\
Your workflow will terminate when you exit your sshed shell.\
To manually close the session, click the red "Cancel workflow" on the right-hand side of the Actions screen.

### Using ssh to connect to other servers
You can ssh from your workflow instance to your servers, first you have to set up a GitHub secret containing the ssh private key.\
To set up, [click here](../../settings/secrets/new) to create a new secret, name it `SSH_KEY` (it must be that exact name), and paste your private key file (e.g. `~/.ssh/id_rsa`) contents as the value.\
Save your secret, now your worflow instance has your key ready for use.\
**NOTE**: anyone who has access to your GitHub account can access your `SSH_KEY` contents by running this action!, therefore you should only use a key which is not security sensitive, or at the very least ensure that it is password protected with a strong password.

### Auto-configuration of your sessions
Edit the `script-{linux,mac}.sh` files to add configuration commands that you want run automatically when you create a new session.\
You can use this to auto install and setup your needed packages for example.

### Behind the scenes
`fasTerm` is a fork of [fastmac](https://github.com/jph00/fastmac)\
`fastmac` is a very thin wrapper around [tmate](https://tmate.io/), which itself is based on [tmux](https://github.com/tmux/tmux/wiki), so all the features of both are available.\
[tmate](https://tmate.io) integration with Github Actions is provided by [action-tmate](https://github.com/mxschmitt/action-tmate).\
[Upterm](https://upterm.dev) integration with Github Actions is provided by [action-upterm](https://github.com/lhotari/action-upterm).

