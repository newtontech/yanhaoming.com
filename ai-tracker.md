---
layout: default
title: AI Research Tracker
permalink: /ai-tracker/
---

<style>
  :root {
    --ops-bg: #04100f;
    --ops-bg-2: #071716;
    --ops-panel: rgba(7, 24, 24, 0.82);
    --ops-panel-strong: rgba(8, 31, 31, 0.94);
    --ops-line: rgba(94, 255, 223, 0.28);
    --ops-cyan: #5effdf;
    --ops-cyan-soft: rgba(94, 255, 223, 0.16);
    --ops-amber: #ffc857;
    --ops-red: #ff686b;
    --ops-text: #e8fffb;
    --ops-muted: #92b9b3;
    --ops-ink: #04100f;
    --ops-font-display: "Avenir Next Condensed", "DIN Condensed", "Bahnschrift", "Trebuchet MS", sans-serif;
    --ops-font-body: "Avenir Next", "SF Pro Text", "Segoe UI", sans-serif;
  }

  .page-header {
    display: none;
  }

  .main-content {
    max-width: none;
    padding: 0;
  }

  .main-content h1,
  .main-content h2,
  .main-content h3,
  .main-content p,
  .main-content ul,
  .main-content table {
    margin-top: 0;
  }

  .main-content a {
    color: inherit;
  }

  body {
    background: var(--ops-bg);
  }

  .ops-shell {
    min-height: 100vh;
    color: var(--ops-text);
    background:
      radial-gradient(circle at 14% 12%, rgba(94, 255, 223, 0.22), transparent 28rem),
      radial-gradient(circle at 88% 10%, rgba(255, 200, 87, 0.16), transparent 24rem),
      linear-gradient(135deg, #020706 0%, #071616 48%, #0c1210 100%);
    font-family: var(--ops-font-body);
    overflow: hidden;
  }

  .ops-shell * {
    box-sizing: border-box;
  }

  .ops-hero {
    position: relative;
    min-height: 92vh;
    display: grid;
    grid-template-columns: minmax(0, 1.05fr) minmax(320px, 0.95fr);
    gap: clamp(24px, 5vw, 72px);
    align-items: center;
    padding: clamp(28px, 6vw, 76px);
    isolation: isolate;
  }

  .ops-hero::before {
    content: "";
    position: absolute;
    inset: 0;
    z-index: -3;
    background-image:
      linear-gradient(rgba(94, 255, 223, 0.055) 1px, transparent 1px),
      linear-gradient(90deg, rgba(94, 255, 223, 0.055) 1px, transparent 1px);
    background-size: 42px 42px;
    mask-image: linear-gradient(to bottom, black 0%, transparent 94%);
  }

  .ops-hero::after {
    content: "";
    position: absolute;
    inset: 0;
    z-index: -2;
    pointer-events: none;
    background:
      linear-gradient(105deg, transparent 0 52%, rgba(94, 255, 223, 0.08) 52.2% 52.8%, transparent 53%),
      repeating-linear-gradient(0deg, transparent 0 11px, rgba(255, 255, 255, 0.018) 12px);
    opacity: 0.85;
  }

  #ops-radar {
    position: absolute;
    inset: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
    opacity: 0.92;
  }

  .ops-kicker {
    width: fit-content;
    border: 1px solid var(--ops-line);
    color: var(--ops-cyan);
    background: rgba(4, 18, 17, 0.72);
    padding: 8px 12px;
    font: 700 0.78rem/1 var(--ops-font-body);
    letter-spacing: 0;
    text-transform: uppercase;
    box-shadow: 0 0 32px rgba(94, 255, 223, 0.14);
  }

  .ops-title {
    max-width: 980px;
    margin: 22px 0 18px;
    color: var(--ops-text);
    font-family: var(--ops-font-display);
    font-size: clamp(3rem, 11vw, 8.6rem);
    line-height: 0.86;
    letter-spacing: 0;
    text-transform: uppercase;
  }

  .ops-title span {
    display: block;
    color: transparent;
    -webkit-text-stroke: 1px rgba(94, 255, 223, 0.8);
    text-shadow: 0 0 30px rgba(94, 255, 223, 0.18);
  }

  .ops-subtitle {
    max-width: 760px;
    margin: 0 0 26px;
    color: #cdece7;
    font-size: clamp(1rem, 1.65vw, 1.22rem);
    line-height: 1.75;
  }

  .ops-hero-actions {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    align-items: center;
    margin-bottom: 26px;
  }

  .ops-button {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-height: 46px;
    padding: 0 16px;
    border: 1px solid rgba(94, 255, 223, 0.42);
    color: var(--ops-ink);
    background: var(--ops-cyan);
    font-weight: 800;
    text-decoration: none;
    box-shadow: 0 0 24px rgba(94, 255, 223, 0.3);
    transition: transform 180ms ease, box-shadow 180ms ease;
  }

  .ops-button:hover,
  .ops-button:focus-visible {
    transform: translateY(-2px);
    box-shadow: 0 0 42px rgba(94, 255, 223, 0.42);
  }

  .ops-button.ghost {
    color: var(--ops-cyan);
    background: rgba(4, 16, 15, 0.78);
  }

  .ops-stat-grid {
    display: grid;
    grid-template-columns: repeat(4, minmax(118px, 1fr));
    gap: 10px;
    max-width: 860px;
  }

  .ops-stat {
    border: 1px solid rgba(94, 255, 223, 0.22);
    background: linear-gradient(180deg, rgba(8, 28, 27, 0.88), rgba(6, 17, 16, 0.72));
    padding: 16px;
    min-height: 112px;
    position: relative;
    overflow: hidden;
  }

  .ops-stat::after {
    content: "";
    position: absolute;
    inset: auto 0 0;
    height: 3px;
    background: linear-gradient(90deg, var(--ops-cyan), transparent);
  }

  .ops-stat strong {
    display: block;
    color: var(--ops-amber);
    font-family: var(--ops-font-display);
    font-size: clamp(1.8rem, 4vw, 3rem);
    line-height: 1;
  }

  .ops-stat span {
    display: block;
    margin-top: 8px;
    color: var(--ops-muted);
    font-size: 0.86rem;
    line-height: 1.35;
  }

  .ops-command {
    justify-self: end;
    width: min(100%, 620px);
    border: 1px solid rgba(94, 255, 223, 0.34);
    background: linear-gradient(155deg, rgba(6, 24, 24, 0.88), rgba(5, 12, 12, 0.78));
    box-shadow: 0 34px 92px rgba(0, 0, 0, 0.45), inset 0 0 80px rgba(94, 255, 223, 0.04);
    backdrop-filter: blur(18px);
  }

  .ops-command-top {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    padding: 14px 16px;
    border-bottom: 1px solid rgba(94, 255, 223, 0.2);
    color: var(--ops-muted);
    font-size: 0.78rem;
    text-transform: uppercase;
  }

  .ops-pulse {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    color: var(--ops-cyan);
  }

  .ops-pulse::before {
    content: "";
    width: 9px;
    height: 9px;
    border-radius: 999px;
    background: var(--ops-cyan);
    box-shadow: 0 0 18px var(--ops-cyan);
    animation: opsPulse 1.8s ease-in-out infinite;
  }

  .ops-feed {
    display: grid;
    gap: 10px;
    padding: 16px;
  }

  .ops-feed-item {
    display: grid;
    grid-template-columns: auto 1fr auto;
    gap: 12px;
    align-items: center;
    border: 1px solid rgba(255, 255, 255, 0.08);
    background: rgba(255, 255, 255, 0.035);
    padding: 12px;
    transition: border-color 180ms ease, background 180ms ease, transform 180ms ease;
  }

  .ops-feed-item:hover {
    transform: translateX(-4px);
    border-color: rgba(94, 255, 223, 0.4);
    background: rgba(94, 255, 223, 0.07);
  }

  .ops-feed-index {
    color: var(--ops-cyan);
    font-family: var(--ops-font-display);
    font-size: 1.6rem;
  }

  .ops-feed-item strong {
    display: block;
    color: var(--ops-text);
    font-size: 0.98rem;
  }

  .ops-feed-item span {
    display: block;
    margin-top: 4px;
    color: var(--ops-muted);
    font-size: 0.82rem;
  }

  .ops-tag {
    display: inline-flex;
    align-items: center;
    min-height: 26px;
    padding: 0 9px;
    border: 1px solid rgba(255, 200, 87, 0.38);
    color: var(--ops-amber);
    background: rgba(255, 200, 87, 0.08);
    font-size: 0.72rem;
    white-space: nowrap;
  }

  .ops-nav {
    position: sticky;
    top: 0;
    z-index: 10;
    display: flex;
    gap: 8px;
    overflow-x: auto;
    border-block: 1px solid rgba(94, 255, 223, 0.18);
    background: rgba(4, 11, 11, 0.88);
    backdrop-filter: blur(18px);
    padding: 10px clamp(18px, 5vw, 72px);
  }

  .ops-nav a {
    flex: 0 0 auto;
    border: 1px solid rgba(94, 255, 223, 0.2);
    color: var(--ops-muted);
    background: rgba(255, 255, 255, 0.035);
    padding: 9px 12px;
    font-weight: 800;
    font-size: 0.82rem;
    text-decoration: none;
  }

  .ops-nav a:hover,
  .ops-nav a:focus-visible {
    color: var(--ops-cyan);
    border-color: rgba(94, 255, 223, 0.58);
  }

  .ops-section {
    padding: clamp(48px, 8vw, 96px) clamp(18px, 5vw, 72px);
    position: relative;
  }

  .ops-section.dark-band {
    background: linear-gradient(180deg, rgba(2, 8, 8, 0.5), rgba(5, 18, 18, 0.88));
    border-block: 1px solid rgba(94, 255, 223, 0.12);
  }

  .ops-section-head {
    display: grid;
    grid-template-columns: minmax(0, 0.82fr) minmax(260px, 0.38fr);
    gap: 24px;
    align-items: end;
    margin-bottom: 30px;
  }

  .ops-section-eyebrow {
    color: var(--ops-amber);
    font-weight: 900;
    font-size: 0.78rem;
    text-transform: uppercase;
  }

  .ops-section h2 {
    margin: 7px 0 0;
    color: var(--ops-text);
    font-family: var(--ops-font-display);
    font-size: clamp(2.2rem, 5.8vw, 5.2rem);
    line-height: 0.9;
    letter-spacing: 0;
    text-transform: uppercase;
  }

  .ops-section-head p {
    color: var(--ops-muted);
    font-size: 0.98rem;
    line-height: 1.7;
  }

  .ops-controls {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-bottom: 22px;
  }

  .ops-filter {
    border: 1px solid rgba(94, 255, 223, 0.26);
    color: var(--ops-muted);
    background: rgba(7, 24, 24, 0.8);
    padding: 10px 12px;
    font: 800 0.78rem/1 var(--ops-font-body);
    cursor: pointer;
  }

  .ops-filter.active,
  .ops-filter:hover,
  .ops-filter:focus-visible {
    color: var(--ops-ink);
    background: var(--ops-cyan);
    border-color: var(--ops-cyan);
  }

  .ops-card-grid {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 14px;
  }

  .ops-model-card,
  .ops-agent-card,
  .ops-company-card,
  .ops-road-card {
    position: relative;
    min-height: 270px;
    display: flex;
    flex-direction: column;
    gap: 14px;
    border: 1px solid rgba(94, 255, 223, 0.22);
    background:
      linear-gradient(135deg, rgba(9, 37, 36, 0.92), rgba(5, 13, 13, 0.86)),
      radial-gradient(circle at top right, rgba(255, 200, 87, 0.1), transparent 42%);
    padding: 18px;
    overflow: hidden;
    transform: translateY(0);
    opacity: 1;
    animation: opsCardIn 560ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
    transition: transform 520ms cubic-bezier(0.2, 0.8, 0.2, 1), opacity 520ms ease, border-color 180ms ease, box-shadow 180ms ease;
  }

  .ops-model-card.visible,
  .ops-agent-card.visible,
  .ops-company-card.visible,
  .ops-road-card.visible {
    transform: translateY(0);
    opacity: 1;
  }

  .ops-model-card::before,
  .ops-agent-card::before,
  .ops-company-card::before,
  .ops-road-card::before {
    content: "";
    position: absolute;
    inset: 0;
    pointer-events: none;
    background: linear-gradient(120deg, transparent 0 44%, rgba(94, 255, 223, 0.16) 50%, transparent 56% 100%);
    transform: translateX(-120%);
    transition: transform 520ms ease;
  }

  .ops-model-card:hover,
  .ops-agent-card:hover,
  .ops-company-card:hover,
  .ops-road-card:hover {
    border-color: rgba(94, 255, 223, 0.62);
    box-shadow: 0 24px 66px rgba(0, 0, 0, 0.32), 0 0 30px rgba(94, 255, 223, 0.12);
  }

  .ops-model-card:hover::before,
  .ops-agent-card:hover::before,
  .ops-company-card:hover::before,
  .ops-road-card:hover::before {
    transform: translateX(120%);
  }

  .ops-card-top {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    gap: 12px;
  }

  .ops-card-top h3 {
    margin: 0;
    color: var(--ops-text);
    font-family: var(--ops-font-display);
    font-size: 1.75rem;
    line-height: 0.98;
    letter-spacing: 0;
  }

  .ops-card-top small {
    color: var(--ops-muted);
    font-size: 0.78rem;
  }

  .ops-card-meta {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
  }

  .ops-pill {
    display: inline-flex;
    align-items: center;
    min-height: 24px;
    border: 1px solid rgba(94, 255, 223, 0.22);
    color: #bde8e1;
    background: rgba(94, 255, 223, 0.075);
    padding: 0 8px;
    font-size: 0.72rem;
  }

  .ops-pill.hot {
    border-color: rgba(255, 200, 87, 0.38);
    color: var(--ops-amber);
    background: rgba(255, 200, 87, 0.08);
  }

  .ops-model-card p,
  .ops-agent-card p,
  .ops-company-card p,
  .ops-road-card p {
    margin: 0;
    color: #c5e5df;
    font-size: 0.92rem;
    line-height: 1.62;
  }

  .ops-link-row {
    margin-top: auto;
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
  }

  .ops-source-link {
    display: inline-flex;
    align-items: center;
    min-height: 34px;
    padding: 0 10px;
    border: 1px solid rgba(94, 255, 223, 0.28);
    color: var(--ops-cyan) !important;
    background: rgba(3, 17, 16, 0.78);
    font-size: 0.78rem;
    font-weight: 800;
    text-decoration: none;
  }

  .ops-source-link:hover,
  .ops-source-link:focus-visible {
    color: var(--ops-ink) !important;
    background: var(--ops-cyan);
  }

  .ops-intel-grid {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(300px, 0.6fr);
    gap: 16px;
  }

  .ops-panel {
    border: 1px solid rgba(94, 255, 223, 0.2);
    background: var(--ops-panel);
    padding: clamp(16px, 3vw, 24px);
  }

  .ops-panel h3 {
    margin: 0 0 12px;
    color: var(--ops-text);
    font-family: var(--ops-font-display);
    font-size: 2rem;
    line-height: 1;
    letter-spacing: 0;
  }

  .ops-heatmap {
    display: grid;
    grid-template-columns: 150px repeat(7, minmax(46px, 1fr));
    gap: 6px;
    overflow-x: auto;
  }

  .ops-heatmap div {
    min-height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 1px solid rgba(94, 255, 223, 0.13);
    color: #b8ddd7;
    font-size: 0.76rem;
    text-align: center;
    padding: 6px;
  }

  .ops-heatmap .axis {
    color: var(--ops-cyan);
    background: rgba(94, 255, 223, 0.06);
    font-weight: 900;
  }

  .ops-heatmap .heat-1 {
    background: rgba(94, 255, 223, 0.08);
  }

  .ops-heatmap .heat-2 {
    background: rgba(94, 255, 223, 0.18);
  }

  .ops-heatmap .heat-3 {
    color: var(--ops-ink);
    background: rgba(94, 255, 223, 0.74);
    font-weight: 900;
  }

  .ops-watchlist {
    display: grid;
    gap: 10px;
  }

  .ops-watch-item {
    border-left: 3px solid var(--ops-amber);
    background: rgba(255, 200, 87, 0.07);
    padding: 12px;
    color: #ffe6ad;
    font-size: 0.9rem;
    line-height: 1.5;
  }

  .ops-source-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    overflow: hidden;
    border: 1px solid rgba(94, 255, 223, 0.18);
    background: rgba(5, 18, 18, 0.72);
  }

  .ops-source-table th,
  .ops-source-table td {
    border-bottom: 1px solid rgba(94, 255, 223, 0.12);
    padding: 12px;
    color: #c7e9e3;
    font-size: 0.86rem;
    text-align: left;
    vertical-align: top;
  }

  .ops-source-table th {
    color: var(--ops-cyan);
    background: rgba(94, 255, 223, 0.08);
    font-size: 0.76rem;
    text-transform: uppercase;
  }

  .ops-source-table tr:last-child td {
    border-bottom: 0;
  }

  .ops-footer {
    padding: 36px clamp(18px, 5vw, 72px) 58px;
    border-top: 1px solid rgba(94, 255, 223, 0.18);
    color: var(--ops-muted);
    background: #030908;
  }

  .ops-footer a {
    color: var(--ops-cyan) !important;
  }

  @keyframes opsPulse {
    0%, 100% {
      transform: scale(0.9);
      opacity: 0.62;
    }

    50% {
      transform: scale(1.28);
      opacity: 1;
    }
  }

  @keyframes opsCardIn {
    from {
      transform: translateY(14px);
      opacity: 0.02;
    }

    to {
      transform: translateY(0);
      opacity: 1;
    }
  }

  @media (max-width: 1040px) {
    .ops-hero,
    .ops-section-head,
    .ops-intel-grid {
      grid-template-columns: 1fr;
    }

    .ops-command {
      justify-self: stretch;
    }

    .ops-card-grid {
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }
  }

  @media (max-width: 720px) {
    .ops-hero {
      min-height: auto;
      padding: 28px 16px 42px;
    }

    .ops-title {
      font-size: clamp(3rem, 18vw, 5.2rem);
    }

    .ops-stat-grid,
    .ops-card-grid {
      grid-template-columns: 1fr;
    }

    .ops-feed-item {
      grid-template-columns: auto 1fr;
    }

    .ops-feed-item .ops-tag {
      grid-column: 2;
      width: fit-content;
    }

    .ops-section {
      padding: 44px 16px;
    }

    .ops-heatmap {
      grid-template-columns: 116px repeat(7, 78px);
    }
  }

  @media (prefers-reduced-motion: reduce) {
    *,
    *::before,
    *::after {
      animation-duration: 1ms !important;
      transition-duration: 1ms !important;
      scroll-behavior: auto !important;
    }
  }
