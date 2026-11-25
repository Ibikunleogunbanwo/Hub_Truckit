# Project board

One GitHub Project gives a single view of work across Hub_Truckit, Backend_Truckit and Frontend_Truckit.

## One-time setup (ade, about 5 minutes)

1. Go to your GitHub profile, open **Projects**, then **New project**, and choose the **Board** layout. Name it **Truckit**.
2. In the project's settings, add these fields:
   - **Side** (single select): Backend, Frontend, Hub, Design
   - **Size** (single select): S, M, L
   - **Contract change** (single select): Yes, No
3. Set the **Status** columns to: Backlog, Ready, In progress, In review, Done.
4. Under **Workflows** (the menu in the top right), turn on:
   - **Auto-add to project** for each of the three repos, with filter `is:issue,pr is:open`
   - **Item closed** sets Status to Done
   - **Pull request merged** sets Status to Done
5. Optional views: a table grouped by **Side**, and a filter for the `blocking` and `decision-needed` labels.

## How agents use it

- Change requests are opened as issues in Hub_Truckit, so they land on the board automatically.
- Work items for one side can be issues in that side's repo; they also land on the board.
- Agents don't need to move cards by hand: opening, closing and merging update the status through the workflows above.
