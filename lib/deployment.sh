#################################
# Pull repo from GitHub
#################################
function cloneApp() {
  echocyan "[GITHUB] Cloning branch '$1' from '$REPO_URL'"; echo
  echoyellow "[WARN] Executing clone in "
  for i in `seq 5 -1 1`; do
    echored $i
    sleep 1
    echo -n " "
  done; echo
  echoyellow "[WARN] Removing version '$1'"; echo
  rm -rf "$1" && 
  echored "[GITHUB] git clone -b $1 '$REPO_URL' '$1'"; echo
  git clone -b $1 "$REPO_URL" "$1" &&
  echogreen "[SUCCESS] '$1' cloned, ready to add parts!"; echo
}

function addMissingParts() {
  echocyan "[BUILD] Updating missing entities in app"; echo
  echoyellow "[HEROKU] Adding id to deploy keys file"; echo
  mv "$1/project/HerokuDeployKeys" "$1/project/HerokuDeployKeys.scala" && 
  echo && 
  echoyellow "[KEYS] Adding keys.js to ui/src with credentials"; echo &&
  cp "./keys.js" "$1/ui/src" &&
  echogreen "[SUCCESS] Finished adding parts, ready to build!"; echo  
}

function buildApp() {
  echocyan "[BUILD] Building app version '$1' for production"; echo
  cd "$1" &&
  echoyellow "[BUILD] Beginning build"; echo
  sbt dist &&
  echoyellow "[BUILD] Moving zip to here"; echo
  mv /home/richard/Documents/server-scripts/${1}/target/universal/math_bot-1.0-SNAPSHOT.zip /home/richard/Documents/server-scripts/ &&
  mv /home/richard/Documents/server-scripts/math_bot-1.0-SNAPSHOT.zip /home/richard/Documents/server-scripts/${1}.zip &&
  echoyellow "[BUILD] Unzipping app"; echo 
  unzip /home/richard/Documents/server-scripts/${1}.zip -d /home/richard/Documents/server-scripts && 
  echogreen "[SUCCESS] Finished building app, ready to fire up"; echo 	
}

function startApp() {
  echocyan "[RUN] Starting '$1'"; echo
  echoyellow "[WARN] Executing nohup in "
  for i in `seq 5 -1 1`; do
    echored $i
    sleep 1
    echo -n " "
  done; echo
  echoyellow "[WARN] Starting '$1' now, when complete close this terminal"; echo
}
