-- =====================================================================
-- CYRENIA TABLETOP — Supabase schema
-- Paste this whole file into:  Supabase dashboard -> SQL Editor -> New query
-- then press RUN. One-time setup.
-- =====================================================================

-- One generic key/value table holds the whole exercise:
--   key 'ctl'        -> { "sessionStart": <ms epoch> }   (the shared clock)
--   key 'team_xxxxx' -> { name, dossier, alloc, stage, ... } per committee
create table if not exists public.kv (
  key         text primary key,
  value       jsonb,
  updated_at  timestamptz default now()
);

-- Realtime so the projector dashboard and all phones update live.
alter publication supabase_realtime add table public.kv;

-- Row Level Security.
-- NOTE: these policies are intentionally OPEN — anyone with the public anon
-- key can read/write this one table. That is fine for a throwaway exercise.
-- Do NOT reuse this Supabase project for anything sensitive.
alter table public.kv enable row level security;

drop policy if exists "kv anon read"   on public.kv;
drop policy if exists "kv anon insert" on public.kv;
drop policy if exists "kv anon update" on public.kv;
drop policy if exists "kv anon delete" on public.kv;

create policy "kv anon read"   on public.kv for select using (true);
create policy "kv anon insert" on public.kv for insert with check (true);
create policy "kv anon update" on public.kv for update using (true) with check (true);
create policy "kv anon delete" on public.kv for delete using (true);
