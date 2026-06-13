-- SI-PANTAU SERDIK - Supabase Schema
-- Jalankan script ini di Supabase SQL Editor.

create table if not exists public.app_state (
  id text primary key,
  data jsonb not null,
  updated_at timestamptz default now()
);

alter table public.app_state enable row level security;

drop policy if exists "Allow read app_state" on public.app_state;
drop policy if exists "Allow insert app_state" on public.app_state;
drop policy if exists "Allow update app_state" on public.app_state;

create policy "Allow read app_state"
on public.app_state
for select
using (true);

create policy "Allow insert app_state"
on public.app_state
for insert
with check (true);

create policy "Allow update app_state"
on public.app_state
for update
using (true)
with check (true);

insert into public.app_state (id, data, updated_at)
values ('main', '{}'::jsonb, now())
on conflict (id) do nothing;


-- TABEL KUNCI ADMINISTRATOR UTAMA
-- Tabel ini memastikan akun Administrator hanya ada 1 untuk seluruh perangkat.
create table if not exists public.admin_accounts (
  id text primary key default 'main',
  username text not null unique,
  password text not null,
  name text not null default 'Administrator Utama',
  created_at timestamptz default now(),
  updated_at timestamptz default now(),
  constraint single_admin_id check (id = 'main')
);

alter table public.admin_accounts enable row level security;

drop policy if exists "Allow read admin_accounts" on public.admin_accounts;
drop policy if exists "Allow insert admin_accounts" on public.admin_accounts;
drop policy if exists "Allow update admin_accounts" on public.admin_accounts;

create policy "Allow read admin_accounts"
on public.admin_accounts
for select
using (true);

create policy "Allow insert admin_accounts"
on public.admin_accounts
for insert
with check (id = 'main');

create policy "Allow update admin_accounts"
on public.admin_accounts
for update
using (id = 'main')
with check (id = 'main');
