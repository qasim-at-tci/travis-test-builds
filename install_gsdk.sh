#!/bin/bash
set -e

  if [ ! -d "$HOME/google-cloud-sdk/bin" ]
   then rm -rf $HOME/google-cloud-sdk; 
   export CLOUDSDK_CORE_DISABLE_PROMPTS=1; 
   curl https://sdk.cloud.google.com | bash;  
   source /Users/travis/google-cloud-sdk/completion.bash.inc
   source $HOME/google-cloud-sdk/path.bash.inc
   gcloud version
  fi