</style>

<div class="ops-shell">
  <section class="ops-hero" id="top">
    <canvas id="ops-radar" aria-hidden="true"></canvas>
    <div>
      <div class="ops-kicker">AI Research Intelligence Dashboard / 2026-06-21</div>
      <h1 class="ops-title">AI Research <span>War Room</span></h1>
      <p class="ops-subtitle">
        一个面向大语言模型、智能体和公司研究动向的情报面板。这里把论文、技术报告、system card、model card、官方发布、代码和权重分开标注，避免把闭源模型的安全卡误写成论文。
      </p>
      <div class="ops-hero-actions">
        <a class="ops-button" href="#frontier">查看前沿模型</a>
        <a class="ops-button ghost" href="#agents">追踪智能体论文</a>
      </div>
      <div class="ops-stat-grid" aria-label="tracker summary">
        <div class="ops-stat"><strong>30</strong><span>首批模型、论文、系统卡与路线图条目</span></div>
        <div class="ops-stat"><strong>13</strong><span>重点公司和实验室</span></div>
        <div class="ops-stat"><strong>7</strong><span>情报主题：代码、agent、reasoning、多模态等</span></div>
        <div class="ops-stat"><strong>100%</strong><span>条目附源链接并标注来源类型</span></div>
      </div>
    </div>

    <aside class="ops-command" aria-label="latest signals">
      <div class="ops-command-top">
        <span>Signal Feed</span>
        <span class="ops-pulse">live watchlist</span>
      </div>
      <div class="ops-feed" id="ops-feed"></div>
    </aside>
  </section>

  <nav class="ops-nav" aria-label="AI tracker sections">
    <a href="#frontier">Frontier Models</a>
    <a href="#closed">Closed Model Watch</a>
    <a href="#agents">Agent Papers</a>
    <a href="#companies">Company Radar</a>
    <a href="#pipeline">Pipeline</a>
    <a href="#sources">Source Ledger</a>
  </nav>

  <section class="ops-section" id="frontier">
    <div class="ops-section-head">
      <div>
        <div class="ops-section-eyebrow">Frontier Model Tracker</div>
        <h2>Open, API, weights</h2>
      </div>
      <p>
        这里优先放有官方文档、技术报告、Hugging Face 或 research page 的模型。Kimi K2.7 Code、Kimi K2.6、Qwen3.7-Max 已按最新官方页面纳入，不再停留在旧版 K2/Qwen3-Max 口径。
      </p>
    </div>
    <div class="ops-controls" id="frontier-filters" aria-label="frontier filters"></div>
    <div class="ops-card-grid" id="frontier-grid"></div>
  </section>

  <section class="ops-section dark-band" id="closed">
    <div class="ops-section-head">
      <div>
        <div class="ops-section-eyebrow">Closed Model Watch</div>
        <h2>Cards, not papers</h2>
      </div>
      <p>
        闭源模型通常没有完整论文，可信入口是 system card、model card、官方发布和 API 文档。页面会把这些来源单独标注。
      </p>
    </div>
    <div class="ops-card-grid" id="closed-grid"></div>
  </section>

  <section class="ops-section" id="agents">
    <div class="ops-section-head">
      <div>
        <div class="ops-section-eyebrow">Agent Papers</div>
        <h2>Reason, act, repair</h2>
      </div>
      <p>
        智能体方向按能力链路组织：推理行动、工具调用、多智能体协作、长期自主探索、软件工程修复和产品级 agent system card。
      </p>
    </div>
    <div class="ops-card-grid" id="agent-grid"></div>
  </section>

  <section class="ops-section dark-band" id="companies">
    <div class="ops-section-head">
      <div>
        <div class="ops-section-eyebrow">Company Radar</div>
        <h2>Institution signal map</h2>
      </div>
      <p>
        公司雷达用于回答谁在加码 agent、coding、long-context、多模态和安全评测。现阶段是人工维护的 v1，后续可接 arXiv、OpenAlex、Semantic Scholar 和公司官网。
      </p>
    </div>
    <div class="ops-intel-grid">
      <div class="ops-panel">
        <h3>Company x Topic Heatmap</h3>
        <div class="ops-heatmap" id="ops-heatmap" aria-label="company topic heatmap"></div>
      </div>
      <div class="ops-panel">
        <h3>Watchlist rules</h3>
        <div class="ops-watchlist">
          <div class="ops-watch-item">优先使用官方源、论文源和模型卡。二手榜单只做线索，不做事实字段。</div>
          <div class="ops-watch-item">闭源模型只写 system card/model card/official announcement，不强行写成 paper。</div>
          <div class="ops-watch-item">模型名存在但找不到官方确认时，进入 watchlist，不进入主 tracker。</div>
          <div class="ops-watch-item">公司归属按论文当时 affiliation 或官方发布主体，不按作者当前雇主推断。</div>
        </div>
      </div>
    </div>
  </section>

  <section class="ops-section" id="pipeline">
    <div class="ops-section-head">
      <div>
        <div class="ops-section-eyebrow">Data Pipeline Roadmap</div>
        <h2>From static radar to live intel</h2>
      </div>
      <p>
        v1 是静态情报页。下一阶段可以把采集、清洗、摘要和图谱做成自动化数据管线，逐步升级为真正的 AI research intelligence dashboard。
      </p>
    </div>
    <div class="ops-card-grid" id="roadmap-grid"></div>
  </section>

  <section class="ops-section dark-band" id="sources">
    <div class="ops-section-head">
      <div>
        <div class="ops-section-eyebrow">Source Ledger</div>
        <h2>Evidence first</h2>
      </div>
      <p>
        下面是首批高优先级来源台账。所有链接都保留原始出处，后续可以扩展成可版本化的 YAML/JSON 数据源。
      </p>
    </div>
    <div class="ops-panel">
      <table class="ops-source-table">
        <thead>
          <tr>
            <th>Source</th>
            <th>Type</th>
            <th>Use</th>
          </tr>
        </thead>
        <tbody id="source-ledger"></tbody>
      </table>
    </div>
  </section>

  <footer class="ops-footer">
    <p>
      Built for <a href="/">yanhaoming.com</a>. This v1 tracker is a curated static dashboard; source labels are intentionally conservative so the page can evolve into an automated pipeline without losing provenance.
    </p>
  </footer>
