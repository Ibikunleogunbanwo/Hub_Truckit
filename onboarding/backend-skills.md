# Backend skills handoff

Ade requested sharing relevant skills installed in the frontend agent's environment. Complete snapshots, including referenced files and bundled license notices, are in [`shared-skills/backend/`](../shared-skills/backend/). `manifest.json` records SHA-256 hashes and local provenance. These are existing skills, not new Truckit-specific skills; upstream origins have not been verified.

## Install

For a Codex backend agent on the **same machine and user account**, these skills already live in `~/.agents/skills/`. Check the backend chat's available-skills list before installing duplicates. Installing for a different agent harness can use its own skill directory.

For Codex on another machine, clone this Hub and run from its root:

```bash
mkdir -p "$HOME/.agents/skills"
for skill in api-design-principles multi-stage-dockerfile systematic-debugging verification-before-completion security-review receiving-code-review stripe-best-practices; do
  if [ -e "$HOME/.agents/skills/$skill" ]; then
    echo "Already exists; review before replacing: $skill"
  else
    cp -R "shared-skills/backend/$skill" "$HOME/.agents/skills/$skill"
  fi
done
```

Start a fresh backend chat if the skills do not appear in the current session. Keep full directories: copying only `SKILL.md` breaks reference links. Review skill instructions before using them; repo rules and ade's instructions take precedence.

## Which skill to use

| Skill | Backend use |
|---|---|
| `api-design-principles` | Review resource naming, HTTP semantics, pagination, error shapes and proposed OpenAPI changes. |
| `multi-stage-dockerfile` | Review FastAPI container structure and development/production build stages. |
| `systematic-debugging` | Reproduce failures and find their cause before suggesting a fix. |
| `verification-before-completion` | Require actual test or command results before claiming work passes. |
| `security-review` | Review authentication, authorization, uploads, injection and secret handling; Python/FastAPI references are bundled. |
| `receiving-code-review` | Verify review feedback before advising ade to apply it. |
| `stripe-best-practices` | Consult when payments work begins; preserve Hub's pending payment decisions. |

No dedicated FastAPI skill is installed in this shared set. API design and Python security references help, but do not replace FastAPI documentation.

## Paste into the backend agent

> Read `AGENTS.md`, `context/status.md`, `architecture/backend.md`, the accepted decisions, and `onboarding/backend-skills.md` from Hub_Truckit. Check which recommended skills are already available; install missing snapshots from `shared-skills/backend` into your harness's skills directory. Use them to plan, review, correct and explain. Ade writes the FastAPI application: do not generate or commit backend app code unless ade explicitly asks. Hub's OpenAPI contract is authoritative; API changes need the documented issue and PR workflow. Never commit to Frontend_Truckit. Report tests honestly and open the required Hub changelog/status PR after work.
