-- 찌릿찌릿 전자기 연구소: 랭킹 표 (스피드게임 / 서바이벌 모드)
-- Supabase 대시보드 → SQL Editor → New query 에 전체를 붙여 넣고 Run 을 누르세요.
create table if not exists public.em_scores (
  id         bigint generated always as identity primary key,
  mode       text        not null check (mode in ('speed', 'survival')),
  name       text        not null check (char_length(name) between 1 and 10),
  score      integer     not null check (score between -10000 and 100000),
  correct    smallint    not null check (correct between 0 and 10000),
  avg_time   real        not null default 0 check (avg_time between 0 and 60),
  created_at timestamptz not null default now()
);

alter table public.em_scores enable row level security;

drop policy if exists "anyone can read em_scores" on public.em_scores;
create policy "anyone can read em_scores" on public.em_scores
  for select to anon using (true);

drop policy if exists "anyone can add em_scores" on public.em_scores;
create policy "anyone can add em_scores" on public.em_scores
  for insert to anon with check (true);

grant select, insert on public.em_scores to anon;

create index if not exists em_scores_rank_idx
  on public.em_scores (mode, score desc, avg_time asc);
