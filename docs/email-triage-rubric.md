# Email triage rubric

Rules the `email-triage` skill applies to every inbox thread. Edit this file to tune what counts as important;
the procedure itself lives in `.claude/skills/email-triage/SKILL.md`.

Outcome per thread: **task**, **fyi** or **ignore**. Unsure between task and fyi → fyi. A missed low-value
task costs less than noise in the Tasks DB.

## task → create a `📧 inbox` task

Any one of these:
- Sender is `@weareautomata.com` and the mail asks Hugo for something, reports a failure, or sets a date.
- Sender is a client domain (Kapital, Coppel, BAZ, Across, BNN / Keryx) with an ask or an incident.
- Human sender and the subject or opening lines carry an incident word: `error`, `falla`, `caído`,
  `no funciona`, `urgente`, `deploy`, `reporte`, `acceso`.
- Calendar invite Hugo must attend → task `🤝🏾 Reunión HH:MM con <X>`, due the meeting day.
- Direct question to Hugo that needs an answer the same day.

## fyi → label only

- Status updates with no ask.
- Threads where Hugo is only in CC and nobody asks him anything.
- GCP, Fly or other billing / quota notices.
- GitHub notifications.
- Replies on a thread Hugo already answered.

## ignore → label `HAL/triaged` only

- Newsletters, promotions, social, automated no-reply mail.
- Anything already labeled `HAL/triaged`.

## Naming the task

`[Client]: [Action]`, self-descriptive, Spanish, as in the Tasks DB (e.g. `Kapital: Revisar error en el reporte
de promesas`). Client = the company the mail is about, not the sender's company.
