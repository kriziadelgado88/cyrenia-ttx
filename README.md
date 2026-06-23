# Cyrenia — Social Protection Continuity Tabletop

A live, multi-device tabletop exercise. Committees share one $2.0&nbsp;billion
emergency reserve during a cyberattack on a national social-protection system,
work through four critical impacts, and — 60 minutes in — get ambushed by the
**BlackOrchard** ransom demand that seizes every screen at once. Consequences
auto-reveal 30 minutes later. A projector dashboard shows the whole room's
results side by side.

Runs on free infrastructure: **GitHub Pages** (hosting) + **Supabase** (live
sync). No build step, no server to run.

---

## What's in here

| File | What it is |
|------|------------|
| `index.html` | The participant app. Each table opens this. |
| `display.html` | Read-only results dashboard for the projector. |
| `config.js` | The only file you edit — Supabase keys + timing. |
| `schema.sql` | One-time database setup, pasted into Supabase. |
| `LICENSE` | MIT. |

---

## Setup (about 10 minutes, one time)

### 1. Create a free Supabase project
1. Sign up at supabase.com and create a new project (free tier is fine).
2. When it's ready, open **SQL Editor → New query**, paste the entire contents
   of `schema.sql`, and press **Run**. This creates the table the exercise uses.

### 2. Get your two keys
In Supabase: **Project Settings → API**. Copy:
- **Project URL** (looks like `https://abcd1234.supabase.co`)
- the **anon / public** key (a long string — this key is *designed* to be public)

### 3. Fill in `config.js`
Open `config.js` and paste those two values in:
```js
SUPABASE_URL:      "https://abcd1234.supabase.co",
SUPABASE_ANON_KEY: "eyJhbGci...your-anon-key...",
```

### 4. Publish on GitHub Pages
1. Create a GitHub repo and upload these files (or `git push` them).
2. In the repo: **Settings → Pages**, set **Source = Deploy from a branch**,
   branch **main**, folder **/(root)**, Save.
3. After a minute GitHub gives you a URL like
   `https://YOURNAME.github.io/REPO/`.

Your two links are then:
- **Participants:** `https://YOURNAME.github.io/REPO/`
- **Projector:** `https://YOURNAME.github.io/REPO/display.html`

---

## Running a session

1. Open the **projector link** on the room screen.
2. Give every table the **participant link**. They open it, name their
   committee, read the brief, and begin. (A QR code of the link works well.)
3. The 60-minute clock starts automatically when the **first** committee enters
   the war room — so don't open it on a test device hours early. (If you do,
   just hit *Reset* — see below.)
4. Sit back. At 60 minutes the BlackOrchard note takes over every screen on its
   own. At 90 minutes every committee's consequences reveal, and the projector
   shows the full results and how the whole room decided.

### Test it first (recommended)
Before the real session, set short timings in `config.js`
(`BREACH_AT_MIN: 2`, `REVEAL_AT_MIN: 4`), open the participant and projector
links on two devices, and watch the full arc in ~5 minutes. Then set them back
to `60` / `90`.

### Reset between groups
On the participant landing screen there's a small
**"Reset exercise for a new group"** link. It clears every committee and
restarts the clock for the next cohort.

---

## Editing the exercise

All of the content lives near the top of `index.html` in plain data:
- `ESSENTIALS` — the four budget lines and the pool weighting.
- `DOSSIER` — the four critical impacts: situation, guiding questions, the
  stances a committee can take, and the trade-off revealed for each.
- `CONSEQ` / `RANSOM` — the outcome text shown at the reveal.
- The breach note wording is in the `#breach` block of `index.html`.

If you change the four budget lines or scoring, mirror the same numbers in
`display.html` (it keeps a small copy of the model for the dashboard).

Timing lives in `config.js` and is read by both files.

---

## A note on security

These are open Supabase policies — anyone with the public anon key (which ships
in the page) can read and write the one `kv` table. That is appropriate for a
disposable workshop exercise and nothing more. **Don't reuse this Supabase
project for anything sensitive**, and spin up a fresh one if you republish.

The exercise stores only committee names you type and their in-exercise choices.
No personal data is required.

---

## Credits

Scenario: Cyrenia Social Protection Continuity tabletop. Built as an open,
self-hostable exercise tool. MIT licensed — fork and adapt freely.
