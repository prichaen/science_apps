-- 과학 앱 모음: 공용 랭킹 표 (앱마다 app 값으로 기록을 구분)
-- Supabase 대시보드 → SQL Editor → New query 에 전체를 붙여 넣고 Run 을 누르세요.
-- 이미 예전 버전을 실행했어도 다시 실행하면 됩니다(기존 기록은 지워지지 않습니다).

create table if not exists public.scores (
  id         bigint generated always as identity primary key,
  name       text        not null check (char_length(name) between 1 and 10),
  score      integer     not null check (score between 0 and 1000000),
  lv         smallint    check (lv between 0 and 12),
  created_at timestamptz not null default now()
);

-- 앱 구분 칸 추가 (예전 버전에서 쌓인 기록은 'stellar-nucleosynthesis-legacy'로 분류)
alter table public.scores add column if not exists app text not null default 'stellar-nucleosynthesis-legacy';
alter table public.scores drop constraint if exists scores_app_check;
alter table public.scores add constraint scores_app_check check (char_length(app) between 1 and 40);
-- 원소 단계(lv)는 별의 핵 전용이라, 다른 앱은 비워 둘 수 있게 합니다
alter table public.scores alter column lv drop not null;

-- 행 단위 보안: 누구나 읽기와 추가만 가능, 수정·삭제는 불가
alter table public.scores enable row level security;

drop policy if exists "anyone can read scores" on public.scores;
create policy "anyone can read scores" on public.scores
  for select to anon using (true);

drop policy if exists "anyone can add scores" on public.scores;
create policy "anyone can add scores" on public.scores
  for insert to anon with check (true);

grant select, insert on public.scores to anon;

drop index if exists scores_score_idx;
create index if not exists scores_app_score_idx on public.scores (app, score desc, created_at asc);
