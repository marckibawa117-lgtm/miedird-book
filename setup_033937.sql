create table notes (
  user_id uuid not null default auth.uid() references auth.users on delete cascade,
  id text not null,
  title text not null default '',
  body text not null default '',
  updated bigint not null default 0,
  primary key (user_id, id)
);
alter table notes enable row level security;
create policy "Chacun ses notes" on notes for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);
