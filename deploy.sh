#!/bin/bash
set -euo pipefail
TARGET="deploy@192.168.1.117"
SSH="ssh -o StrictHostKeyChecking=no"
npm ci
npm run build
rsync -a --delete -e "$SSH" dist/ "$TARGET":/opt/personal-web/dist/
$SSH "$TARGET" "sudo systemctl restart personal-web"
echo "Deployed to personal-web"