</div>

<script>
  const frontierModels = [
    {
      name: "Kimi K2.7 Code",
      org: "Moonshot AI / Kimi",
      date: "2026",
      openness: "API",
      type: "model docs",
      tags: ["coding", "agent", "long-context"],
      status: "latest",
      note: "Kimi 官方文档标注 K2.7 Code 为最强 coding model，并保留 K2.6 多模态入口。",
      links: [
        ["Quickstart", "https://platform.kimi.ai/docs/guide/kimi-k2-7-code-quickstart"],
        ["Model list", "https://platform.kimi.ai/docs/models"],
        ["K2.6", "https://platform.kimi.ai/docs/guide/kimi-k2-6-quickstart"]
      ]
    },
    {
      name: "Qwen3.7-Max",
      org: "Alibaba / Qwen",
      date: "2026-06",
      openness: "API",
      type: "official blog + docs",
      tags: ["agent", "coding", "multimodal"],
      status: "latest",
      note: "Qwen3.7-Max 是面向 agent 场景的最新旗舰线，阿里云文档列出 qwen3.7-max 与 2026-06-08 快照。",
      links: [
        ["Qwen blog", "https://qwen.ai/blog?id=qwen3.7"],
        ["Alibaba Cloud", "https://help.aliyun.com/en/lingma/product-overview/qwen3-7-max-limited-time-offer"],
        ["Model updates", "https://help.aliyun.com/zh/model-studio/newly-released-models"]
      ]
    },
    {
      name: "GLM-5.2",
      org: "Z.ai",
      date: "2026-06",
      openness: "API",
      type: "official blog + docs",
      tags: ["long-horizon", "coding", "agent"],
      status: "latest",
      note: "Z.ai 将 GLM-5.2 定位为面向 long-horizon task 的旗舰模型，支持 1M token 级工程上下文。",
      links: [
        ["Blog", "https://z.ai/blog/glm-5.2"],
        ["Docs", "https://docs.z.ai/guides/llm/glm-5.2"]
      ]
    },
    {
      name: "DeepSeek V4 Pro / Flash",
      org: "DeepSeek-AI",
      date: "2026-04-24",
      openness: "open weights + API",
      type: "official release + HF",
      tags: ["MoE", "long-context", "reasoning"],
      status: "latest",
      note: "DeepSeek V4 Preview 发布 Pro/Flash，两者支持 1M context；Pro/Flash 同时在 API 和 Hugging Face 出现。",
      links: [
        ["Release", "https://api-docs.deepseek.com/news/news260424"],
        ["Tech Report", "https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro/blob/main/DeepSeek_V4.pdf"],
        ["HF Collection", "https://huggingface.co/collections/deepseek-ai/deepseek-v4"],
        ["API updates", "https://api-docs.deepseek.com/updates"]
      ]
    },
    {
      name: "Qwen3-Coder / Qwen3",
      org: "Alibaba / Qwen",
      date: "2025-2026",
      openness: "open + API",
      type: "research page",
      tags: ["open", "coding", "reasoning"],
      status: "active",
      note: "Qwen3-Coder 是开放 agentic coding 线，Qwen3.7-Max 是闭源/API flagship watch，两条线需要分开追踪。",
      links: [
        ["Research", "https://qwen.ai/research"],
        ["Qwen3-Coder", "https://github.com/QwenLM/Qwen3-Coder"],
        ["API platform", "https://qwen.ai/apiplatform"]
      ]
    },
    {
      name: "Kimi K2.6",
      org: "Moonshot AI / Kimi",
      date: "2026",
      openness: "API",
      type: "model docs",
      tags: ["multimodal", "agent", "API"],
      status: "current",
      note: "K2.6 仍在官方快速开始和价格页中作为多模态模型入口，K2.7 Code 是 coding 最新线。",
      links: [
        ["Quickstart", "https://platform.kimi.ai/docs/guide/kimi-k2-6-quickstart"],
        ["FAQ", "https://platform.kimi.ai/docs/pricing/faq"]
      ]
    },
    {
      name: "Llama 4",
      org: "Meta",
      date: "2025",
      openness: "open weights",
      type: "official blog",
      tags: ["multimodal", "open", "MoE"],
      status: "active",
      note: "Meta 官方发布 Llama 4 系列，适合跟踪开放权重多模态路线。",
      links: [
        ["Meta AI", "https://ai.meta.com/blog/llama-4-multimodal-intelligence/"]
      ]
    },
    {
      name: "ERNIE 4.5",
      org: "Baidu",
      date: "2025",
      openness: "open/API mix",
      type: "official blog",
      tags: ["multimodal", "Chinese", "foundation"],
      status: "active",
      note: "百度 ERNIE 4.5 是中文大模型生态的重要对照样本。",
      links: [
        ["Baidu ERNIE", "https://ernie.baidu.com/blog/posts/ernie4.5/"]
      ]
    },
    {
      name: "Hunyuan-A13B",
      org: "Tencent Hunyuan",
      date: "2025",
      openness: "open weights",
      type: "model release",
      tags: ["open", "efficient", "Chinese"],
      status: "active",
      note: "腾讯混元开放模型线适合纳入中国开源模型横向对比。",
      links: [
        ["Hugging Face", "https://huggingface.co/tencent/Hunyuan-A13B-Instruct"]
      ]
    },
    {
      name: "MiniMax M1 / M2",
      org: "MiniMax",
      date: "2025",
      openness: "open weights",
      type: "technical report + code",
      tags: ["reasoning", "agent", "open"],
      status: "active",
      note: "M1 是长上下文 reasoning 基线；M2 进一步面向 agent 和 coding 优化，适合进入最新开放模型观察线。",
      links: [
        ["arXiv", "https://arxiv.org/abs/2506.13585"],
        ["M1 weights", "https://huggingface.co/MiniMaxAI/MiniMax-M1-80k"],
        ["M2 GitHub", "https://github.com/MiniMax-AI/MiniMax-M2"]
      ]
    },
    {
      name: "Mistral Devstral 2 / Magistral",
      org: "Mistral AI",
      date: "2025",
      openness: "open/API mix",
      type: "official docs + release",
      tags: ["coding", "reasoning", "open"],
      status: "active",
      note: "Devstral 2 是 Mistral 的 coding/agent 线，Magistral 是 reasoning 线，后续应跟踪 docs 中的模型版本表。",
      links: [
        ["Model docs", "https://docs.mistral.ai/models/overview"],
        ["Devstral", "https://mistral.ai/news/devstral"],
        ["Magistral", "https://mistral.ai/news/magistral"]
      ]
    },
    {
      name: "DeepSeek V3 / R1 baseline",
      org: "DeepSeek-AI",
      date: "2024-2025",
      openness: "open weights",
      type: "paper",
      tags: ["reasoning", "MoE", "baseline"],
      status: "baseline",
      note: "V4 之外仍需保留 V3/R1 论文作为架构与 reasoning 训练路线基线。",
      links: [
        ["V3 paper", "https://arxiv.org/abs/2412.19437"],
        ["R1 paper", "https://arxiv.org/abs/2501.12948"]
      ]
    }
  ];

  const closedModels = [
    {
      name: "GPT-5.5 / GPT-5.5 Pro",
      org: "OpenAI",
      date: "2026-04",
      type: "system card + official release",
      tags: ["agentic work", "coding", "tool use"],
      note: "OpenAI 官方发布 GPT-5.5，并提供 system card；这是闭源模型主事实源。",
      links: [
        ["Release", "https://openai.com/index/introducing-gpt-5-5/"],
        ["System card", "https://openai.com/index/gpt-5-5-system-card/"]
      ]
    },
    {
      name: "GPT-5.5 Instant",
      org: "OpenAI",
      date: "2026-05",
      type: "system card + product release",
      tags: ["chat", "safety", "default model"],
      note: "GPT-5.5 Instant 有单独 system card 和 ChatGPT 默认模型更新说明。",
      links: [
        ["System card", "https://openai.com/index/gpt-5-5-instant-system-card/"],
        ["Release", "https://openai.com/index/gpt-5-5-instant/"]
      ]
    },
    {
      name: "Claude Fable 5 / Mythos 5",
      org: "Anthropic",
      date: "2026-06",
      type: "system card index",
      tags: ["closed", "safety", "frontier"],
      note: "Anthropic system card index 是 Claude 系列事实源；Fable/Mythos 5 需要同时关注可用性公告和 API 文档。",
      links: [
        ["System cards", "https://www.anthropic.com/system-cards"],
        ["API docs", "https://platform.claude.com/docs/en/about-claude/models/introducing-claude-fable-5-and-claude-mythos-5"]
      ]
    },
    {
      name: "Claude Opus 4.8",
      org: "Anthropic",
      date: "2026-05",
      type: "system card index",
      tags: ["coding", "agent", "closed"],
      note: "Claude Opus 4.8 在 Anthropic system card index 中列为 2026 年 5 月条目。",
      links: [
        ["System cards", "https://www.anthropic.com/system-cards"]
      ]
    },
    {
      name: "Gemini 3.1 Pro",
      org: "Google DeepMind",
      date: "2026-02 updated",
      type: "model card",
      tags: ["multimodal", "reasoning", "long-context"],
      note: "DeepMind model card 将 Gemini 3.1 Pro 标注为 Gemini 3 系列的高能力多模态推理模型。",
      links: [
        ["Model card", "https://deepmind.google/models/model-cards/gemini-3-1-pro/"],
        ["Card index", "https://deepmind.google/models/model-cards/"]
      ]
    },
    {
      name: "Grok 4.3 / 4.1 baseline",
      org: "xAI",
      date: "2026",
      type: "API docs + model card",
      tags: ["reasoning", "tool use", "API"],
      note: "dmux 研究报告显示 4.1 是上一代 model card 基线，当前 API 线应追踪 Grok 4.3；AWS Bedrock 提供可访问 model card。",
      links: [
        ["AWS model card", "https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-xai-grok-4-3.html"],
        ["xAI docs", "https://docs.x.ai/developers/models/grok-4.3"],
        ["4.1 card PDF", "https://data.x.ai/2025-11-17-grok-4-1-model-card.pdf"]
      ]
    },
    {
      name: "Apple Foundation Models 3",
      org: "Apple",
      date: "2026-06",
      type: "research page",
      tags: ["on-device", "privacy", "closed"],
      note: "Apple AFM 3 是 Apple Intelligence 路线的最新研究入口；完整技术报告需要后续跟踪。",
      links: [
        ["AFM 3", "https://machinelearning.apple.com/research/introducing-third-generation-of-apple-foundation-models"],
        ["2025 report", "https://machinelearning.apple.com/research/apple-foundation-models-tech-report-2025"]
      ]
    },
    {
      name: "Amazon Nova 2",
      org: "Amazon / AWS",
      date: "2025-12",
      type: "AI service card",
      tags: ["multimodal", "enterprise", "safety"],
      note: "AWS AI Service Cards 是 Nova 2 系列的可信来源，适合闭源模型的企业责任信息跟踪。",
      links: [
        ["Nova models", "https://aws.amazon.com/nova/models/"],
        ["Nova 2 Lite card", "https://docs.aws.amazon.com/ai/responsible-ai/nova-2-lite/overview.html"]
      ]
    }
  ];

  const agentPapers = [
    {
      name: "ReAct",
      org: "Google Research / Princeton",
      date: "2022",
      type: "paper",
      tags: ["reasoning", "acting", "tool use"],
      note: "把 reasoning trace 与 actions 交织，是 agent 论文谱系的起点之一。",
      links: [["arXiv", "https://arxiv.org/abs/2210.03629"]]
    },
    {
      name: "Toolformer",
      org: "Meta AI",
      date: "2023",
      type: "paper",
      tags: ["tool use", "self-supervision"],
      note: "研究模型如何自监督学习调用外部工具。",
      links: [["arXiv", "https://arxiv.org/abs/2302.04761"]]
    },
    {
      name: "Voyager",
      org: "NVIDIA / Caltech / UT Austin",
      date: "2023",
      type: "paper + code",
      tags: ["lifelong", "embodied", "memory"],
      note: "开放式 embodied agent 代表作，强调技能库和长期探索。",
      links: [["arXiv", "https://arxiv.org/abs/2305.16291"], ["GitHub", "https://github.com/MineDojo/Voyager"]]
    },
    {
      name: "AutoGen",
      org: "Microsoft Research",
      date: "2023",
      type: "paper + framework",
      tags: ["multi-agent", "conversation"],
      note: "多智能体会话框架，适合观察企业级 agent 编排趋势。",
      links: [["arXiv", "https://arxiv.org/abs/2308.08155"], ["GitHub", "https://github.com/microsoft/autogen"]]
    },
    {
      name: "SWE-agent",
      org: "Princeton",
      date: "2024",
      type: "paper + code",
      tags: ["coding", "repair", "software"],
      note: "将 agent-computer interface 用于真实 GitHub issue 修复，是 coding agent 评测基线。",
      links: [["arXiv", "https://arxiv.org/abs/2405.15793"], ["GitHub", "https://github.com/SWE-agent/SWE-agent"]]
    },
    {
      name: "ChatGPT Agent",
      org: "OpenAI",
      date: "2025",
      type: "system card",
      tags: ["computer use", "web", "tools"],
      note: "产品级 agent system card，用于跟踪闭源 agent 安全边界和工具能力。",
      links: [["System card", "https://openai.com/index/chatgpt-agent-system-card/"]]
    }
  ];

  const roadmap = [
    {
      name: "Ingest",
      org: "arXiv / OpenAlex / Semantic Scholar",
      date: "phase 1",
      type: "data source",
      tags: ["metadata", "authors", "institutions"],
      note: "先用 API 和开放数据拉取论文、作者、机构、引用和主题，不依赖高风险网页爬虫。",
      links: [["OpenAlex", "https://developers.openalex.org/api-reference/introduction"], ["Semantic Scholar", "https://api.semanticscholar.org/api-docs/"], ["arXiv", "https://info.arxiv.org/help/api/user-manual.html"]]
    },
    {
      name: "Resolve",
      org: "ROR / ORCID / affiliation rules",
      date: "phase 2",
      type: "normalization",
      tags: ["company", "author", "confidence"],
      note: "公司归属按 ROR/OpenAlex ID、alias 和低置信度人工校验，不用作者当前雇主推断历史论文。",
      links: [["ROR", "https://ror.org/"], ["ORCID", "https://info.orcid.org/what-is-orcid/services/public-api/"]]
    },
    {
      name: "Summarize",
      org: "LLM layer",
      date: "phase 3",
      type: "AI enrichment",
      tags: ["summary", "topic", "why it matters"],
      note: "LLM 只做摘要、贡献点、主题标签和链接抽取；事实字段必须来自结构化或官方来源。",
      links: [["OpenAI research", "https://openai.com/research/"], ["Anthropic research", "https://www.anthropic.com/research"]]
    },
    {
      name: "Visualize",
      org: "ECharts / Cytoscape.js",
      date: "phase 4",
      type: "dashboard",
      tags: ["heatmap", "network", "trend"],
      note: "公司 x 主题热力图、作者合作网络、引用网络和周报/月报是情报平台的产品壁垒。",
      links: [["ECharts", "https://echarts.apache.org/"], ["Cytoscape.js", "https://js.cytoscape.org/"]]
    }
  ];

  const heatmapCompanies = ["OpenAI", "Anthropic", "Google", "Meta", "Z.ai", "DeepSeek", "Alibaba", "Moonshot"];
  const heatmapTopics = ["Agent", "Coding", "Reasoning", "Long ctx", "Vision", "Open", "Safety"];
  const heatmapScores = {
    OpenAI: [3, 3, 3, 3, 2, 0, 3],
    Anthropic: [3, 3, 3, 2, 2, 0, 3],
    Google: [3, 2, 3, 3, 3, 0, 3],
    Meta: [2, 2, 2, 2, 3, 3, 2],
    "Z.ai": [3, 3, 2, 3, 2, 0, 1],
    DeepSeek: [2, 2, 3, 3, 0, 3, 1],
    Alibaba: [3, 3, 3, 3, 3, 3, 1],
    Moonshot: [3, 3, 2, 2, 3, 0, 1]
  };

  const sourceLedger = [
    ["Kimi K2.7 Code / K2.6", "model docs", "https://platform.kimi.ai/docs/models", "latest Kimi coding and multimodal API lineage"],
    ["Qwen3.7-Max", "official blog + docs", "https://qwen.ai/blog?id=qwen3.7", "latest Qwen agent flagship line"],
    ["GLM-5.2", "official blog", "https://z.ai/blog/glm-5.2", "Z.ai long-horizon flagship model"],
    ["DeepSeek V4", "official release + report", "https://api-docs.deepseek.com/news/news260424", "open/API DeepSeek V4 Pro and Flash"],
    ["GPT-5.5", "system card", "https://openai.com/index/gpt-5-5-system-card/", "closed model safety and capability source"],
    ["Claude system cards", "system card index", "https://www.anthropic.com/system-cards", "Anthropic closed model source ledger"],
    ["Gemini 3.1 Pro", "model card", "https://deepmind.google/models/model-cards/gemini-3-1-pro/", "Google DeepMind closed model card"],
    ["Grok 4.3", "model card", "https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-xai-grok-4-3.html", "current xAI model-card source via AWS Bedrock"],
    ["ReAct", "paper", "https://arxiv.org/abs/2210.03629", "agent reasoning/action foundation"],
    ["SWE-agent", "paper + code", "https://arxiv.org/abs/2405.15793", "software-engineering agent baseline"]
  ];

  function modelCard(item, className) {
    const tags = item.tags.map((tag, index) => `<span class="ops-pill ${index === 0 ? "hot" : ""}">${tag}</span>`).join("");
    const links = item.links.map(([label, url]) => `<a class="ops-source-link" href="${url}" target="_blank" rel="noopener">${label}</a>`).join("");
    return `
      <article class="${className}" data-tags="${item.tags.join(" ")} ${item.openness || ""}">
        <div class="ops-card-top">
          <div>
            <h3>${item.name}</h3>
            <small>${item.org} / ${item.date}</small>
          </div>
          <span class="ops-tag">${item.type}</span>
        </div>
        <div class="ops-card-meta">${tags}</div>
        <p>${item.note}</p>
        <div class="ops-link-row">${links}</div>
      </article>
    `;
  }

  function renderCards(target, data, className) {
    document.querySelector(target).innerHTML = data.map((item) => modelCard(item, className)).join("");
  }

  function renderFilters() {
    const filters = ["all", "coding", "agent", "long-context", "multimodal", "open", "API", "reasoning"];
    const wrap = document.querySelector("#frontier-filters");
    wrap.innerHTML = filters.map((filter, index) => `<button class="ops-filter ${index === 0 ? "active" : ""}" data-filter="${filter}">${filter}</button>`).join("");
    wrap.addEventListener("click", (event) => {
      const button = event.target.closest("button");
      if (!button) return;
      wrap.querySelectorAll("button").forEach((el) => el.classList.remove("active"));
      button.classList.add("active");
      const filter = button.dataset.filter;
      document.querySelectorAll("#frontier-grid .ops-model-card").forEach((card) => {
        const tags = card.dataset.tags.toLowerCase();
        card.style.display = filter === "all" || tags.includes(filter.toLowerCase()) ? "flex" : "none";
      });
    });
  }

  function renderFeed() {
    const feed = [
      ["Kimi K2.7 Code", "Kimi 最新 coding model 已进入官方模型列表", "API"],
      ["Qwen3.7-Max", "面向 agent 的 Qwen 旗舰线，阿里云列出 2026-06 快照", "agent"],
      ["GLM-5.2", "Z.ai long-horizon flagship，强调 1M 工程上下文", "long ctx"],
      ["DeepSeek V4", "Pro/Flash 支持 1M context，API 与 HF 同步出现", "weights"],
      ["GPT-5.5", "OpenAI system card 是闭源模型事实入口", "card"]
    ];
    document.querySelector("#ops-feed").innerHTML = feed.map((item, index) => `
      <div class="ops-feed-item">
        <div class="ops-feed-index">${String(index + 1).padStart(2, "0")}</div>
        <div><strong>${item[0]}</strong><span>${item[1]}</span></div>
        <span class="ops-tag">${item[2]}</span>
      </div>
    `).join("");
  }

  function renderHeatmap() {
    const heatmap = document.querySelector("#ops-heatmap");
    const header = ["Company", ...heatmapTopics].map((label) => `<div class="axis">${label}</div>`).join("");
    const rows = heatmapCompanies.map((company) => {
      const cells = heatmapScores[company].map((score) => `<div class="heat-${score}">${score === 0 ? "-" : score}</div>`).join("");
      return `<div class="axis">${company}</div>${cells}`;
    }).join("");
    heatmap.innerHTML = header + rows;
  }

  function renderSources() {
    document.querySelector("#source-ledger").innerHTML = sourceLedger.map(([name, type, url, use]) => `
      <tr>
        <td><a class="ops-source-link" href="${url}" target="_blank" rel="noopener">${name}</a></td>
        <td>${type}</td>
        <td>${use}</td>
      </tr>
    `).join("");
  }

  function revealCards() {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("visible");
          observer.unobserve(entry.target);
        }
      });
    }, { threshold: 0.12 });
    document.querySelectorAll(".ops-model-card, .ops-agent-card, .ops-company-card, .ops-road-card").forEach((card) => observer.observe(card));
  }

  function drawRadar() {
    const canvas = document.querySelector("#ops-radar");
    const ctx = canvas.getContext("2d");
    const reduced = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
    let width = 0;
    let height = 0;
    let particles = [];
    let tick = 0;

    function resize() {
      width = canvas.width = Math.floor(window.innerWidth * window.devicePixelRatio);
      height = canvas.height = Math.floor(Math.max(window.innerHeight * 0.92, 620) * window.devicePixelRatio);
      canvas.style.height = `${height / window.devicePixelRatio}px`;
      const count = Math.min(78, Math.max(36, Math.floor(window.innerWidth / 18)));
      particles = Array.from({ length: count }, (_, index) => ({
        x: Math.random() * width,
        y: Math.random() * height,
        r: (1.5 + Math.random() * 3) * window.devicePixelRatio,
        vx: (Math.random() - 0.5) * 0.42 * window.devicePixelRatio,
        vy: (Math.random() - 0.5) * 0.42 * window.devicePixelRatio,
        hot: index % 9 === 0
      }));
    }

    function frame() {
      tick += 0.008;
      ctx.clearRect(0, 0, width, height);
      ctx.fillStyle = "rgba(3, 10, 10, 0.18)";
      ctx.fillRect(0, 0, width, height);

      const cx = width * 0.72;
      const cy = height * 0.45;
      const radius = Math.min(width, height) * 0.31;
      ctx.save();
      ctx.translate(cx, cy);
      for (let ring = 1; ring <= 5; ring += 1) {
        ctx.beginPath();
        ctx.strokeStyle = `rgba(94, 255, 223, ${0.09 + ring * 0.018})`;
        ctx.lineWidth = window.devicePixelRatio;
        ctx.arc(0, 0, (radius / 5) * ring, 0, Math.PI * 2);
        ctx.stroke();
      }
      for (let spoke = 0; spoke < 12; spoke += 1) {
        const angle = (Math.PI * 2 * spoke) / 12;
        ctx.beginPath();
        ctx.strokeStyle = "rgba(94, 255, 223, 0.08)";
        ctx.moveTo(0, 0);
        ctx.lineTo(Math.cos(angle) * radius, Math.sin(angle) * radius);
        ctx.stroke();
      }
      const sweep = tick * Math.PI * 2;
      const grad = ctx.createRadialGradient(0, 0, 0, 0, 0, radius);
      grad.addColorStop(0, "rgba(94, 255, 223, 0.28)");
      grad.addColorStop(1, "rgba(94, 255, 223, 0)");
      ctx.rotate(sweep);
      ctx.beginPath();
      ctx.moveTo(0, 0);
      ctx.arc(0, 0, radius, -0.08, 0.34);
      ctx.closePath();
      ctx.fillStyle = grad;
      ctx.fill();
      ctx.restore();

      particles.forEach((particle, index) => {
        if (!reduced) {
          particle.x += particle.vx;
          particle.y += particle.vy;
          if (particle.x < 0 || particle.x > width) particle.vx *= -1;
          if (particle.y < 0 || particle.y > height) particle.vy *= -1;
        }
        for (let next = index + 1; next < particles.length; next += 1) {
          const other = particles[next];
          const dx = particle.x - other.x;
          const dy = particle.y - other.y;
          const distance = Math.hypot(dx, dy);
          if (distance < 150 * window.devicePixelRatio) {
            ctx.beginPath();
            ctx.strokeStyle = `rgba(94, 255, 223, ${0.16 - distance / (1000 * window.devicePixelRatio)})`;
            ctx.lineWidth = 0.8 * window.devicePixelRatio;
            ctx.moveTo(particle.x, particle.y);
            ctx.lineTo(other.x, other.y);
            ctx.stroke();
          }
        }
        ctx.beginPath();
        ctx.fillStyle = particle.hot ? "rgba(255, 200, 87, 0.9)" : "rgba(94, 255, 223, 0.82)";
        ctx.arc(particle.x, particle.y, particle.r, 0, Math.PI * 2);
        ctx.fill();
      });

      if (!reduced) requestAnimationFrame(frame);
    }

    resize();
    window.addEventListener("resize", resize);
    frame();
  }

  renderFeed();
  renderCards("#frontier-grid", frontierModels, "ops-model-card");
  renderCards("#closed-grid", closedModels, "ops-model-card");
  renderCards("#agent-grid", agentPapers, "ops-agent-card");
  renderCards("#roadmap-grid", roadmap, "ops-road-card");
  renderFilters();
  renderHeatmap();
  renderSources();
  revealCards();
  drawRadar();
</script>
