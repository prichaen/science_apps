# science_apps

수업 시간에 쓰는 과학 시뮬레이션과 게임 모음입니다. 모두 모바일 환경을 기준으로 만들었습니다.

## 앱 목록

| 과목 | 앱 | 폴더 |
|---|---|---|
| 물리 | 찌릿찌릿 전자기 연구소: 솔레노이드 · 전동기 · 발전기 시뮬레이션, 스피드게임 · 서바이벌 모드 | `electromagnetic-induction/` |
| 지구과학 | 별의 핵: 수소에서 철까지 원소를 융합하는 원형 중력 수박게임, Supabase 익명 TOP 10 랭킹 | `stellar-nucleosynthesis/` |

## 구조

```
science_apps/
├─ index.html                  앱 목록 첫 화면
├─ electromagnetic-induction/  앱 하나 = 폴더 하나
│  ├─ index.html
│  └─ assets/
└─ stellar-nucleosynthesis/
   ├─ index.html
   └─ supabase-setup.sql       랭킹용 Supabase 표 설정 (SQL Editor에서 한 번 실행)
```

## 랭킹 (Supabase)
전자기 유도 앱의 랭킹은 Supabase `em_scores` 표에 저장됩니다. 연결이 안 되면 기기 브라우저에 저장된 기록을 보여 줍니다.

## 새 앱 추가하기
1. 앱 이름으로 폴더를 만들고 그 안에 `index.html`을 넣습니다.
2. 루트 `index.html`의 `APPS` 목록에 한 줄을 추가합니다.
3. 이 README의 앱 목록 표에도 한 줄을 추가합니다.

## 접속
GitHub Pages(Settings → Pages → Branch: `main`, `/ (root)`)를 켜면 아래 주소로 접속할 수 있습니다.
- 앱 목록: `https://prichaen.github.io/science_apps/`
- 전자기 유도: `https://prichaen.github.io/science_apps/electromagnetic-induction/`
- 별의 핵: `https://prichaen.github.io/science_apps/stellar-nucleosynthesis/`
