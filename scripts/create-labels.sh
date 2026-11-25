#!/usr/bin/env bash
# Creates the change request labels in this repo. Run once: bash scripts/create-labels.sh
set -euo pipefail
gh label create needs-backend   --color 1D76DB --description "Backend must act"            --force
gh label create needs-frontend  --color 14B8A6 --description "Frontend must act"           --force
gh label create contract-change --color FBCA04 --description "API contract will change"    --force
gh label create blocking        --color D93F0B --description "Requester is blocked"        --force
gh label create question        --color CC317C --description "Needs an answer, not code"   --force
gh label create decision-needed --color 5319E7 --description "A human must decide"         --force
