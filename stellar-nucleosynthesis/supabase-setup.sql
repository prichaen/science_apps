-- 별의 핵: 익명 전체 랭킹 테이블
-- Supabase 대시보드 → SQL Editor → New query 에 전체를 붙여 넣고 Run 을 누르세요.

create table if not exists public.scores (
  id         bigint generated always as identity primary key,
  name       text        not null check (char_length(name) between 1 and 10),
  score      integer     not null check (score between 0 and 1000000),
  lv         smallint    not null check (lv between 0 and 12),
  created_at timestamptz not null default now()
);

-- 행 단위 보안: 누구나 읽기와 추가만 가능, 수정·삭제는 불가
alter table public.scores enable row level security;

drop policy if exists "anyone can read scores" on public.scores;
create policy "anyone can read scores" on public.scores
  for select to anon using (true);

drop policy if exists "anyone can add scores" on public.scores;
create policy "anyone can add scores" on public.scores
  for insert to anon with check (true);

grant select, insert on public.scores to anon;

create index if not exists scores_score_idx on public.scores (score desc, created_at asc);
