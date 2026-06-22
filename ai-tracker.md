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

  .ops-pagination {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 10px;
    margin-top: 16px;
    min-height: 42px;
  }

  .ops-ecosystem-card .ops-pagination {
    margin-top: 0;
  }

  .ops-ecosystem-card .ops-page-button,
  .ops-ecosystem-card .ops-page-status {
    min-height: 34px;
    font-size: 0.72rem;
  }

  .ops-page-button {
    min-height: 38px;
    border: 1px solid rgba(94, 255, 223, 0.28);
    color: var(--ops-text);
    background: rgba(8, 31, 31, 0.78);
    padding: 0 12px;
    font: 900 0.78rem/1 var(--ops-font-body);
    cursor: pointer;
  }

  .ops-page-button:hover,
  .ops-page-button:focus-visible {
    color: var(--ops-ink);
    background: var(--ops-cyan);
    outline: none;
  }

  .ops-page-button:disabled {
    cursor: not-allowed;
    color: rgba(146, 185, 179, 0.58);
    border-color: rgba(94, 255, 223, 0.12);
    background: rgba(255, 255, 255, 0.03);
  }

  .ops-page-status {
    min-height: 38px;
    display: inline-flex;
    align-items: center;
    border: 1px solid rgba(255, 200, 87, 0.24);
    color: var(--ops-amber);
    background: rgba(255, 200, 87, 0.07);
    padding: 0 12px;
    font-size: 0.8rem;
    font-weight: 900;
  }

  .ops-page-meter {
    position: relative;
    flex: 1 1 160px;
    max-width: 280px;
    height: 8px;
    border: 1px solid rgba(94, 255, 223, 0.18);
    background: rgba(4, 16, 15, 0.82);
    overflow: hidden;
  }

  .ops-page-meter span {
    position: absolute;
    inset: 0 auto 0 0;
    width: var(--page-progress, 0%);
    background: linear-gradient(90deg, var(--ops-cyan), var(--ops-amber));
    box-shadow: 0 0 18px rgba(94, 255, 223, 0.35);
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

  .ops-system-grid {
    display: grid;
    grid-template-columns: minmax(220px, 0.34fr) minmax(0, 1fr);
    gap: 16px;
  }

  .ops-layer-rail,
  .ops-layer-detail,
  .ops-benchmark-shell,
  .ops-corpus-shell,
  .ops-people-shell,
  .ops-ecosystem-shell {
    border: 1px solid rgba(94, 255, 223, 0.18);
    background: linear-gradient(180deg, rgba(5, 24, 23, 0.92), rgba(4, 14, 13, 0.72));
    box-shadow: 0 22px 80px rgba(0, 0, 0, 0.28);
  }

  .ops-layer-rail {
    padding: 12px;
  }

  .ops-layer-button,
  .ops-mini-button,
  .ops-drill-button,
  .ops-back-button,
  .ops-close-button {
    border: 1px solid rgba(94, 255, 223, 0.24);
    color: var(--ops-text);
    background: rgba(8, 31, 31, 0.72);
    font: 800 0.84rem/1 var(--ops-font-body);
    letter-spacing: 0;
    cursor: pointer;
    transition: transform 160ms ease, border-color 160ms ease, box-shadow 160ms ease, background 160ms ease;
  }

  .ops-layer-button {
    display: grid;
    width: 100%;
    gap: 8px;
    padding: 14px;
    text-align: left;
  }

  .ops-layer-button + .ops-layer-button {
    margin-top: 10px;
  }

  .ops-layer-button strong {
    color: var(--ops-cyan);
    font-size: 0.98rem;
  }

  .ops-layer-button span {
    color: var(--ops-muted);
    font-weight: 600;
    line-height: 1.35;
  }

  .ops-layer-button.active,
  .ops-layer-button:hover,
  .ops-layer-button:focus-visible,
  .ops-mini-button:hover,
  .ops-mini-button:focus-visible,
  .ops-drill-button:hover,
  .ops-drill-button:focus-visible,
  .ops-back-button:hover,
  .ops-back-button:focus-visible,
  .ops-close-button:hover,
  .ops-close-button:focus-visible {
    transform: translateY(-1px);
    border-color: rgba(94, 255, 223, 0.72);
    box-shadow: 0 0 28px rgba(94, 255, 223, 0.18);
    outline: none;
  }

  .ops-layer-button.active {
    background: linear-gradient(135deg, rgba(94, 255, 223, 0.2), rgba(255, 200, 87, 0.1));
  }

  .ops-layer-detail {
    min-height: 520px;
    padding: clamp(18px, 3vw, 28px);
    position: relative;
    overflow: hidden;
  }

  .ops-layer-detail::before {
    content: "";
    position: absolute;
    inset: 0;
    pointer-events: none;
    background:
      linear-gradient(90deg, rgba(94, 255, 223, 0.06), transparent 24%),
      repeating-linear-gradient(0deg, transparent 0 12px, rgba(255, 255, 255, 0.02) 13px);
  }

  .ops-layer-body {
    position: relative;
    z-index: 1;
  }

  .ops-layer-body h3,
  .ops-drawer-body h3 {
    margin: 0 0 12px;
    color: var(--ops-text);
    font-family: var(--ops-font-display);
    font-size: clamp(1.7rem, 4vw, 3.1rem);
    line-height: 0.95;
    text-transform: uppercase;
  }

  .ops-layer-body p,
  .ops-drawer-body p {
    color: #c9ece7;
    line-height: 1.7;
  }

  .ops-mini-grid,
  .ops-method-grid,
  .ops-figure-grid,
  .ops-corpus-grid,
  .ops-people-grid,
  .ops-ecosystem-grid,
  .ops-stage-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
    gap: 12px;
  }

  .ops-mini-card,
  .ops-method-card,
  .ops-figure-card,
  .ops-corpus-card,
  .ops-people-card,
  .ops-ecosystem-card,
  .ops-benchmark-card,
  .ops-stage-card {
    border: 1px solid rgba(94, 255, 223, 0.16);
    background: rgba(4, 16, 15, 0.72);
    padding: 14px;
    min-width: 0;
  }

  .ops-mini-card strong,
  .ops-method-card strong,
  .ops-corpus-card strong,
  .ops-people-card strong,
  .ops-ecosystem-card strong,
  .ops-benchmark-card strong,
  .ops-stage-card strong {
    display: block;
    color: var(--ops-amber);
    margin-bottom: 6px;
  }

  .ops-mini-card span,
  .ops-method-card span,
  .ops-corpus-card span,
  .ops-people-card span,
  .ops-ecosystem-card span,
  .ops-benchmark-card span,
  .ops-stage-card span {
    display: block;
    color: var(--ops-muted);
    line-height: 1.5;
  }

  .ops-mini-button,
  .ops-drill-button,
  .ops-back-button {
    min-height: 36px;
    padding: 0 11px;
  }

  .ops-mini-actions,
  .ops-tab-row,
  .ops-score-filters {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    margin: 14px 0;
  }

  .ops-benchmark-shell,
  .ops-corpus-shell,
  .ops-people-shell,
  .ops-ecosystem-shell {
    padding: clamp(14px, 3vw, 22px);
  }

  .ops-table-wrap {
    width: 100%;
    overflow-x: auto;
    border: 1px solid rgba(94, 255, 223, 0.14);
    background: rgba(2, 9, 9, 0.52);
  }

  .ops-score-table {
    width: 100%;
    min-width: 980px;
    border-collapse: collapse;
    color: var(--ops-text);
  }

  .ops-score-table th,
  .ops-score-table td {
    padding: 12px 10px;
    border-bottom: 1px solid rgba(94, 255, 223, 0.1);
    text-align: left;
    vertical-align: top;
    font-size: 0.9rem;
  }

  .ops-score-table th {
    color: var(--ops-cyan);
    background: rgba(94, 255, 223, 0.08);
  }

  .ops-score-table .best {
    color: var(--ops-ink);
    background: var(--ops-amber);
    font-weight: 900;
  }

  .ops-score-table button {
    color: var(--ops-cyan);
    border: 0;
    background: transparent;
    padding: 0;
    font: inherit;
    font-weight: 900;
    cursor: pointer;
    text-align: left;
  }

  .ops-method-card {
    display: flex;
    flex-direction: column;
    min-height: 238px;
  }

  .ops-method-card .ops-link-row {
    margin-top: auto;
  }

  .ops-stage,
  .ops-source-type {
    width: fit-content;
    margin-bottom: 10px;
    border: 1px solid rgba(255, 200, 87, 0.36);
    color: var(--ops-amber);
    padding: 5px 8px;
    font-size: 0.76rem;
    font-weight: 900;
    text-transform: uppercase;
  }

  .ops-source-type {
    border-color: rgba(94, 255, 223, 0.26);
    color: var(--ops-cyan);
  }

  .ops-figure-card {
    padding: 0;
    overflow: hidden;
  }

  .ops-figure-card img {
    display: block;
    width: 100%;
    aspect-ratio: 16 / 10;
    object-fit: contain;
    background: rgba(2, 8, 8, 0.96);
    border-bottom: 1px solid rgba(94, 255, 223, 0.14);
  }

  .ops-figure-card div {
    padding: 14px;
  }

  .ops-corpus-card {
    display: grid;
    grid-template-rows: auto auto 1fr auto;
    min-height: 230px;
  }

  .ops-people-shell {
    display: grid;
    gap: 16px;
  }

  .ops-people-grid {
    grid-template-columns: repeat(auto-fit, minmax(270px, 1fr));
  }

  .ops-people-card {
    display: grid;
    grid-template-rows: auto auto 1fr auto;
    min-height: 280px;
    position: relative;
    overflow: hidden;
  }

  .ops-people-card::before {
    content: "";
    position: absolute;
    inset: 0;
    pointer-events: none;
    background:
      radial-gradient(circle at 18% 12%, rgba(255, 200, 87, 0.14), transparent 24%),
      linear-gradient(135deg, rgba(94, 255, 223, 0.07), transparent 42%);
  }

  .ops-people-card > * {
    position: relative;
    z-index: 1;
  }

  .ops-people-meta,
  .ops-people-chips,
  .ops-people-row {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
  }

  .ops-people-meta {
    margin-bottom: 10px;
  }

  .ops-people-pill,
  .ops-person-chip {
    border: 1px solid rgba(94, 255, 223, 0.22);
    background: rgba(94, 255, 223, 0.08);
    color: #dffdf7;
    padding: 5px 8px;
    font-size: 0.74rem;
    font-weight: 900;
    text-transform: uppercase;
  }

  .ops-person-chip {
    border-color: rgba(255, 200, 87, 0.3);
    background: rgba(255, 200, 87, 0.09);
    color: #ffe6ad;
    text-transform: none;
  }

  .ops-people-note {
    color: #c9ece7;
    line-height: 1.6;
    margin: 10px 0 12px;
  }

  .ops-people-matrix {
    display: grid;
    gap: 10px;
  }

  .ops-people-matrix-row {
    display: grid;
    grid-template-columns: minmax(150px, 0.24fr) minmax(0, 1fr) minmax(140px, 0.2fr);
    gap: 10px;
    align-items: stretch;
    border: 1px solid rgba(94, 255, 223, 0.14);
    background: rgba(2, 9, 9, 0.5);
    padding: 10px;
  }

  .ops-people-matrix-row strong {
    color: var(--ops-cyan);
  }

  .ops-people-matrix-row span {
    color: var(--ops-muted);
    line-height: 1.45;
  }

  .ops-ecosystem-summary {
    display: grid;
    grid-template-columns: repeat(5, minmax(120px, 1fr));
    gap: 10px;
    margin-bottom: 18px;
  }

  .ops-ecosystem-stat {
    border: 1px solid rgba(94, 255, 223, 0.2);
    background:
      linear-gradient(180deg, rgba(8, 31, 31, 0.82), rgba(3, 12, 12, 0.7)),
      radial-gradient(circle at 82% 12%, rgba(255, 200, 87, 0.12), transparent 34%);
    padding: 13px;
    min-width: 0;
  }

  .ops-ecosystem-stat strong {
    display: block;
    color: var(--ops-cyan);
    font-family: var(--ops-font-display);
    font-size: 2rem;
    line-height: 1;
  }

  .ops-ecosystem-stat span {
    display: block;
    margin-top: 7px;
    color: var(--ops-muted);
    font-size: 0.76rem;
    line-height: 1.35;
  }

  .ops-ecosystem-shell {
    display: grid;
    gap: 16px;
    min-width: 0;
  }

  .ops-ecosystem-grid {
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    width: 100%;
    min-width: 0;
  }

  .ops-ecosystem-shell .ops-panel {
    min-width: 0;
  }

  .ops-ecosystem-card {
    position: relative;
    display: grid;
    gap: 12px;
    min-height: 290px;
    overflow: hidden;
    background:
      linear-gradient(135deg, rgba(9, 37, 36, 0.9), rgba(4, 12, 12, 0.88)),
      repeating-linear-gradient(90deg, rgba(94, 255, 223, 0.04) 0 1px, transparent 1px 14px);
    animation: opsCardIn 560ms cubic-bezier(0.2, 0.8, 0.2, 1) both;
  }

  .ops-ecosystem-card::before {
    content: "";
    position: absolute;
    inset: -40% auto auto -20%;
    width: 62%;
    aspect-ratio: 1;
    border: 1px solid rgba(94, 255, 223, 0.12);
    border-radius: 999px;
    box-shadow: 0 0 54px rgba(94, 255, 223, 0.08);
    pointer-events: none;
  }

  .ops-ecosystem-card > * {
    position: relative;
    z-index: 1;
    min-width: 0;
  }

  .ops-ecosystem-top {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    gap: 12px;
  }

  .ops-ecosystem-count {
    flex: 0 0 auto;
    color: var(--ops-ink);
    background: var(--ops-amber);
    padding: 6px 9px;
    font: 900 0.84rem/1 var(--ops-font-body);
  }

  .ops-partner-cloud,
  .ops-ecosystem-flags {
    display: flex;
    flex-wrap: wrap;
    gap: 7px;
  }

  .ops-partner-token {
    border: 1px solid rgba(94, 255, 223, 0.2);
    color: #dffdf7;
    background: rgba(94, 255, 223, 0.07);
    padding: 6px 8px;
    font: 800 0.74rem/1.2 var(--ops-font-body);
    cursor: pointer;
    max-width: 100%;
    overflow-wrap: anywhere;
  }

  .ops-partner-token:hover,
  .ops-partner-token:focus-visible {
    color: var(--ops-ink);
    background: var(--ops-cyan);
    outline: none;
  }

  .ops-ecosystem-card p,
  .ops-ecosystem-note {
    margin: 0;
    color: #c9ece7;
    line-height: 1.58;
    overflow-wrap: anywhere;
  }

  .ops-ecosystem-table {
    width: 100%;
    min-width: 860px;
    border-collapse: collapse;
  }

  .ops-ecosystem-table th,
  .ops-ecosystem-table td {
    border-bottom: 1px solid rgba(94, 255, 223, 0.12);
    padding: 11px;
    color: #c7e9e3;
    font-size: 0.86rem;
    text-align: left;
    vertical-align: top;
  }

  .ops-ecosystem-table th {
    color: var(--ops-cyan);
    background: rgba(94, 255, 223, 0.08);
    text-transform: uppercase;
  }

  .ops-ecosystem-table .listed {
    color: var(--ops-ink);
    background: rgba(255, 200, 87, 0.86);
    font-weight: 900;
  }

  .ops-ecosystem-table .partial {
    color: var(--ops-amber);
    background: rgba(255, 200, 87, 0.08);
    font-weight: 900;
  }

  .ops-drawer[hidden] {
    display: none;
  }

  .ops-drawer {
    position: fixed;
    inset: 0;
    z-index: 30;
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(320px, 920px);
    background: rgba(0, 0, 0, 0.48);
  }

  .ops-drawer-scrim {
    min-width: 0;
  }

  .ops-drawer-panel {
    border-left: 1px solid rgba(94, 255, 223, 0.34);
    background:
      linear-gradient(180deg, rgba(5, 20, 20, 0.98), rgba(3, 10, 10, 0.98)),
      repeating-linear-gradient(0deg, transparent 0 12px, rgba(94, 255, 223, 0.03) 13px);
    box-shadow: -30px 0 80px rgba(0, 0, 0, 0.45);
    overflow-y: auto;
  }

  .ops-drawer-head {
    position: sticky;
    top: 0;
    z-index: 2;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 10px;
    padding: 14px;
    border-bottom: 1px solid rgba(94, 255, 223, 0.16);
    background: rgba(5, 20, 20, 0.98);
  }

  .ops-crumb {
    color: var(--ops-muted);
    font-size: 0.86rem;
    font-weight: 800;
    min-width: 0;
  }

  .ops-close-button {
    width: 38px;
    height: 38px;
    color: var(--ops-cyan);
    font-size: 1.25rem;
  }

  .ops-drawer-body {
    padding: clamp(18px, 4vw, 32px);
  }

  .ops-detail-list {
    margin: 18px 0;
    padding: 0;
    list-style: none;
    display: grid;
    gap: 10px;
  }

  .ops-detail-list li {
    border-left: 2px solid var(--ops-cyan);
    padding: 8px 0 8px 12px;
    color: #cceee8;
    background: rgba(94, 255, 223, 0.05);
  }

  .ops-model-card .ops-drill-button,
  .ops-agent-card .ops-drill-button,
  .ops-road-card .ops-drill-button {
    margin-top: 4px;
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
    .ops-intel-grid,
    .ops-system-grid {
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
    .ops-ecosystem-summary,
    .ops-card-grid,
    .ops-ecosystem-grid {
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

    .ops-people-matrix-row {
      grid-template-columns: 1fr;
    }

    .ops-drawer {
      grid-template-columns: 1fr;
      align-items: end;
    }

    .ops-drawer-scrim {
      display: none;
    }

    .ops-drawer-panel {
      max-height: 88vh;
      border-left: 0;
      border-top: 1px solid rgba(94, 255, 223, 0.34);
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
      <div class="ops-kicker">AI Research Intelligence Dashboard / 2026-06-22</div>
      <h1 class="ops-title">AI Research <span>War Room</span></h1>
      <p class="ops-subtitle">
        一个面向大语言模型、智能体和公司研究动向的情报面板。这里把论文、技术报告、system card、model card、官方发布、代码和权重分开标注，避免把闭源模型的安全卡误写成论文。
      </p>
      <div class="ops-hero-actions">
        <a class="ops-button" href="#system">进入多层情报系统</a>
        <a class="ops-button ghost" href="#benchmarks">查看 benchmark 雷达</a>
      </div>
      <div class="ops-stat-grid" aria-label="tracker summary">
        <div class="ops-stat"><strong>80+</strong><span>模型、论文、system card、model card、blog 与报告条目</span></div>
        <div class="ops-stat"><strong>2026</strong><span>顶级实验室大模型本体报告 corpus</span></div>
        <div class="ops-stat"><strong>25+</strong><span>benchmark 与训练方法可交叉跳转</span></div>
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
    <a href="#system">System</a>
    <a href="#corpus">2026 Corpus</a>
    <a href="#frontier">Frontier Models</a>
    <a href="#benchmarks">Benchmarks</a>
    <a href="#methods">Methods</a>
    <a href="#figures">Figures</a>
    <a href="#people">People</a>
    <a href="#ecosystem">Ecosystem</a>
    <a href="#closed">Closed Model Watch</a>
    <a href="#agents">Agent Papers</a>
    <a href="#companies">Company Radar</a>
    <a href="#pipeline">Pipeline</a>
    <a href="#sources">Source Ledger</a>
  </nav>

  <section class="ops-section dark-band" id="system">
    <div class="ops-section-head">
      <div>
        <div class="ops-section-eyebrow">Multi-layer Intelligence System</div>
        <h2>Click model, method, eval, report</h2>
      </div>
      <p>
        这个面板把模型本体、训练阶段、benchmark、报告原图和来源台账放进同一个图谱。点击左侧层级可以切换视角，点击卡片可进入右侧详情抽屉并返回。
      </p>
    </div>
    <div class="ops-system-grid">
      <div class="ops-layer-rail" id="ops-layer-rail" aria-label="tracker layers"></div>
      <div class="ops-layer-detail">
        <div class="ops-layer-body" id="ops-layer-detail"></div>
      </div>
    </div>
  </section>

  <section class="ops-section" id="corpus">
    <div class="ops-section-head">
      <div>
        <div class="ops-section-eyebrow">2026 Frontier Corpus</div>
        <h2>Top-lab model-body reports</h2>
      </div>
      <p>
        只纳入大模型本体、训练、后训练、系统卡、模型卡和官方模型发布；普通应用论文不进入主 corpus。没有正式论文的闭源模型会标注为 system card / model card / official blog。
      </p>
    </div>
    <div class="ops-controls" id="corpus-filters" aria-label="corpus filters"></div>
    <div class="ops-corpus-shell">
      <div class="ops-corpus-grid" id="corpus-grid"></div>
      <div class="ops-pagination" id="corpus-pagination" aria-label="corpus pagination"></div>
    </div>
  </section>

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
    <div class="ops-pagination" id="frontier-pagination" aria-label="frontier model pagination"></div>
  </section>

  <section class="ops-section dark-band" id="benchmarks">
    <div class="ops-section-head">
      <div>
        <div class="ops-section-eyebrow">Benchmark Scoreboard</div>
        <h2>Shared eval map</h2>
      </div>
      <p>
        多个模型会共享 MMLU-Pro、GPQA、HLE、Terminal-Bench、SWE、MRCR、Codeforces、CC-Bench 等评测。这里按任务族过滤，点击 benchmark 名称进入细节。
      </p>
    </div>
    <div class="ops-benchmark-shell">
      <div class="ops-score-filters" id="score-filters"></div>
      <div class="ops-table-wrap">
        <table class="ops-score-table">
          <thead id="score-head"></thead>
          <tbody id="score-body"></tbody>
        </table>
      </div>
      <div class="ops-pagination" id="score-pagination" aria-label="benchmark pagination"></div>
    </div>
  </section>

  <section class="ops-section" id="methods">
    <div class="ops-section-head">
      <div>
        <div class="ops-section-eyebrow">Training Method Atlas</div>
        <h2>CSA, HCA, mHC, Muon, OPD</h2>
      </div>
      <p>
        训练方法与评测方法都作为可复用节点管理。DeepSeek V4 的 CSA/HCA/mHC/Muon/OPD、GLM-5 的异步 RL、GLM-5.2 的 IndexShare/slime、Kimi 的 MuonClip 线索都在这里做交叉索引。
      </p>
    </div>
    <div class="ops-method-grid" id="method-grid"></div>
    <div class="ops-pagination" id="method-pagination" aria-label="method pagination"></div>
  </section>

  <section class="ops-section dark-band" id="figures">
    <div class="ops-section-head">
      <div>
        <div class="ops-section-eyebrow">Original Figure Atlas</div>
        <h2>Report images and charts</h2>
      </div>
      <p>
        报告原图直接引用一手页面或论文 HTML 的图片 URL，并保留源链接。点击图片卡可进入来源与相关 benchmark 详情。
      </p>
    </div>
    <div class="ops-figure-grid" id="figure-grid"></div>
    <div class="ops-pagination" id="figure-pagination" aria-label="figure pagination"></div>
  </section>

  <section class="ops-section" id="people">
    <div class="ops-section-head">
      <div>
        <div class="ops-section-eyebrow">People & Author Network</div>
        <h2>Author lists, teams, labs</h2>
      </div>
      <p>
        人员名单按多文献对比整理：arXiv 技术报告保留作者表规模和代表作者，官方 blog/system card 没有个人署名时标注为团队级发布，避免把组织发布误写成个人贡献。
      </p>
    </div>
    <div class="ops-controls" id="people-filters" aria-label="people filters"></div>
    <div class="ops-people-shell">
      <div class="ops-people-grid" id="people-grid"></div>
      <div class="ops-pagination" id="people-pagination" aria-label="people pagination"></div>
      <div class="ops-panel">
        <h3>Cross-report authorship map</h3>
        <div class="ops-people-matrix" id="people-matrix"></div>
      </div>
    </div>
  </section>

  <section class="ops-section dark-band" id="ecosystem">
    <div class="ops-section-head">
      <div>
        <div class="ops-section-eyebrow">Launch Ecosystem</div>
        <h2>Co-launch partners</h2>
      </div>
      <p>
        GLM-5 Acknowledgement 单独列出 52 个 co-launch partners 和 community developers。本区把 open-source communities、inference providers、applications、AI gateways 拆成可筛选网络，并和 GLM-5.2、DeepSeek V4、Kimi K2.6、Qwen3.7-Max 的公开来源做可比性标注。
      </p>
    </div>
    <div class="ops-ecosystem-summary" id="ecosystem-summary" aria-label="ecosystem summary"></div>
    <div class="ops-controls" id="ecosystem-filters" aria-label="ecosystem filters"></div>
    <div class="ops-ecosystem-shell">
      <div class="ops-ecosystem-grid" id="ecosystem-grid"></div>
      <div class="ops-pagination" id="ecosystem-pagination" aria-label="ecosystem pagination"></div>
      <div class="ops-panel">
        <h3>Cross-report ecosystem map</h3>
        <p class="ops-ecosystem-note">
          这里区分“正式 acknowledgement 伙伴表”和“只出现部署/框架/API 线索”的来源，避免把非伙伴列表误写成共启伙伴。
        </p>
        <div class="ops-table-wrap">
          <table class="ops-ecosystem-table" id="ecosystem-matrix">
            <thead></thead>
            <tbody></tbody>
          </table>
        </div>
      </div>
    </div>
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
    <div class="ops-pagination" id="closed-pagination" aria-label="closed model pagination"></div>
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
    <div class="ops-pagination" id="agent-pagination" aria-label="agent paper pagination"></div>
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
    <div class="ops-pagination" id="roadmap-pagination" aria-label="pipeline pagination"></div>
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
      <div class="ops-pagination" id="source-pagination" aria-label="source pagination"></div>
    </div>
  </section>

  <footer class="ops-footer">
    <p>
      Built for <a href="/">yanhaoming.com</a>. This v1 tracker is a curated static dashboard; source labels are intentionally conservative so the page can evolve into an automated pipeline without losing provenance.
    </p>
  </footer>

  <div class="ops-drawer" id="ops-drawer" hidden aria-hidden="true">
    <div class="ops-drawer-scrim" data-action="close" aria-hidden="true"></div>
    <aside class="ops-drawer-panel" role="dialog" aria-modal="true" aria-labelledby="ops-drawer-title">
      <div class="ops-drawer-head">
        <button class="ops-back-button" type="button" data-action="back">Back</button>
        <div class="ops-crumb" id="ops-crumb">AI Tracker</div>
        <button class="ops-close-button" type="button" data-action="close" aria-label="Close">x</button>
      </div>
      <div class="ops-drawer-body" id="ops-drawer-body"></div>
    </aside>
  </div>
</div>

<script>
  const reportDeepDives = {
    "openai-gpt-family": [
      {
        title: "GPT-4o: Native Multimodal Architecture",
        stage: "architecture / release",
        body: "GPT-4o is OpenAI's natively multimodal model, processing text, audio, and vision in a single end-to-end neural network. Released May 2024, it matches GPT-4 Turbo performance on text while being 2x faster and 50% cheaper. The model accepts text, audio, image, and video inputs; outputs text, audio, and image. Audio input/output latency averages 320ms, enabling real-time voice conversation.",
        source: "https://openai.com/index/hello-gpt-4o/"
      },
      {
        title: "GPT-4o-mini: Efficient Sibling",
        stage: "release",
        body: "GPT-4o-mini launched July 2024 as a smaller, faster, cheaper model replacing GPT-3.5 Turbo in the API. It scores 82% on MMLU (vs GPT-3.5's 70%) and supports 16K context. Pricing at $0.15/1M input tokens made it the most cost-efficient model in the GPT-4o family at launch.",
        source: "https://openai.com/index/gpt-4o-mini-advancing-cost-efficient-intelligence/"
      },
      {
        title: "GPT-4.1: Instruction Following + Long Context",
        stage: "release",
        body: "GPT-4.1 launched April 2025 as a text-only model focused on instruction following (75.5% on IFEval), long-context comprehension (1M tokens, 10.5% on Needle-in-a-Haystack at 1M), and coding (54.6% on SWE-bench Verified). It supports 1M input / 32K output tokens. Available in three sizes: GPT-4.1, GPT-4.1 mini, and GPT-4.1 nano.",
        source: "https://openai.com/index/gpt-4-1/"
      },
      {
        title: "GPT-4.1 Safety & Instruction Following",
        stage: "evaluation / safety",
        body: "The GPT-4.1 system card evaluates instruction hierarchy compliance, refusals, hallucination rates, and chain-of-thought safety. GPT-4.1 scores 83.4% on refusals for disallowed content (up from GPT-4o's 76.1%). The model follows the instruction hierarchy more strictly, reducing prompt injection susceptibility.",
        source: "https://openai.com/index/gpt-4-1-system-card/"
      },
      {
        title: "GPT-5.5: Agentic + Tool Use Frontier",
        stage: "release",
        body: "GPT-5.5 (April 2026) and GPT-5.5 Instant (May 2026) represent OpenAI's current agentic frontier. The system card covers tool use, computer use, web browsing, and file management capabilities. GPT-5.5 Pro extends the line with enhanced reasoning. The Instant variant became ChatGPT's default model.",
        source: "https://openai.com/index/gpt-5-5-system-card/"
      },
      {
        title: "Cross-model Method Lineage",
        stage: "methods",
        body: "OpenAI's 2024-2026 lineup shows a progression from multimodal end-to-end (GPT-4o) to specialized instruction-following (GPT-4.1) to agentic tool-use (GPT-5.5). RLHF remains the core alignment method across the family, with GPT-4.1 adding structured output guarantees and GPT-5.5 adding agent safety evaluations.",
        source: "https://openai.com/index/hello-gpt-4o/"
      }
    ],
    "glm-5.2": [
      {
        title: "GLM-5.2: Long-Horizon Engineering Positioning",
        stage: "architecture / release",
        body: "GLM-5.2 is a separate release from GLM-5 and GLM-5.1, positioned for long-horizon engineering with 1M-token context. Z.ai describes it as 'built for long-horizon tasks' — targeting multi-step, repository-scale engineering workflows rather than single-turn coding. The release ships with open weights and API access.",
        source: "https://z.ai/blog/glm-5.2"
      },
      {
        title: "IndexShare / IndexCache: Cross-Layer Sparse Attention",
        stage: "inference efficiency",
        body: "IndexCache (arXiv 2603.12201) accelerates sparse attention by reusing cross-layer index selections. Instead of computing independent sparse patterns at each layer, IndexCache shares cached index selections across consecutive layers, reducing redundant computation. The GLM-5.2 blog uses IndexShare as the deployment-facing name for this inference optimization, enabling efficient 1M-context serving.",
        source: "https://arxiv.org/abs/2603.12201"
      },
      {
        title: "Slime and Parallel On-Policy Distillation",
        stage: "post-training / RL",
        body: "GLM-5.2 builds on GLM-5's on-policy distillation (OPD) framework with parallel OPD and slime — a method for stabilizing policy updates during large-scale RL. Combined with critic-based PPO, this post-training stack enables the model to learn from long-horizon agent trajectories without catastrophic forgetting of single-turn capabilities.",
        source: "https://z.ai/blog/glm-5.2"
      },
      {
        title: "Anti-Hack Training",
        stage: "safety / adversarial",
        body: "The anti-hack method addresses adversarial robustness in agentic settings, where models are exposed to tool outputs, file-system interactions, and untrusted code. GLM-5.2 incorporates anti-hack training signals to reduce susceptibility to prompt injection and tool-abuse patterns during long-horizon engineering tasks.",
        source: "https://z.ai/blog/glm-5.2"
      },
      {
        title: "GLM Coding Plan: Provider Ecosystem",
        stage: "ecosystem / deployment",
        body: "GLM-5.2 ships with the GLM Coding Plan — a structured integration surface for coding agents and IDE workflows. This positions GLM-5.2 not just as a model release but as a provider-layer product, connecting open weights, API, and coding-agent ecosystems.",
        source: "https://z.ai/blog/glm-5.2"
      },
      {
        title: "Benchmark Comparisons: Terminal-Bench, SWE-bench Pro, MCPAtlas",
        stage: "evaluation",
        body: "GLM-5.2 benchmarks include Terminal-Bench 2.1, SWE-bench Pro, FrontierSWE, PostTrainBench, SWE-Marathon, and MCPAtlas. The blog provides head-to-head comparisons against MiniMax M3/M-series and other frontier models on these agentic coding benchmarks, with effort-level and throughput charts showing long-horizon performance.",
        source: "https://z.ai/blog/glm-5.2"
      }
    ],
    "glm-5": [
      {
        title: "2.2 Pre-training Data",
        stage: "pre-training",
        body: "Web data extends GLM-4.5 with another DCLM classifier based on sentence embeddings plus a World Knowledge classifier trained from Wikipedia and LLM-labeled data. Code data refreshes major code hosts and code web pages, increasing fuzzily deduplicated unique tokens by 28%, fixing Software Heritage metadata alignment, and adding low-resource language classifiers. Math and science data uses improved PDF/web extraction, LLM educational scoring, chunk-and-aggregate scoring for long documents, and filters against synthetic, AI-generated, and template data.",
        source: "https://arxiv.org/pdf/2602.15763"
      },
      {
        title: "2.3 Mid-training",
        stage: "mid-training",
        body: "GLM-5 extends context in three stages: 32K with 1T tokens, 128K with 500B tokens, and 200K with 50B tokens. Software-engineering data concatenates repo-level code, commit diffs, GitHub issues, pull requests, and relevant source files; after filtering, issue-PR data is about 160B unique tokens. Long-context data mixes books, papers, natural documents, NextLong/EntropyLong-style synthetic dependencies, interleaved packing, and MRCR-like variants.",
        source: "https://arxiv.org/pdf/2602.15763"
      },
      {
        title: "3 Post-training",
        stage: "post-training",
        body: "The report describes a progressive alignment stack: multi-task SFT with general chat, reasoning, coding and agent data; specialized RL for reasoning and agentic tasks; general RL for human-style alignment; and on-policy cross-stage distillation to reduce capability regression. SFT extends maximum context to 202,752 tokens.",
        source: "https://arxiv.org/pdf/2602.15763"
      },
      {
        title: "4 Agentic Engineering",
        stage: "agentic training",
        body: "GLM-5 moves from vibe coding to agentic engineering with asynchronous decoupled RL. It builds over 10,000 verifiable training scenarios for coding and terminal tasks, synthesizes complex multi-step search-agent data, and uses group-wise policy optimization over sampled agent traces while ignoring environment feedback in the loss.",
        source: "https://arxiv.org/pdf/2602.15763"
      },
      {
        title: "6 ARC and Long-horizon Evaluation",
        stage: "evaluation",
        body: "The evaluation suite covers ARC reasoning/coding/agent benchmarks, CC-Bench-V2 for frontend/backend/long-horizon engineering, large-repo exploration, multi-step chained tasks, and SWE-rebench January 2026. SWE-rebench reports GLM-5 at 42.1% resolved rate, behind Claude Opus 4.6 and GPT-5.2 but ahead of Kimi K2.5.",
        source: "https://arxiv.org/pdf/2602.15763"
      },
      {
        title: "6.3 Real-world General Abilities",
        stage: "real-world eval",
        body: "GLM-5 adds deployment-oriented evaluations for translation, multilingual dialogue, instruction following, world knowledge, and tool-calling. Examples include ZMultiTransBench, MENT-SNS, and ToolCall-Badcase, a 200-case tool-calling set derived from production failure cases.",
        source: "https://arxiv.org/pdf/2602.15763"
      },
      {
        title: "8 Pony Alpha",
        stage: "release signal",
        body: "The anonymous Pony Alpha OpenRouter experiment is treated as a deployment signal rather than a benchmark: the report says users guessed Anthropic, DeepSeek, Grok, and GLM before the model was confirmed as GLM-5.",
        source: "https://arxiv.org/pdf/2602.15763"
      }
    ],
    "anthropic-claude": [
      {
        title: "Claude Model Lineage",
        stage: "release / timeline",
        body: "Anthropic maintains a continuous Claude release chain: Claude 2 (Jul 2023) → Claude 3 (Mar 2024) → Claude 3.5 Sonnet (Jun 2024) → Claude 4 / Opus 4 (May 2025) → Claude 4.5 Sonnet / Opus (Sep-Nov 2025) → Claude 4.6 Opus / Sonnet (Feb 2026) → Claude 4.7 / 4.8 Opus (Apr-May 2026) → Claude Fable 5 / Mythos 5 (Jun 2026). Every release has a corresponding system card on the Anthropic system-cards index.",
        source: "https://www.anthropic.com/system-cards"
      },
      {
        title: "Fable 5 & Mythos 5 Architecture",
        stage: "architecture / release",
        body: "Claude Fable 5 is Anthropic's most capable widely released model, priced at $10/$50 per MTok. Claude Mythos 5 is limited to Project Glasswing (invitation-only defensive cybersecurity). Both use a new tokenizer introduced with Opus 4.7 (~30% more tokens per text), support adaptive thinking (always on, not extended thinking), 1M context window, and 128K max output. Bedrock and Vertex AI IDs use dateless format but remain pinned snapshots.",
        source: "https://docs.anthropic.com/en/docs/about-claude/models"
      },
      {
        title: "Opus 4.8: Agentic Coding Frontier",
        stage: "release / API",
        body: "Claude Opus 4.8 ($5/$25 per MTok) is the current Opus-tier flagship for complex reasoning and long-horizon agentic coding. It defaults to effort=high across all surfaces including Claude Code, has 1M context (200K on Microsoft Foundry), 128K max output (300K via batch API beta). Training data cutoff Jan 2026, reliable knowledge cutoff Jan 2026.",
        source: "https://docs.anthropic.com/en/docs/about-claude/models"
      },
      {
        title: "Adaptive Thinking vs Extended Thinking",
        stage: "inference / reasoning",
        body: "Starting with Opus 4.7 and Fable/Mythos 5, Anthropic shifted from explicit extended thinking (toggle-based) to adaptive thinking (always on). Opus 4.8 and Fable 5 use adaptive thinking; Sonnet 4.6 and Haiku 4.5 still support extended thinking. This represents a move toward invisible reasoning budgets that adjust per-query rather than requiring developer configuration.",
        source: "https://docs.anthropic.com/en/docs/about-claude/models"
      },
      {
        title: "Safety & System Card Index",
        stage: "safety / deployment",
        body: "The Anthropic system-cards index is the authoritative source for Claude safety evaluations. Each model gets a dedicated system card documenting capabilities, safety evals, and responsible deployment decisions. The page tracks 16 system cards from Claude 2 through Fable 5 / Mythos 5. Claude Mythos Preview (Project Glasswing) has a separate research-preview card for defensive cybersecurity workflows.",
        source: "https://www.anthropic.com/system-cards"
      },
      {
        title: "Pricing & Provider Surface",
        stage: "ecosystem / pricing",
        body: "Claude models are available on Claude API, Claude Platform on AWS (same model IDs, not Bedrock-style), Amazon Bedrock (global + regional endpoints), Vertex AI (global + multi-region + regional), and Microsoft Foundry. Haiku 4.5 at $1/$5 per MTok is the cost-efficiency tier. Opus 4.1 is deprecated and retires Aug 5, 2026.",
        source: "https://docs.anthropic.com/en/docs/about-claude/models"
      },
      {
        title: "300K Output via Batch API",
        stage: "inference / capacity",
        body: "Opus 4.8, Opus 4.7, Opus 4.6, and Sonnet 4.6 support up to 300K output tokens through the Message Batches API using the output-300k-2026-03-24 beta header, triple the standard 128K synchronous limit. This enables very long-form generation tasks that previously required chunking.",
        source: "https://docs.anthropic.com/en/docs/about-claude/models"
      }
    ],
    "minimax-m2": [
      {
        title: "Architecture",
        stage: "architecture",
        body: "MiniMax-M2 is a Mixture-of-Experts language model with 229.9B total parameters and only 9.8B activated per token. The design principle is 'mini activations can unleash maximum real-world intelligence' — achieving frontier-tier performance with a compact active footprint suitable for agentic deployment.",
        source: "https://arxiv.org/abs/2605.26494"
      },
      {
        title: "Agent-Driven Data Pipelines",
        stage: "pre-training / data",
        body: "The M2 series builds large-scale, verifiable trajectories across agentic coding and agentic cowork tasks. Each trajectory is grounded in an executable workspace with artifact-aligned reward, ensuring training signal comes from real agent execution rather than synthetic preference data.",
        source: "https://arxiv.org/abs/2605.26494"
      },
      {
        title: "Forge: Agent-Native RL System",
        stage: "post-training / RL",
        body: "Forge is a scalable agent-native reinforcement learning system designed for long-horizon agent trajectories. It uses windowed-FIFO scheduling to manage rollout lifetimes, prefix-tree merging to deduplicate shared trajectory prefixes, and inference optimization for efficient training-inference-agent decoupling. Forge supports both white-box and black-box agent configurations.",
        source: "https://arxiv.org/abs/2605.26494"
      },
      {
        title: "M2.7 Self-Evolution",
        stage: "agentic training",
        body: "The latest M2.7 checkpoint takes an early step toward self-evolution: it autonomously debugs training runs and modifies its own scaffold. This represents a shift from static post-training to adaptive agent systems that can improve their own infrastructure.",
        source: "https://arxiv.org/abs/2605.26494"
      },
      {
        title: "M3: 1M Context + MSA",
        stage: "architecture / inference",
        body: "MiniMax M3 extends the M2 lineage with 1M-token context support via MSA (Mini Sparse Attention), achieving 15.6x faster decoding at 1M tokens. M3 also adds native multimodality and is positioned as the open-weight frontier for coding and agentic work at $0.60/million tokens.",
        source: "https://www.minimax.io/blog/minimax-m3"
      },
      {
        title: "Benchmark Coverage",
        stage: "evaluation",
        body: "Across M2 through M2.7, the series demonstrates frontier-tier performance on agentic coding, deep search, office-task, and reasoning benchmarks. GLM-5.2 explicitly compares against MiniMax M3/M-series on Terminal-Bench 2.1, SWE-bench Pro, HLE, and MCPAtlas.",
        source: "https://arxiv.org/abs/2605.26494"
      }
    ],
    "deepseek-v4-pro": [
      {
        title: "Architecture",
        stage: "architecture",
        body: "DeepSeek-V4 combines CSA and HCA for million-token contexts. Pro has 1.6T total parameters with 49B activated; Flash has 284B total parameters with 13B activated. CSA compresses KV blocks then applies sparse selection; HCA uses heavier dense compressed attention.",
        source: "https://arxiv.org/html/2606.19348"
      },
      {
        title: "Muon Optimizer",
        stage: "pre-training",
        body: "The report uses Muon for most modules and AdamW for embeddings, prediction head, and RMSNorm weights. It discusses momentum 0.95, weight decay 0.1, RMS rescaling, BF16 Newton-Schulz stability, and a hybrid ZeRO bucket strategy for Muon.",
        source: "https://arxiv.org/html/2606.19348"
      },
      {
        title: "OPD and GRPO",
        stage: "post-training",
        body: "The post-training pipeline replaces the mixed RL stage with On-Policy Distillation. Specialists are trained with fine-tuning and GRPO, then multi-teacher OPD merges expert capabilities with full-vocabulary logit distillation.",
        source: "https://arxiv.org/html/2606.19348"
      },
      {
        title: "Reasoning Effort",
        stage: "inference/eval",
        body: "DeepSeek-V4-Pro and Flash expose Non-Think, High, and Max modes. The report evaluates with 8K, 128K, and 384K context windows respectively; Max uses longer contexts and reduced length penalties and tends to win on hard reasoning/agent tasks.",
        source: "https://arxiv.org/html/2606.19348"
      }
    ],
    "deepseek-v3": [
      {
        title: "DeepSeek-V3 Architecture",
        stage: "architecture",
        body: "DeepSeek-V3 is a Mixture-of-Experts model with 671B total parameters and 37B activated per token. It uses Multi-head Latent Attention (MLA) for KV cache compression, DeepSeekMoE for fine-grained expert routing, and auxiliary-loss-free load balancing. The architecture supports efficient training with FP8 mixed precision.",
        source: "https://arxiv.org/abs/2412.19437"
      },
      {
        title: "Multi-Token Prediction (MTP)",
        stage: "pre-training",
        body: "DeepSeek-V3 introduces Multi-Token Prediction as a training objective. Each position predicts multiple future tokens simultaneously, improving data efficiency and enabling speculative decoding at inference time. MTP adds minimal overhead during training while significantly boosting generation speed.",
        source: "https://arxiv.org/abs/2412.19437"
      },
      {
        title: "FP8 Mixed-Precision Training",
        stage: "training",
        body: "DeepSeek-V3 implements FP8 mixed-precision training with fine-grained quantization and high-precision accumulation. This reduces memory usage and training costs while maintaining model quality. The approach uses a custom FP8 GEMM kernel with online quantization and tile-wise scaling.",
        source: "https://arxiv.org/abs/2412.19437"
      },
      {
        title: "Post-training: RLHF with GRPO",
        stage: "post-training",
        body: "V3 uses Group Relative Policy Optimization (GRPO) for alignment. GRPO samples a group of outputs for each prompt and computes relative rewards within the group, eliminating the need for a separate critic model. This reduces training cost while maintaining alignment quality.",
        source: "https://arxiv.org/abs/2412.19437"
      }
    ],
    "kimi-k2-6": [
      {
        title: "K2.5 Architecture & Baseline",
        stage: "architecture / baseline",
        body: "Kimi K2.5 is the baseline technical report (arXiv 2602.02276) for the Kimi model line. It provides the explicit 326-author table, test system prompts, and benchmark setup that K2.6 footnotes reference. K2.5 covers tool-augmented evaluation and context management methods.",
        source: "https://arxiv.org/pdf/2602.02276"
      },
      {
        title: "K2.6 Long-Horizon Coding",
        stage: "coding / release",
        body: "Kimi K2.6 tech blog (official Moonshot source) advances long-horizon coding and coding-driven design. The blog provides benchmark tables comparing HLE, BrowseComp, DeepSearchQA, APEX-Agents, Terminal Bench 2.0, SWE Verified, and CharXiv. Reproducibility footnotes reference K2.5 as the test-system-prompt baseline.",
        source: "https://www.kimi.com/blog/kimi-k2-6"
      },
      {
        title: "Agent Swarms & Proactive Agents",
        stage: "agentic training",
        body: "K2.6 introduces agent swarms and proactive agents as a direction beyond single-agent coding. The Claw Groups preview is mentioned as an upcoming multi-agent coordination surface. The K2.6 blog describes joint text-vision RL as part of the multimodal agent stack.",
        source: "https://www.kimi.com/blog/kimi-k2-6"
      },
      {
        title: "K2.7 Code: Coding-Specialized API",
        stage: "release / API",
        body: "Kimi K2.7 Code is the current coding-specialized API line, tracked separately because its source surface is model docs rather than the K2.6 tech blog. The quickstart docs define it as the latest Kimi coding model for SWE, Terminal Bench, and ProgramBench evaluations.",
        source: "https://platform.kimi.ai/docs/guide/kimi-k2-7-code-quickstart"
      },
      {
        title: "MuonClip Optimizer Lineage",
        stage: "methods / watchlist",
        body: "Kimi K2.6 footnotes reference the K2.5 report; the tracker keeps MuonClip as Kimi optimizer lineage until directly verified in the report text. The method registry tracks it as a watchlist item linked to both K2.5 and K2.6 sources.",
        source: "https://arxiv.org/pdf/2602.02276"
      },
      {
        title: "Benchmark Setup & Source Provenance",
        stage: "evaluation",
        body: "K2.6 provides benchmark tables for HLE (36.4 pass@1 without tools, 54.0 with tools), BrowseComp, DeepSearchQA, and agent benchmarks. The report explicitly footnotes which test prompts come from K2.5, establishing a clear source chain for benchmark reproducibility.",
        source: "https://www.kimi.com/blog/kimi-k2-6"
      }
    ],
    "deepseek-r1": [
      {
        title: "DeepSeek-R1 Reasoning Model",
        stage: "architecture",
        body: "DeepSeek-R1 is a reasoning-focused model that demonstrates how RL can produce emergent reasoning capabilities without explicit chain-of-thought supervision. The model is trained from DeepSeek-V3-Base using RL with GRPO, showing that reasoning patterns emerge naturally from reward signals.",
        source: "https://arxiv.org/abs/2501.12948"
      },
      {
        title: "Cold-Start with Long-CoT",
        stage: "post-training",
        body: "R1 uses a multi-stage pipeline: (1) cold-start with a small set of long-chain-of-thought examples, (2) RL training with reasoning-oriented rewards, (3) rejection sampling and SFT for non-reasoning tasks, (4) final RL with mixed rewards. The cold-start phase seeds the model with reasoning patterns before RL discovers additional strategies.",
        source: "https://arxiv.org/abs/2501.12948"
      },
      {
        title: "Emergent Behaviors",
        stage: "evaluation",
        body: "During RL training, R1 spontaneously develops chain-of-thought reasoning, self-verification, and reflection without explicit prompting. It achieves 71% pass@1 on AIME 2024 (matching OpenAI-o1) and 79.8% on MATH-500. The paper demonstrates that large-scale RL alone can elicit sophisticated reasoning behaviors.",
        source: "https://arxiv.org/abs/2501.12948"
      },
      {
        title: "Distillation to Smaller Models",
        stage: "distillation",
        body: "DeepSeek distills R1's reasoning capabilities into smaller models (1.5B to 70B parameters). The distilled DeepSeek-R1-Distill-Qwen-32B outperforms OpenAI-o1-mini on multiple benchmarks. This demonstrates that reasoning patterns from large RL-trained models can be effectively transferred to compact architectures.",
        source: "https://arxiv.org/abs/2501.12948"
      }
    ],
    "qwen3-family": [
      {
        title: "Dense + MoE Architecture, 0.6B to 235B",
        stage: "architecture",
        body: "Qwen3 includes both dense and Mixture-of-Expert (MoE) architectures, with parameter scales from 0.6B to 235B. The flagship Qwen3-235B-A22B has 235B total parameters with 22B activated per token. The series is designed to advance performance, efficiency, and multilingual capabilities under Apache 2.0.",
        source: "https://arxiv.org/abs/2505.09388"
      },
      {
        title: "Unified Thinking / Non-Thinking Mode",
        stage: "inference design",
        body: "Qwen3's key innovation is integrating thinking mode (complex multi-step reasoning) and non-thinking mode (rapid context-driven responses) into a single unified framework. This eliminates the need to switch between chat-optimized models (e.g., GPT-4o) and dedicated reasoning models (e.g., QwQ-32B), enabling dynamic mode switching based on user queries or chat templates.",
        source: "https://arxiv.org/abs/2505.09388"
      },
      {
        title: "Thinking Budget Mechanism",
        stage: "inference / efficiency",
        body: "Qwen3 introduces a thinking budget mechanism that lets users allocate computational resources adaptively during inference, balancing latency and performance based on task complexity. This allows the same model to handle both quick responses and deep reasoning without switching endpoints.",
        source: "https://arxiv.org/abs/2505.09388"
      },
      {
        title: "Knowledge Distillation from Flagship to Small Models",
        stage: "distillation",
        body: "By leveraging knowledge from flagship models, Qwen3 significantly reduces the computational resources required to build smaller-scale models while ensuring highly competitive performance. This enables the 0.6B-32B dense models and smaller MoE variants to punch above their parameter class.",
        source: "https://arxiv.org/abs/2505.09388"
      },
      {
        title: "119-Language Multilingual Expansion",
        stage: "data / multilingual",
        body: "Compared to Qwen2.5's 29 languages, Qwen3 expands multilingual support to 119 languages and dialects, enhancing global accessibility through improved cross-lingual understanding and generation capabilities.",
        source: "https://arxiv.org/abs/2505.09388"
      },
      {
        title: "Benchmark Results & Author Table",
        stage: "evaluation",
        body: "Qwen3 achieves state-of-the-art results across diverse benchmarks including code generation, mathematical reasoning, and agent tasks, competitive against larger MoE models and proprietary models. The paper lists 61 authors including An Yang, Binyuan Hui, Junyang Lin, and Fan Zhou.",
        source: "https://arxiv.org/abs/2505.09388"
      }
    ],
    "minimax-m2": [
      {
        title: "2.2 Pre-training Data & Agent-Driven Pipelines",
        stage: "pre-training / data",
        body: "MiniMax-M2 builds large-scale, verifiable trajectories across agentic coding and agentic cowork tasks. Each trajectory is grounded in an executable workspace with artifact-aligned reward, ensuring training signal comes from real agent execution rather than synthetic preference data. The pipeline is designed so that data quality improves with model capability — stronger models generate better trajectories for subsequent training rounds.",
        source: "https://arxiv.org/abs/2605.26494"
      },
      {
        title: "3 Forge: Agent-Native RL System",
        stage: "post-training / RL",
        body: "Forge is a scalable agent-native reinforcement learning system designed for long-horizon agent trajectories. It uses windowed-FIFO scheduling to manage rollout lifetimes, prefix-tree merging to deduplicate shared trajectory prefixes, and inference optimization for efficient training-inference-agent decoupling. Forge supports both white-box (gradient-accessible) and black-box (API-only) agent configurations, making it adaptable to closed-source model fine-tuning.",
        source: "https://arxiv.org/abs/2605.26494"
      },
      {
        title: "4 MoE Architecture: 229.9B Total / 9.8B Activated",
        stage: "architecture",
        body: "MiniMax-M2 is a Mixture-of-Experts model with 229.9B total parameters and only 9.8B activated per token. The design principle is 'mini activations can unleash maximum real-world intelligence' — achieving frontier-tier performance with a compact active footprint suitable for agentic deployment where latency and cost matter more than peak parameter count.",
        source: "https://arxiv.org/abs/2605.26494"
      },
      {
        title: "5 M2.7 Self-Evolution Checkpoint",
        stage: "agentic training",
        body: "The M2.7 checkpoint takes an early step toward self-evolution: it autonomously debugs training runs and modifies its own scaffold. This represents a shift from static post-training to adaptive agent systems that can improve their own infrastructure — a direction distinct from the RL-focused approaches of DeepSeek and GLM.",
        source: "https://arxiv.org/abs/2605.26494"
      },
      {
        title: "6 Benchmark Coverage & Cross-Report Comparison",
        stage: "evaluation",
        body: "Across M2 through M2.7, the series demonstrates frontier-tier performance on agentic coding, deep search, office-task, and reasoning benchmarks. GLM-5.2 explicitly compares against MiniMax M3/M-series on Terminal-Bench 2.1, SWE-bench Pro, HLE, and MCPAtlas. The paper provides author tables and reproducible evaluation setup.",
        source: "https://arxiv.org/abs/2605.26494"
      },
      {
        title: "M3: 1M Context via Mini Sparse Attention",
        stage: "architecture / inference",
        body: "MiniMax M3 extends the M2 lineage with 1M-token context support via MSA (Mini Sparse Attention), achieving 15.6x faster decoding at 1M tokens compared to dense attention baselines. M3 also adds native multimodality and is positioned as the open-weight frontier for coding and agentic work at $0.60/million tokens. The M3 blog is the official source; the M2 paper provides the architecture and training foundations.",
        source: "https://www.minimax.io/blog/minimax-m3"
      }
    ],
    "qwen3-coder-next": [
      {
        title: "80B Total / 3B Activated MoE for Coding",
        stage: "architecture",
        body: "Qwen3-Coder-Next is an 80-billion-parameter model that activates only 3 billion parameters during inference, enabling strong coding capability with efficient inference. It explores how far strong training recipes can push the capability limits of models with small active parameter footprints.",
        source: "https://arxiv.org/abs/2603.00729"
      },
      {
        title: "Agentic Training with Executable Environments",
        stage: "agentic training",
        body: "The model performs agentic training through large-scale synthesis of verifiable coding tasks paired with executable environments, allowing learning directly from environment feedback via mid-training and reinforcement learning. This is a direct application of the verifiable-trajectory approach seen in MiniMax M2's Forge system, but at a much smaller active parameter scale.",
        source: "https://arxiv.org/abs/2603.00729"
      },
      {
        title: "SWE-Bench & Terminal-Bench Evaluation",
        stage: "evaluation",
        body: "Across agent-centric benchmarks including SWE-Bench and Terminal-Bench, Qwen3-Coder-Next achieves competitive performance relative to its active parameter count. The paper releases both base and instruction-tuned open-weight versions to support research and real-world coding agent development.",
        source: "https://arxiv.org/abs/2603.00729"
      },
      {
        title: "Alphabetical Author Table (20 Authors)",
        stage: "people",
        body: "The paper lists 20 authors alphabetically by last name, including Ruisheng Cao, Mouxiang Chen, Binyuan Hui, Junyang Lin, and Fan Zhou. Several authors overlap with the Qwen3 main technical report, establishing a shared team lineage.",
        source: "https://arxiv.org/abs/2603.00729"
      }
    ],
    "llama-4": [
      {
        title: "Llama 4 Scout & Maverick: MoE Architecture",
        stage: "architecture / release",
        body: "Llama 4 Scout has 17B active parameters with 16 experts; Maverick has 17B active parameters with 128 experts. Both use early fusion for native multimodality — interleaved image-text-video input — and support 10M-token context windows. The MoE design keeps per-token compute low while scaling model capacity through expert routing.",
        source: "https://ai.meta.com/blog/llama-4-multimodal-intelligence/"
      },
      {
        title: "Pre-training Data & Curriculum",
        stage: "pre-training",
        body: "Llama 4 models were pre-trained on 30T+ tokens of multilingual text and multimodal data. The training curriculum blends standard web text with synthetic data generated by Llama 4 Behemoth (the teacher model). Interleaved image-text-video sequences enable the early-fusion multimodal architecture. The data pipeline includes quality filtering, deduplication, and safety filtering stages.",
        source: "https://ai.meta.com/blog/llama-4-multimodal-intelligence/"
      },
      {
        title: "Post-training: Online RL + DPO",
        stage: "post-training",
        body: "Post-training uses online reinforcement learning combined with direct preference optimization (DPO). The RL stage leverages verifiable rewards for reasoning and coding tasks. DPO refines instruction following and safety alignment. This two-stage approach mirrors the pattern seen in DeepSeek (GRPO + distillation) and GLM-5 (async RL + group-wise policy optimization) but with Meta-specific reward modeling.",
        source: "https://ai.meta.com/blog/llama-4-multimodal-intelligence/"
      },
      {
        title: "Llama 4 Behemoth: Teacher Model",
        stage: "teacher / in-training",
        body: "Behemoth has 288B active parameters across 256 experts (trillion-scale total parameters). Still in training as of April 2025. Scout and Maverick were trained using synthetic data distilled from Behemoth's intermediate checkpoints. When released, Behemoth is expected to set the open-weight frontier for reasoning and multimodal tasks.",
        source: "https://ai.meta.com/blog/llama-4-multimodal-intelligence/"
      },
      {
        title: "Benchmark Results",
        stage: "evaluation",
        body: "Scout and Maverick are evaluated against GPT-4o, Gemini 2.0 Flash, and Mistral on MMLU, GPQA Diamond, LiveCodeBench, and multimodal reasoning benchmarks. Maverick shows competitive performance on coding and multilingual tasks. Scout excels at long-context retrieval with its 10M-token window. The models are positioned as the strongest open-weight alternatives to closed frontier models.",
        source: "https://ai.meta.com/blog/llama-4-multimodal-intelligence/"
      },
      {
        title: "Open-Weight Licensing & Deployment",
        stage: "ecosystem",
        body: "Llama 4 models are released under Meta's community license with open weights on Hugging Face. Deployment is supported through vLLM, TensorRT-LLM, and major inference providers. The open-weight release enables fine-tuning, distillation, and local deployment — a key differentiator from closed API-only models like GPT-5.5 or Claude Fable 5.",
        source: "https://ai.meta.com/llama/"
      }
    ]
  };

  const modelRecords = [
    {
      id: "glm-5-2",
      name: "GLM-5.2",
      org: "Z.ai",
      date: "2026-06-16",
      openness: "open weights + API",
      type: "official blog + model docs",
      tags: ["long-horizon", "coding", "agent", "1M context", "open"],
      status: "latest",
      note: "GLM-5.2 is a separate release from GLM-5 and GLM-5.1. Z.ai positions it for long-horizon engineering with 1M context, IndexShare/IndexCache, GLM Coding Plan, and stronger agentic coding benchmarks.",
      links: [
        ["Blog", "https://z.ai/blog/glm-5.2"],
        ["Docs", "https://docs.z.ai/guides/llm/glm-5.2"],
        ["HF", "https://huggingface.co/zai-org/GLM-5.2"],
        ["GitHub", "https://github.com/zai-org/GLM-5"],
        ["IndexCache", "https://arxiv.org/abs/2603.12201"]
      ],
      methods: ["IndexCache/IndexShare", "slime", "parallel OPD", "critic-based PPO", "anti-hack"],
      benchmarks: ["Terminal Bench 2.1", "SWE-bench Pro", "FrontierSWE", "PostTrainBench", "SWE-Marathon", "MCPAtlas"],
      figures: ["glm52-long-horizon", "glm52-standard-coding", "glm52-effort", "glm52-throughput"],
      deepDive: "glm-5.2"
    },
    {
      id: "glm-5-1",
      name: "GLM-5.1",
      org: "Z.ai",
      date: "2026",
      openness: "open/API",
      type: "official blog baseline",
      tags: ["coding", "agent", "baseline", "open"],
      status: "baseline",
      note: "GLM-5.1 is tracked independently because GLM-5.2 reports deltas against it on Terminal-Bench 2.1, SWE-bench Pro, HLE, MCPAtlas, and effort-level charts.",
      links: [
        ["GLM-5.1 blog", "https://z.ai/blog/glm-5.1"],
        ["GLM-5.2 comparison", "https://z.ai/blog/glm-5.2"],
        ["GitHub", "https://github.com/zai-org/GLM-5"]
      ],
      methods: ["DSA", "agentic RL baseline"],
      benchmarks: ["Terminal Bench 2.1", "SWE-bench Pro", "HLE", "MCPAtlas"],
      figures: ["glm52-standard-coding", "glm52-effort"]
    },
    {
      id: "glm-5",
      name: "GLM-5",
      org: "Z.ai / GLM-5-Team",
      date: "2026-02-17",
      openness: "open weights",
      type: "paper + code",
      tags: ["agentic engineering", "coding", "reasoning", "long-context", "open"],
      status: "paper",
      note: "GLM-5 is the model-body paper behind the vibe-coding to agentic-engineering transition. It has a dedicated deep-dive panel for pre-training data, mid-training, post-training, asynchronous RL, ARC/CC-Bench/SWE-rebench, real-world evals, and Pony Alpha.",
      links: [
        ["arXiv", "https://arxiv.org/abs/2602.15763"],
        ["PDF", "https://arxiv.org/pdf/2602.15763"],
        ["GitHub", "https://github.com/zai-org/GLM-5"]
      ],
      methods: ["DCLM classifier", "World Knowledge classifier", "asynchronous RL", "group-wise policy optimization", "cross-stage OPD", "DSA"],
      benchmarks: ["ARC", "CC-Bench-V2", "SWE-rebench", "LongBench v2", "ToolCall-Badcase"],
      deepDive: "glm-5"
    },
    {
      id: "deepseek-v4-pro",
      name: "DeepSeek-V4-Pro",
      org: "DeepSeek-AI",
      date: "2026-04-24",
      openness: "open weights + API",
      type: "technical report + official release",
      tags: ["MoE", "1M context", "reasoning", "coding", "open"],
      status: "latest",
      note: "Pro is the 1.6T total / 49B active DeepSeek V4 model. Its report details CSA, HCA, mHC, Muon, OPD, GRPO, million-token context, and Table 6/7 benchmark modes.",
      links: [
        ["arXiv HTML", "https://arxiv.org/html/2606.19348"],
        ["HF PDF", "https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro/blob/main/DeepSeek_V4.pdf"],
        ["Release", "https://api-docs.deepseek.com/news/news260424"],
        ["HF Collection", "https://huggingface.co/collections/deepseek-ai/deepseek-v4"]
      ],
      methods: ["CSA", "HCA", "mHC", "Muon", "OPD", "GRPO", "reasoning effort"],
      benchmarks: ["MMLU-Pro", "GPQA Diamond", "LiveCodeBench-v6", "Codeforces", "MRCR 1M", "Terminal Bench 2.0", "SWE Verified", "MCPAtlas"],
      figures: ["deepseek-fig8", "deepseek-fig9", "deepseek-fig10"],
      deepDive: "deepseek-v4-pro"
    },
    {
      id: "deepseek-v4-flash",
      name: "DeepSeek-V4-Flash",
      org: "DeepSeek-AI",
      date: "2026-04-24",
      openness: "open weights + API",
      type: "technical report + official release",
      tags: ["MoE", "1M context", "efficient", "open"],
      status: "latest",
      note: "Flash is the 284B total / 13B active member of DeepSeek V4, sharing CSA/HCA/Muon/OPD stack with Pro but optimized for cost and latency.",
      links: [
        ["arXiv HTML", "https://arxiv.org/html/2606.19348"],
        ["Release", "https://api-docs.deepseek.com/news/news260424"],
        ["HF Collection", "https://huggingface.co/collections/deepseek-ai/deepseek-v4"]
      ],
      methods: ["CSA", "HCA", "mHC", "Muon", "OPD", "GRPO", "reasoning effort"],
      benchmarks: ["MMLU-Pro", "LiveCodeBench-v6", "Codeforces", "Terminal Bench 2.0", "SWE Verified"],
      figures: ["deepseek-fig10"]
    },
    {
      id: "kimi-k2-7-code",
      name: "Kimi K2.7 Code",
      org: "Moonshot AI / Kimi",
      date: "2026",
      openness: "API",
      type: "model docs",
      tags: ["coding", "agent", "long-context", "API"],
      status: "latest",
      note: "Kimi docs identify K2.7 Code as the current coding-specialized Kimi line. It is tracked separately from K2.6 because its source surface is model docs rather than the K2.6 tech blog.",
      links: [
        ["Quickstart", "https://platform.kimi.ai/docs/guide/kimi-k2-7-code-quickstart"],
        ["Models", "https://platform.kimi.ai/docs/models"],
        ["Kimi Code", "https://www.kimi.com/code"]
      ],
      methods: ["coding-agent post-training"],
      benchmarks: ["SWE", "Terminal Bench", "ProgramBench"]
    },
    {
      id: "kimi-k2-6",
      name: "Kimi K2.6",
      org: "Moonshot AI / Kimi",
      date: "2026",
      openness: "API",
      type: "official tech blog",
      tags: ["coding", "agent", "multimodal", "vision"],
      status: "current",
      note: "Kimi K2.6 tech blog covers long-horizon coding, coding-driven design, agent swarms, proactive agents, Claw Groups preview, benchmark tables, and reproducibility footnotes.",
      links: [
        ["Tech blog", "https://www.kimi.com/blog/kimi-k2-6"],
        ["K2.6 quickstart", "https://platform.kimi.ai/docs/guide/kimi-k2-6-quickstart"],
        ["K2.5 report", "https://arxiv.org/pdf/2602.02276"]
      ],
      methods: ["MuonClip lineage", "agent swarm", "context management", "SWE-agent style harness"],
      benchmarks: ["HLE", "BrowseComp", "DeepSearchQA", "APEX-Agents", "Terminal Bench 2.0", "SWE Verified", "CharXiv"],
      figures: ["kimi-k26-1", "kimi-k26-2", "kimi-k26-3"],
      deepDive: "kimi-k2-6"
    },
    {
      id: "kimi-k2-5",
      name: "Kimi K2.5",
      org: "Moonshot AI / Kimi",
      date: "2026",
      openness: "API",
      type: "technical report",
      tags: ["reasoning", "agent", "baseline"],
      status: "baseline",
      note: "Kimi K2.6 footnotes cite the Kimi K2.5 technical report as the source for test system prompts and baseline comparisons.",
      links: [["Technical report", "https://arxiv.org/pdf/2602.02276"], ["K2.6 blog", "https://www.kimi.com/blog/kimi-k2-6"]],
      methods: ["tool-augmented eval", "context management"],
      benchmarks: ["HLE", "SWE", "Terminal Bench"]
    },
    {
      id: "qwen-3-7-max",
      name: "Qwen3.7-Max",
      org: "Alibaba / Qwen",
      date: "2026-06",
      openness: "API",
      type: "official blog + docs",
      tags: ["agent", "coding", "multimodal", "API"],
      status: "latest",
      note: "Qwen3.7-Max is tracked as the current API flagship line. The page keeps it separate from open Qwen3-Coder releases and labels it with official blog/docs rather than paper.",
      links: [
        ["Qwen blog", "https://qwen.ai/blog?id=qwen3.7"],
        ["Alibaba Cloud offer", "https://help.aliyun.com/en/lingma/product-overview/qwen3-7-max-limited-time-offer"],
        ["Model updates", "https://help.aliyun.com/zh/model-studio/newly-released-models"]
      ],
      methods: ["agent post-training", "multimodal tool use"],
      benchmarks: ["HLE", "GPQA Diamond", "SWE-bench Pro", "MCPAtlas"]
    },
    {
      id: "qwen3-coder-next",
      name: "Qwen3-Coder / Next",
      org: "Alibaba / Qwen",
      date: "2026 watch",
      openness: "open + API",
      type: "research page + code",
      tags: ["open", "coding", "agent", "repository"],
      status: "watch",
      note: "The tracker keeps Qwen3-Coder and Coder-Next as the open coding line. If a standalone 2026 paper is confirmed, this card should be promoted from research/code source to paper source.",
      links: [
        ["Research", "https://qwen.ai/research"],
        ["GitHub", "https://github.com/QwenLM/Qwen3-Coder"],
        ["API platform", "https://qwen.ai/apiplatform"]
      ],
      methods: ["agentic coding", "repository training", "verifiable coding tasks", "executable environments", "mid-training RL"],
      benchmarks: ["SWE-Bench", "Terminal-Bench", "Codeforces"],
      deepDive: "qwen3-coder-next"
    },
    {
      id: "qwen3-235b",
      name: "Qwen3-235B-A22B",
      org: "Alibaba / Qwen Team",
      date: "2025-05",
      openness: "open weights",
      type: "paper",
      tags: ["MoE", "235B", "thinking mode", "119 languages", "open"],
      status: "paper",
      note: "Qwen3 is the latest Qwen model family with both dense and MoE architectures from 0.6B to 235B parameters. Key innovations include unified thinking/non-thinking mode, thinking budget mechanism, knowledge distillation from flagship to small models, and 119-language multilingual support. Apache 2.0 licensed.",
      links: [
        ["arXiv", "https://arxiv.org/abs/2505.09388"],
        ["PDF", "https://arxiv.org/pdf/2505.09388"],
        ["HF", "https://huggingface.co/Qwen/Qwen3-235B-A22B"],
        ["GitHub", "https://github.com/QwenLM/Qwen3"]
      ],
      methods: ["MoE routing", "thinking/non-thinking unified mode", "thinking budget", "knowledge distillation", "multilingual expansion"],
      benchmarks: ["code generation", "mathematical reasoning", "agent tasks", "multilingual eval"],
      deepDive: "qwen3-family"
    },
    {
      id: "llama-4",
      name: "Llama 4 Scout / Maverick",
      org: "Meta",
      date: "2025-04",
      openness: "open weights",
      type: "official blog + open weights",
      tags: ["multimodal", "MoE", "10M context", "early fusion", "open"],
      status: "active",
      note: "Llama 4 Scout (17B active, 16 experts) and Maverick (17B active, 128 experts) are Meta's MoE models with 10M-token context via early fusion. Trained on 30T+ tokens using a curriculum that blends synthetic data from Behemoth with online RL and DPO. Open weights released under community license.",
      links: [
        ["Blog", "https://ai.meta.com/blog/llama-4-multimodal-intelligence/"],
        ["Llama page", "https://ai.meta.com/llama/"],
        ["HF", "https://huggingface.co/meta-llama"]
      ],
      methods: ["MoE routing", "early fusion multimodal", "online RL", "DPO", "synthetic data from Behemoth", "interleaved image-text-video"],
      benchmarks: ["MMLU", "GPQA Diamond", "LiveCodeBench", "multimodal reasoning"],
      deepDive: "llama-4"
    },
    {
      id: "llama-4-behemoth",
      name: "Llama 4 Behemoth",
      org: "Meta",
      date: "2025-04 (training)",
      openness: "open weights (pending)",
      type: "official blog",
      tags: ["MoE", "teacher model", "288B active", "open", "in-training"],
      status: "training",
      note: "Llama 4 Behemoth is Meta's teacher model with 288B active parameters across 256 experts (trillion-scale total). Still in training as of April 2025. Scout and Maverick were trained using synthetic data distilled from Behemoth's intermediate checkpoints. Behemoth is positioned as the capstone of the Llama 4 family.",
      links: [
        ["Blog", "https://ai.meta.com/blog/llama-4-multimodal-intelligence/"],
        ["Llama page", "https://ai.meta.com/llama/"]
      ],
      methods: ["teacher-student distillation", "MoE routing", "early fusion", "large-scale synthetic data generation"],
      benchmarks: ["expected to set open-weight frontier when released"]
    },
    {
      id: "mistral-devstral-magistral",
      name: "Mistral Devstral / Magistral",
      org: "Mistral AI",
      date: "2025-2026 watch",
      openness: "open/API mix",
      type: "official docs + release",
      tags: ["coding", "reasoning", "open"],
      status: "watch",
      note: "Devstral tracks coding/agent releases and Magistral tracks reasoning. The source type is official docs/blog until a model-body paper is confirmed.",
      links: [["Model docs", "https://docs.mistral.ai/models/overview"], ["Devstral", "https://mistral.ai/news/devstral"], ["Magistral", "https://mistral.ai/news/magistral"]],
      methods: ["coding post-training", "reasoning tuning"],
      benchmarks: ["SWE", "reasoning"]
    },
    {
      id: "minimax-m3",
      name: "MiniMax M3",
      org: "MiniMax",
      date: "2026-06-01",
      openness: "open weights + API",
      type: "official blog + model docs",
      tags: ["coding", "agent", "1M context", "open", "multimodal"],
      status: "latest",
      note: "MiniMax M3 is the current flagship open-weight model with 1M-token context, MSA sparse attention delivering 15.6x faster decoding, native multimodality, and frontier-level coding/agentic benchmarks. GLM-5.2 and other reports compare against M3.",
      links: [
        ["Blog", "https://www.minimax.io/blog/minimax-m3"],
        ["HF", "https://huggingface.co/MiniMaxAI"],
        ["GitHub", "https://github.com/MiniMax-AI/MiniMax-M3"],
        ["API", "https://platform.minimax.io/docs"]
      ],
      methods: ["MSA sparse attention", "agent coding post-training", "1M context engineering"],
      benchmarks: ["coding", "agentic", "reasoning", "long-context"],
      deepDive: "minimax-m2"
    },
    {
      id: "minimax-m2",
      name: "MiniMax-M2",
      org: "MiniMax",
      date: "2026-05-26",
      openness: "open weights",
      type: "paper",
      tags: ["MoE", "agent", "9.8B active", "open", "self-evolution"],
      status: "paper",
      note: "MiniMax-M2 paper (arXiv 2605.26494) describes a 229.9B total / 9.8B activated MoE family. Three core components: agent-driven data pipelines with verifiable trajectories, Forge (agent-native RL with windowed-FIFO scheduling, prefix-tree merging), and M2.7 checkpoint demonstrating autonomous scaffold self-modification.",
      links: [
        ["arXiv", "https://arxiv.org/abs/2605.26494"],
        ["PDF", "https://arxiv.org/pdf/2605.26494"],
        ["HTML", "https://arxiv.org/html/2605.26494v1"],
        ["GitHub", "https://github.com/MiniMax-AI/MiniMax-M2"]
      ],
      methods: ["Forge RL", "agent-driven data pipeline", "windowed-FIFO scheduling", "prefix-tree merging", "self-evolution scaffold"],
      benchmarks: ["agentic coding", "deep search", "office-task", "reasoning"],
      deepDive: "minimax-m2"
    },
    {
      id: "minimax-m1",
      name: "MiniMax-M1",
      org: "MiniMax",
      date: "2025",
      openness: "open weights",
      type: "paper + code",
      tags: ["reasoning", "long-context", "baseline", "open"],
      status: "baseline",
      note: "MiniMax-M1 is the predecessor paper (arXiv 2506.13585) retained as a baseline for M2/M3 lineage comparison. GLM-5.2 cites M-series in benchmark comparisons.",
      links: [
        ["arXiv", "https://arxiv.org/abs/2506.13585"],
        ["HF weights", "https://huggingface.co/MiniMaxAI/MiniMax-M1-80k"],
        ["GitHub", "https://github.com/MiniMax-AI/MiniMax-M1"]
      ],
      methods: ["long-context reasoning", "MoE"],
      benchmarks: ["HLE", "SWE-bench Pro", "MCPAtlas"]
    },
    {
      id: "hunyuan-a13b",
      name: "Hunyuan-A13B",
      org: "Tencent Hunyuan",
      date: "2025 active",
      openness: "open weights",
      type: "model card",
      tags: ["open", "efficient", "Chinese"],
      status: "active",
      note: "Tencent Hunyuan open models remain part of the Chinese open-weight baseline set; upgrade when 2026 model-body reports are confirmed.",
      links: [["Hugging Face", "https://huggingface.co/tencent/Hunyuan-A13B-Instruct"]],
      methods: ["efficient open model"],
      benchmarks: ["Chinese eval"]
    },
    {
      id: "ernie-4-5",
      name: "ERNIE 4.5",
      org: "Baidu",
      date: "2025 active",
      openness: "open/API mix",
      type: "official blog",
      tags: ["multimodal", "Chinese", "foundation"],
      status: "active",
      note: "Baidu ERNIE 4.5 is retained as a China frontier baseline until a newer 2026 model-body report is confirmed.",
      links: [["Baidu ERNIE", "https://ernie.baidu.com/blog/posts/ernie4.5/"]],
      methods: ["multimodal foundation"],
      benchmarks: ["Chinese eval", "multimodal eval"]
    },
    {
      id: "openai-gpt-4-1",
      name: "GPT-4.1 / mini / nano",
      org: "OpenAI",
      date: "2025-04",
      openness: "API",
      type: "official release + system card",
      tags: ["instruction following", "long-context", "coding", "API"],
      status: "active",
      note: "GPT-4.1 is a text-only model optimized for instruction following (75.5% IFEval), 1M-token context (10.5% Needle-in-a-Haystack at 1M), and coding (54.6% SWE-bench Verified). Ships in three sizes: GPT-4.1, mini, nano. System card evaluates instruction hierarchy compliance and refusal rates.",
      links: [
        ["Release", "https://openai.com/index/gpt-4-1/"],
        ["System card", "https://openai.com/index/gpt-4-1-system-card/"],
        ["API docs", "https://platform.openai.com/docs/models/gpt-4-1"]
      ],
      methods: ["RLHF", "instruction hierarchy", "structured output", "long-context"],
      benchmarks: ["IFEval", "SWE-bench Verified", "Needle-in-a-Haystack", "Aider polyglot"],
      deepDive: "openai-gpt-family"
    },
    {
      id: "openai-gpt-4o",
      name: "GPT-4o / 4o-mini",
      org: "OpenAI",
      date: "2024-05",
      openness: "API",
      type: "official release",
      tags: ["multimodal", "real-time", "efficient", "API"],
      status: "baseline",
      note: "GPT-4o is OpenAI's natively multimodal model (text + audio + vision end-to-end). 2x faster and 50% cheaper than GPT-4 Turbo on text tasks. Audio latency 320ms enables real-time conversation. GPT-4o-mini replaced GPT-3.5 Turbo at 82% MMLU.",
      links: [
        ["Release", "https://openai.com/index/hello-gpt-4o/"],
        ["Mini release", "https://openai.com/index/gpt-4o-mini-advancing-cost-efficient-intelligence/"],
        ["API docs", "https://platform.openai.com/docs/models/gpt-4o"]
      ],
      methods: ["end-to-end multimodal", "RLHF", "audio tokenization"],
      benchmarks: ["MMLU", "MUSR", "MGSM", "real-time voice"],
      deepDive: "openai-gpt-family"
    },
    {
      id: "deepseek-v3",
      name: "DeepSeek-V3",
      org: "DeepSeek-AI",
      date: "2024-12",
      openness: "open weights",
      type: "paper",
      tags: ["MoE", "671B", "FP8 training", "MTP", "open"],
      status: "baseline",
      note: "DeepSeek-V3 is the 671B MoE predecessor to V4. Its paper covers MLA attention, DeepSeekMoE routing, FP8 mixed-precision training, Multi-Token Prediction, and GRPO alignment. V4 Pro/Flash explicitly build on V3's architecture.",
      links: [
        ["arXiv", "https://arxiv.org/abs/2412.19437"],
        ["PDF", "https://arxiv.org/pdf/2412.19437"],
        ["HF", "https://huggingface.co/deepseek-ai/DeepSeek-V3-Base"],
        ["GitHub", "https://github.com/deepseek-ai/DeepSeek-V3"]
      ],
      methods: ["MLA", "DeepSeekMoE", "auxiliary-loss-free load balancing", "FP8 mixed precision", "Multi-Token Prediction", "GRPO"],
      benchmarks: ["MMLU", "LiveCodeBench", "MATH-500", "AIME 2024"],
      deepDive: "deepseek-v3"
    },
    {
      id: "deepseek-r1",
      name: "DeepSeek-R1",
      org: "DeepSeek-AI",
      date: "2025-01",
      openness: "open weights",
      type: "paper",
      tags: ["reasoning", "RL", "chain-of-thought", "distillation", "open"],
      status: "baseline",
      note: "DeepSeek-R1 demonstrates emergent reasoning from RL (GRPO) without explicit CoT supervision. Cold-start + multi-stage RL pipeline; distilled into 1.5B–70B models that outperform o1-mini on multiple benchmarks.",
      links: [
        ["arXiv", "https://arxiv.org/abs/2501.12948"],
        ["PDF", "https://arxiv.org/pdf/2501.12948"],
        ["HF", "https://huggingface.co/deepseek-ai/DeepSeek-R1"],
        ["GitHub", "https://github.com/deepseek-ai/DeepSeek-R1"]
      ],
      methods: ["GRPO", "cold-start Long-CoT", "reasoning RL", "self-verification", "distillation"],
      benchmarks: ["AIME 2024", "MATH-500", "LiveCodeBench", "GPQA Diamond"],
      deepDive: "deepseek-r1"
    },
    {
      id: "grok-4-3",
      name: "Grok 4.3",
      org: "xAI",
      date: "2026-06-15",
      openness: "API",
      type: "model docs + AWS model card",
      tags: ["reasoning", "1M context", "tool use", "enterprise", "API"],
      status: "latest",
      note: "Grok 4.3 is xAI's current flagship model with always-on configurable reasoning (none/low/medium/high). 1M-token context, text+image input, function calling, structured outputs. Runs on Mantle, a new inference engine on Amazon Bedrock. Launched June 15, 2026. Knowledge cutoff November 2024. Priced at $1.25 input / $2.50 output per 1M tokens. xAI claims lowest hallucination rate and strongest agentic tool calling.",
      links: [
        ["xAI docs", "https://docs.x.ai/developers/models/grok-4.3"],
        ["AWS model card", "https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-xai-grok-4-3.html"],
        ["xAI models page", "https://docs.x.ai/developers/models"]
      ],
      methods: ["always-on reasoning", "configurable reasoning effort", "Mantle inference engine", "encrypted reasoning content", "agentic tool calling"],
      benchmarks: ["non-hallucination rate", "tool calling", "instruction following", "contract review", "financial doc Q&A"]
    },
    {
      id: "grok-4-20",
      name: "Grok 4.20",
      org: "xAI",
      date: "2026",
      openness: "API",
      type: "model docs",
      tags: ["speed", "reasoning", "1M context", "low hallucination", "API"],
      status: "current",
      note: "Grok 4.20 is xAI's speed-focused model with industry-leading speed and lowest hallucination rate. Available in reasoning and non-reasoning variants. 1M-token context. Same pricing as Grok 4.3 ($1.25/$2.50). Strict prompt adherence for precise, truthful responses.",
      links: [
        ["Reasoning variant", "https://docs.x.ai/developers/models/grok-4.20-0309-reasoning"],
        ["xAI models page", "https://docs.x.ai/developers/models"]
      ],
      methods: ["fast inference", "low hallucination", "prompt adherence", "reasoning/non-reasoning variants"],
      benchmarks: ["speed benchmarks", "hallucination rate"]
    },
    {
      id: "grok-build-01",
      name: "Grok Build 0.1",
      org: "xAI",
      date: "2026",
      openness: "API (early access)",
      type: "model docs",
      tags: ["coding", "agentic", "fast", "256K context", "API"],
      status: "early access",
      note: "Grok Build 0.1 is xAI's fast coding model trained specifically for agentic coding tasks. Currently in early access. 256K-token context (vs 1M for Grok 4.3). Priced at $1.00 input / $2.00 output per 1M tokens — cheaper than the flagship line. Aliases include grok-code-fast.",
      links: [
        ["xAI docs", "https://docs.x.ai/developers/models/grok-build-0.1"],
        ["xAI models page", "https://docs.x.ai/developers/models"]
      ],
      methods: ["agentic coding training", "fast inference optimization"],
      benchmarks: ["agentic coding tasks"]
    },
    {
      id: "grok-4-1",
      name: "Grok 4.1",
      org: "xAI",
      date: "2025-11",
      openness: "API",
      type: "model card (PDF)",
      tags: ["baseline", "reasoning", "previous generation"],
      status: "baseline",
      note: "Grok 4.1 model card (November 2025) serves as the previous-generation baseline. The xAI docs API page tracks it as a prior release behind Grok 4.3. Knowledge cutoff November 2024. AWS Bedrock also provides a model card for the 4.1 generation.",
      links: [
        ["Model card PDF", "https://data.x.ai/2025-11-17-grok-4-1-model-card.pdf"],
        ["xAI models page", "https://docs.x.ai/developers/models"]
      ],
      methods: ["reasoning", "tool use"],
      benchmarks: ["reasoning", "tool calling"]
    }
  ];

  const frontierModels = modelRecords;

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
      name: "GPT-4.1 / 4.1 mini / 4.1 nano",
      org: "OpenAI",
      date: "2025-04",
      type: "official release + system card",
      tags: ["instruction following", "1M context", "coding"],
      note: "GPT-4.1 是 OpenAI 2025 年 4 月发布的 text-only 模型，专注 instruction following、1M long-context 和 coding。system card 评估了指令层级遵从和拒绝率。",
      links: [
        ["Release", "https://openai.com/index/gpt-4-1/"],
        ["System card", "https://openai.com/index/gpt-4-1-system-card/"],
        ["API docs", "https://platform.openai.com/docs/models/gpt-4-1"]
      ]
    },
    {
      name: "GPT-4o / 4o-mini",
      org: "OpenAI",
      date: "2024-05",
      type: "official release",
      tags: ["multimodal", "real-time voice", "efficient"],
      note: "GPT-4o 是 OpenAI 原生多模态模型（text + audio + vision 端到端），比 GPT-4 Turbo 快 2x、便宜 50%。GPT-4o-mini 以 82% MMLU 替代 GPT-3.5 Turbo。",
      links: [
        ["Release", "https://openai.com/index/hello-gpt-4o/"],
        ["Mini release", "https://openai.com/index/gpt-4o-mini-advancing-cost-efficient-intelligence/"],
        ["API docs", "https://platform.openai.com/docs/models/gpt-4o"]
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
        ["API docs", "https://docs.anthropic.com/en/docs/about-claude/models"]
      ],
      deepDive: "anthropic-claude"
    },
    {
      name: "Claude Opus 4.8",
      org: "Anthropic",
      date: "2026-05",
      type: "system card index",
      tags: ["coding", "agent", "closed"],
      note: "Claude Opus 4.8 在 Anthropic system card index 中列为 2026 年 5 月条目。是当前 Opus-tier agentic coding 前沿，$5/$25 per MTok，1M context，effort=high 默认。",
      links: [
        ["System cards", "https://www.anthropic.com/system-cards"],
        ["Model docs", "https://docs.anthropic.com/en/docs/about-claude/models"]
      ],
      deepDive: "anthropic-claude"
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
      name: "Gemini 2.5 Pro",
      org: "Google DeepMind",
      date: "2025-03",
      type: "model card",
      tags: ["thinking", "reasoning", "coding", "multimodal"],
      note: "Gemini 2.5 Pro 是 Google 首个 fully hybrid reasoning 模型，开发者可切换 thinking on/off。在 GPQA、AIME 2025 等数学/科学 benchmark 领先，coding 能力强。model card PDF 由 DeepMind 官方发布。",
      links: [
        ["Model card PDF", "https://storage.googleapis.com/deepmind-media/Model-Cards/Gemini-2-5-Pro-Model-Card.pdf"],
        ["Card index", "https://deepmind.google/models/model-cards/"],
        ["API docs", "https://ai.google.dev/gemini-api/docs/models"],
        ["Blog", "https://blog.google/innovation-and-ai/models-and-research/google-deepmind/gemini-model-thinking-updates-march-2025/"]
      ]
    },
    {
      name: "Gemini 2.5 Flash",
      org: "Google DeepMind",
      date: "2025-04",
      type: "model card",
      tags: ["thinking", "efficient", "multimodal", "hybrid reasoning"],
      note: "Gemini 2.5 Flash 是 2.5 系列的高效模型，支持 thinking on/off hybrid reasoning。定价 $0.30/1M tokens，定位为 cost-effective reasoning 选项。model card PDF 由 DeepMind 官方发布。",
      links: [
        ["Model card PDF", "https://storage.googleapis.com/deepmind-media/Model-Cards/Gemini-2-5-Flash-Model-Card.pdf"],
        ["Card index", "https://deepmind.google/models/model-cards/"],
        ["API docs", "https://ai.google.dev/gemini-api/docs/models"],
        ["Blog", "https://developers.googleblog.com/en/gemini-2-5-thinking-model-updates/"]
      ]
    },
    {
      name: "Grok 4.3",
      org: "xAI",
      date: "2026-06-15",
      type: "model docs + AWS model card",
      tags: ["reasoning", "1M context", "tool use", "enterprise", "API"],
      note: "Grok 4.3 is xAI flagship. Always-on configurable reasoning (none/low/medium/high), 1M context, Mantle inference engine on Bedrock. $1.25/$2.50 per MTok. Launched June 15, 2026. Knowledge cutoff Nov 2024. Source type is model docs + AWS model card, not a paper.",
      links: [
        ["xAI docs", "https://docs.x.ai/developers/models/grok-4.3"],
        ["AWS model card", "https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-xai-grok-4-3.html"],
        ["xAI models", "https://docs.x.ai/developers/models"]
      ]
    },
    {
      name: "Grok 4.20",
      org: "xAI",
      date: "2026",
      type: "model docs",
      tags: ["speed", "low hallucination", "reasoning variants", "API"],
      note: "Grok 4.20 is xAI speed-tier model. Reasoning + non-reasoning variants, 1M context, lowest hallucination rate claim. Same pricing as Grok 4.3.",
      links: [
        ["Reasoning variant", "https://docs.x.ai/developers/models/grok-4.20-0309-reasoning"],
        ["xAI models", "https://docs.x.ai/developers/models"]
      ]
    },
    {
      name: "Grok Build 0.1",
      org: "xAI",
      date: "2026 early access",
      type: "model docs",
      tags: ["coding", "agentic", "fast", "256K context", "API"],
      note: "Grok Build 0.1 is xAI's fast coding model for agentic coding, in early access. 256K context, $1.00/$2.00 per MTok — cheaper than flagship.",
      links: [
        ["xAI docs", "https://docs.x.ai/developers/models/grok-build-0.1"],
        ["xAI models", "https://docs.x.ai/developers/models"]
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

  const heatmapCompanies = ["OpenAI", "Anthropic", "Google", "Meta", "Z.ai", "DeepSeek", "Alibaba", "Moonshot", "xAI"];
  const heatmapTopics = ["Agent", "Coding", "Reasoning", "Long ctx", "Vision", "Open", "Safety"];
  const heatmapScores = {
    OpenAI: [3, 3, 3, 3, 2, 0, 3],
    Anthropic: [3, 3, 3, 2, 2, 0, 3],
    Google: [3, 2, 3, 3, 3, 0, 3],
    Meta: [2, 2, 2, 2, 3, 3, 2],
    "Z.ai": [3, 3, 2, 3, 2, 0, 1],
    DeepSeek: [2, 2, 3, 3, 0, 3, 1],
    Alibaba: [3, 3, 3, 3, 3, 3, 1],
    Moonshot: [3, 3, 2, 2, 3, 0, 1],
    xAI: [2, 2, 3, 3, 2, 0, 1]
  };

  const corpusRecords = [
    ["glm-5", "GLM-5: from Vibe Coding to Agentic Engineering", "Z.ai", "2026-02-17", "paper", "Open-weight model-body report covering data, mid-training, post-training, asynchronous agentic RL, ARC and long-horizon evaluation.", "https://arxiv.org/abs/2602.15763"],
    ["glm-5-2", "GLM-5.2: Built for Long-Horizon Tasks", "Z.ai", "2026-06-16", "official blog", "Separate GLM-5.2 release with 1M context, IndexShare, GLM Coding Plan, slime, OPD, anti-hack, and long-horizon coding benchmark tables.", "https://z.ai/blog/glm-5.2"],
    ["glm-indexcache", "IndexCache: Accelerating Sparse Attention via Cross-Layer Index Reuse", "Z.ai", "2026-03-12", "paper", "Sparse-attention efficiency paper used by GLM-5.2 blog as IndexShare/IndexCache evidence.", "https://arxiv.org/abs/2603.12201"],
    ["deepseek-v3", "DeepSeek-V3: A Strong Mixture-of-Experts Language Model", "DeepSeek-AI", "2024-12", "paper", "671B MoE architecture with MLA, DeepSeekMoE, FP8 training, Multi-Token Prediction, and GRPO alignment. V4 explicitly builds on V3.", "https://arxiv.org/abs/2412.19437"],
    ["deepseek-r1", "DeepSeek-R1: Incentivizing Reasoning Capability in LLMs via Reinforcement Learning", "DeepSeek-AI", "2025-01", "paper", "Reasoning model demonstrating emergent CoT from RL with GRPO. Cold-start + multi-stage pipeline; distilled into 1.5B–70B models.", "https://arxiv.org/abs/2501.12948"],
    ["deepseek-v4-pro", "DeepSeek-V4: Towards Highly Efficient Million-Token Context Intelligence", "DeepSeek-AI", "2026-04-24", "technical report", "Model-body report for Pro/Flash with CSA, HCA, mHC, Muon, OPD, GRPO, 1M context, and benchmark Tables 6/7.", "https://arxiv.org/html/2606.19348"],
    ["kimi-k2-6", "Kimi K2.6 Tech Blog: Advancing Open-Source Coding", "Moonshot AI", "2026", "official blog", "Official Kimi K2.6 source for coding, agent swarms, proactive agents, Claw Groups, benchmark tables, images, and evaluation footnotes.", "https://www.kimi.com/blog/kimi-k2-6"],
    ["kimi-k2-5", "Kimi K2.5 Technical Report", "Moonshot AI", "2026", "technical report", "Cited by K2.6 footnotes for prompts and benchmark setup; retained as Kimi baseline source.", "https://arxiv.org/pdf/2602.02276"],
    ["qwen3-235b", "Qwen3 Technical Report", "Alibaba / Qwen Team", "2025-05", "paper", "Dense + MoE family from 0.6B to 235B with unified thinking/non-thinking mode, thinking budget, knowledge distillation, and 119-language support. Apache 2.0. 61 authors.", "https://arxiv.org/abs/2505.09388"],
    ["qwen3-coder-next", "Qwen3-Coder-Next Technical Report", "Alibaba / Qwen Team", "2026-02", "paper", "80B total / 3B activated MoE specialized for coding agents. Agentic training via verifiable coding tasks + executable environments with mid-training RL. Competitive on SWE-Bench and Terminal-Bench. 20 authors.", "https://arxiv.org/abs/2603.00729"],
    ["qwen-3-7-max", "Qwen3.7-Max", "Alibaba / Qwen", "2026-06", "official blog/docs", "Current Qwen API flagship watch item; kept separate from open Qwen3-Coder records.", "https://qwen.ai/blog?id=qwen3.7"],
    ["llama-4", "Llama 4 Scout / Maverick / Behemoth", "Meta", "2025-04", "official blog + open weights", "MoE models with 10M context, early fusion multimodal, online RL + DPO post-training, Behemoth teacher distillation. Scout (17B active/16 experts), Maverick (17B active/128 experts), Behemoth (288B active/256 experts, in-training).", "https://ai.meta.com/blog/llama-4-multimodal-intelligence/"],
    ["openai-gpt-5-5", "GPT-5.5", "OpenAI", "2026", "system card", "Closed model source is a system card, not a paper.", "https://openai.com/index/gpt-5-5-system-card/"],
    ["openai-gpt-4-1", "GPT-4.1 / mini / nano", "OpenAI", "2025-04", "official release + system card", "Instruction-following model with 1M context, 54.6% SWE-bench Verified, and instruction hierarchy safety eval.", "https://openai.com/index/gpt-4-1/"],
    ["openai-gpt-4o", "GPT-4o / 4o-mini", "OpenAI", "2024-05", "official release", "Natively multimodal model (text + audio + vision end-to-end); 4o-mini replaces GPT-3.5 Turbo.", "https://openai.com/index/hello-gpt-4o/"],
    ["anthropic-claude", "Claude 2026 System Cards", "Anthropic", "2026", "system card index", "Closed Claude model facts should be pulled from the system-card index and API docs.", "https://www.anthropic.com/system-cards"],
    ["gemini-3-1", "Gemini 3.1 Pro", "Google DeepMind", "2026", "model card", "Closed multimodal reasoning model facts from DeepMind model-card index.", "https://deepmind.google/models/model-cards/gemini-3-1-pro/"],
    ["gemini-2-5-pro", "Gemini 2.5 Pro", "Google DeepMind", "2025-03", "model card PDF", "Hybrid reasoning model with thinking on/off; leads GPQA, AIME 2025 math/science benchmarks.", "https://storage.googleapis.com/deepmind-media/Model-Cards/Gemini-2-5-Pro-Model-Card.pdf"],
    ["gemini-2-5-flash", "Gemini 2.5 Flash", "Google DeepMind", "2025-04", "model card PDF", "Efficient hybrid reasoning model at $0.30/1M tokens; supports thinking on/off.", "https://storage.googleapis.com/deepmind-media/Model-Cards/Gemini-2-5-Flash-Model-Card.pdf"],
    ["xai-grok-4-3", "Grok 4.3", "xAI", "2026-06-15", "model docs + AWS model card", "xAI flagship with always-on configurable reasoning, 1M context, Mantle inference engine, $1.25/$2.50. Source is model docs and AWS Bedrock model card, not a paper.", "https://docs.x.ai/developers/models/grok-4.3"],
    ["xai-grok-4-20", "Grok 4.20", "xAI", "2026", "model docs", "Speed-tier model with reasoning + non-reasoning variants, 1M context, lowest hallucination rate claim. Same pricing as Grok 4.3.", "https://docs.x.ai/developers/models/grok-4.20-0309-reasoning"],
    ["xai-grok-build", "Grok Build 0.1", "xAI", "2026", "model docs (early access)", "Fast coding model for agentic coding, 256K context, $1.00/$2.00. Early access; aliases include grok-code-fast.", "https://docs.x.ai/developers/models/grok-build-0.1"],
    ["xai-grok-4-1", "Grok 4.1", "xAI", "2025-11", "model card PDF", "Previous-generation baseline model card (Nov 2025). Knowledge cutoff Nov 2024.", "https://data.x.ai/2025-11-17-grok-4-1-model-card.pdf"],
    ["apple-afm-3", "Apple Foundation Models 3", "Apple", "2026", "research page", "On-device/private foundation model line; source type remains research page until a full tech report is available.", "https://machinelearning.apple.com/research/introducing-third-generation-of-apple-foundation-models"],
    ["amazon-nova-2", "Amazon Nova 2", "Amazon / AWS", "2025-2026", "AI service card", "Enterprise model line tracked via AWS responsible AI service cards and model docs.", "https://aws.amazon.com/nova/models/"]
  ];

  const peopleRecords = [
    {
      id: "people-glm",
      lab: "Z.ai / GLM",
      cluster: "Open-weight frontier",
      disclosure: "full arXiv author table + team-only blogs",
      count: 187,
      sources: [
        ["GLM-5 arXiv", "https://arxiv.org/abs/2602.15763"],
        ["GLM-5.2 blog", "https://z.ai/blog/glm-5.2"],
        ["GLM-5.1 blog", "https://z.ai/blog/glm-5.1"]
      ],
      people: ["GLM-5-Team", "Aohan Zeng", "Xin Lv", "Zhenyu Hou", "Zhengxiao Du", "Qinkai Zheng"],
      reports: ["GLM-5", "GLM-5.1", "GLM-5.2", "IndexCache"],
      methods: ["DSA", "asynchronous RL", "OPD", "IndexShare", "agentic engineering"],
      note: "GLM-5 provides an explicit 187-entry arXiv author table; GLM-5.1/5.2 are official Z.ai release posts, so the page treats them as team-level evidence and links them back to the GLM author cluster."
    },
    {
      id: "people-deepseek",
      lab: "DeepSeek-AI",
      cluster: "Open-weight frontier",
      disclosure: "full arXiv author table",
      count: 319,
      sources: [
        ["DeepSeek-V4 arXiv HTML", "https://arxiv.org/html/2606.19348"],
        ["DeepSeek-V4 arXiv abs", "https://arxiv.org/abs/2606.19348"]
      ],
      people: ["DeepSeek-AI", "Anyi Xu", "Bangcai Lin", "Bing Xue", "Bingxuan Wang", "Bingzheng Xu", "Damai Dai"],
      reports: ["DeepSeek-V4 Pro", "DeepSeek-V4 Flash", "DeepSeek-V3/R1 lineage"],
      methods: ["CSA", "HCA", "mHC", "Muon", "OPD", "GRPO"],
      note: "DeepSeek-V4 exposes a large arXiv author table and is the primary personnel source for CSA/HCA/mHC/Muon/OPD details in this tracker."
    },
    {
      id: "people-kimi",
      lab: "Moonshot AI / Kimi",
      cluster: "Open-source coding and agentic",
      disclosure: "full arXiv author table + team-only docs/blogs",
      count: 326,
      sources: [
        ["Kimi K2.5 arXiv", "https://arxiv.org/abs/2602.02276"],
        ["Kimi K2.6 blog", "https://www.kimi.com/blog/kimi-k2-6"],
        ["Kimi K2.7 Code docs", "https://platform.kimi.ai/docs/guide/kimi-k2-7-code-quickstart"]
      ],
      people: ["Kimi Team", "Tongtong Bai", "Yifan Bai", "Yiping Bao", "S. H. Cai", "Yuan Cao"],
      reports: ["Kimi K2.5", "Kimi K2.6", "Kimi K2.7 Code"],
      methods: ["Agent Swarm", "joint text-vision RL", "MuonClip watchlist", "long-horizon coding"],
      note: "Kimi K2.5 supplies the explicit 326-author table. K2.6 and K2.7 Code are official product/technical posts, so their personnel evidence is team-level unless a later formal report adds individual authors."
    },
    {
      id: "people-qwen",
      lab: "Alibaba / Qwen Team",
      cluster: "Open + API frontier",
      disclosure: "full arXiv author tables (Qwen3 + Coder-Next)",
      count: 61,
      sources: [
        ["Qwen3 arXiv", "https://arxiv.org/abs/2505.09388"],
        ["Qwen3-Coder-Next arXiv", "https://arxiv.org/abs/2603.00729"],
        ["Qwen3.7 blog", "https://qwen.ai/blog?id=qwen3.7"],
        ["Qwen3-Coder GitHub", "https://github.com/QwenLM/Qwen3-Coder"]
      ],
      people: ["An Yang", "Binyuan Hui", "Junyang Lin", "Fan Zhou", "Ruisheng Cao", "Mouxiang Chen", "Zeyu Cui", "Jingren Zhou"],
      reports: ["Qwen3 Technical Report", "Qwen3-Coder-Next", "Qwen3.7-Max", "Qwen3-Coder"],
      methods: ["MoE routing", "thinking/non-thinking unified mode", "agentic training", "verifiable coding tasks", "knowledge distillation"],
      note: "Qwen3 Technical Report (arXiv 2505.09388) provides a 61-author table. Qwen3-Coder-Next (arXiv 2603.00729) provides 20 alphabetical authors. Several authors (Binyuan Hui, Junyang Lin, Fan Zhou) appear in both reports, establishing shared team lineage."
    },
    {
      id: "people-openai",
      lab: "OpenAI",
      cluster: "Closed frontier",
      disclosure: "system card / official release",
      count: null,
      sources: [
        ["OpenAI research", "https://openai.com/research/"],
        ["GPT-5.5 system card", "https://openai.com/index/gpt-5-5-system-card/"],
        ["ChatGPT Agent system card", "https://openai.com/index/chatgpt-agent-system-card/"]
      ],
      people: ["OpenAI research", "Preparedness", "Model Behavior", "Safety Systems"],
      reports: ["GPT-5.x", "GPT-4.1", "GPT-4o", "ChatGPT Agent", "Operator-style agents"],
      methods: ["system card", "agent safety", "tool policy", "preparedness eval"],
      note: "Closed OpenAI model records are not personnel-attributed papers here. The tracker keeps them at org/team granularity unless the official page names authors."
    },
    {
      id: "people-anthropic",
      lab: "Anthropic",
      cluster: "Closed frontier",
      disclosure: "system card index",
      count: null,
      sources: [
        ["Anthropic system cards", "https://www.anthropic.com/system-cards"],
        ["Anthropic research", "https://www.anthropic.com/research"]
      ],
      people: ["Anthropic research", "Frontier Red Team", "Safety Science"],
      reports: ["Claude Opus 4.8", "Claude Fable 5 / Mythos 5", "Claude system cards (16 total)"],
      methods: ["constitutional AI", "frontier safety", "tool-use eval", "system card", "adaptive thinking"],
      note: "Claude facts are sourced through Anthropic system cards and research posts; the page avoids inventing per-person authorship for product cards."
    },
    {
      id: "people-google",
      lab: "Google DeepMind",
      cluster: "Closed multimodal frontier",
      disclosure: "model card / technical report mix",
      count: null,
      sources: [
        ["DeepMind model cards", "https://deepmind.google/models/model-cards/"],
        ["Gemini model cards", "https://deepmind.google/models/gemini/"]
      ],
      people: ["Google DeepMind", "Gemini Team"],
      reports: ["Gemini 3.x", "Gemini model-card lineage"],
      methods: ["multimodal eval", "safety model cards", "long-context"],
      note: "Gemini watch entries are linked to official model cards. Individual names should be copied only from formal reports that expose author tables."
    },
    {
      id: "people-agent-papers",
      lab: "Agent paper lineage",
      cluster: "Academic methods",
      disclosure: "paper author lists",
      count: null,
      sources: [
        ["ReAct", "https://arxiv.org/abs/2210.03629"],
        ["Toolformer", "https://arxiv.org/abs/2302.04761"],
        ["AutoGen", "https://arxiv.org/abs/2308.08155"],
        ["SWE-agent", "https://arxiv.org/abs/2405.15793"]
      ],
      people: ["Shunyu Yao", "Timo Schick", "Qingyun Wu", "John Yang", "Ofir Press"],
      reports: ["ReAct", "Toolformer", "AutoGen", "SWE-agent"],
      methods: ["reason-act loop", "tool self-supervision", "multi-agent conversation", "agent-computer interface"],
      note: "This cluster keeps named academic method authors next to frontier-model teams, so agent mechanisms can be traced back to their original literature instead of only to product releases."
    },
    {
      id: "people-meta",
      lab: "Meta AI",
      cluster: "Open model + tool literature",
      disclosure: "paper and official release mix",
      count: null,
      sources: [
        ["Meta AI research", "https://ai.meta.com/research/"],
        ["Toolformer", "https://arxiv.org/abs/2302.04761"],
        ["Llama", "https://ai.meta.com/llama/"],
        ["Llama 4 blog", "https://ai.meta.com/blog/llama-4-multimodal-intelligence/"]
      ],
      people: ["Meta AI", "Timo Schick", "Jane Dwivedi-Yu", "Roberto Dessì", "Roberta Raileanu"],
      reports: ["Toolformer", "Llama 4 Scout/Maverick/Behemoth", "Meta open-model line"],
      methods: ["MoE routing", "early fusion multimodal", "online RL", "DPO", "open weights", "distillation from teacher model"],
      note: "Meta is split between named research papers such as Toolformer and team-level Llama release pages. Llama 4 blog (April 2025) is the primary source for Scout/Maverick/Behemoth architecture, training, and evaluation details."
    },
    {
      id: "people-minimax",
      lab: "MiniMax",
      cluster: "Open-weight agentic frontier",
      disclosure: "full arXiv author table (M2)",
      count: 150,
      sources: [
        ["MiniMax-M2 arXiv", "https://arxiv.org/abs/2605.26494"],
        ["MiniMax-M3 blog", "https://www.minimax.io/blog/minimax-m3"],
        ["MiniMax-M1 arXiv", "https://arxiv.org/abs/2506.13585"]
      ],
      people: ["MiniMax", "Li Yuan", "Aili Chen", "Aonian Li", "Baichuan Zhou", "Bangwei Gong", "Binyang Jiang"],
      reports: ["MiniMax-M1", "MiniMax-M2", "MiniMax-M3"],
      methods: ["Forge RL", "MSA sparse attention", "self-evolution scaffold", "agent-driven data pipeline"],
      note: "MiniMax-M2 provides a 150+ author arXiv table. M3 is tracked as official blog release. The team's Forge RL system and self-evolution M2.7 checkpoint are unique contributions to the agentic training landscape."
    },
    {
      id: "people-apple-amazon",
      lab: "Apple / Amazon",
      cluster: "Enterprise and on-device",
      disclosure: "research page / service card",
      count: null,
      sources: [
        ["Apple Foundation Models 3", "https://machinelearning.apple.com/research/introducing-third-generation-of-apple-foundation-models"],
        ["Amazon Nova models", "https://aws.amazon.com/nova/models/"],
        ["AWS AI service cards", "https://docs.aws.amazon.com/ai/responsible-ai/"]
      ],
      people: ["Apple Machine Learning Research", "Amazon AGI", "AWS Responsible AI"],
      reports: ["Apple Foundation Models 3", "Amazon Nova 2"],
      methods: ["on-device privacy", "AI service cards", "enterprise safety"],
      note: "These entries are intentionally team-level because official pages emphasize product/research organizations more than individual author tables."
    },
    {
      id: "people-xai",
      lab: "xAI",
      cluster: "Closed frontier",
      disclosure: "model docs / AWS model card",
      count: null,
      sources: [
        ["xAI models docs", "https://docs.x.ai/developers/models"],
        ["AWS Grok 4.3 card", "https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-xai-grok-4-3.html"],
        ["Grok 4.1 model card", "https://data.x.ai/2025-11-17-grok-4-1-model-card.pdf"]
      ],
      people: ["xAI"],
      reports: ["Grok 4.3", "Grok 4.20", "Grok Build 0.1", "Grok 4.1"],
      methods: ["always-on reasoning", "Mantle inference engine", "encrypted reasoning content", "agentic tool calling"],
      note: "xAI model records are team-level releases via API docs and AWS model cards. No individual author tables are exposed. The Grok 4.1 model card PDF (Nov 2025) is the earliest source in the current tracker."
    }
  ];

  const peopleMatrixRows = [
    ["Full arXiv author tables", "GLM-5: 187 authors; DeepSeek-V4: 319 authors; Kimi K2.5: 326 authors; Qwen3: 61 authors; Qwen3-Coder-Next: 20 authors. These are the highest-confidence personnel lists because they come from formal arXiv metadata.", "GLM / DeepSeek / Kimi / Qwen"],
    ["Team-only official releases", "GLM-5.1/5.2, Kimi K2.6/K2.7 Code, Qwen3.7-Max, closed-model system cards, and enterprise service cards are tracked as team/org releases unless a page explicitly names individuals.", "Z.ai / Moonshot / Qwen / Closed labs"],
    ["Method lineage authors", "ReAct, Toolformer, AutoGen, and SWE-agent keep named paper authors so agent methods can be traced across model reports and benchmark harnesses.", "Agent papers"],
    ["Affiliation caution", "The tracker uses publication-time organization or official releasing entity. It does not infer a person's current employer from older papers or social profiles.", "All records"]
  ];

  const ecosystemSource = "https://arxiv.org/html/2602.15763v2";

  const ecosystemCategories = [
    {
      id: "open-source",
      name: "Open-source Communities",
      short: "OSS",
      role: "Model hubs, local runtimes, inference engines, fine-tuning stacks, and community deployment paths.",
      evidence: "GLM-5 Acknowledgement lists these as open-source community co-launch partners.",
      partners: ["Hugging Face", "MLX", "ModelScope", "SGLang", "Unsloth", "vLLM", "xLLM"],
      source: ecosystemSource
    },
    {
      id: "inference",
      name: "Inference Providers",
      short: "Inference",
      role: "Hosted inference, enterprise cloud deployment, serverless GPU, and managed model endpoints.",
      evidence: "GLM-5 Acknowledgement lists these as inference-provider co-launch partners.",
      partners: ["Amazon Bedrock", "Atlas Cloud", "Baidu AI Cloud", "Baseten", "Cerebras", "DeepInfra", "Fireworks", "FriendliAI", "GMI Cloud", "Google Cloud Vertex AI", "Infinigence AI", "Modal", "Novita AI", "Parasail", "Phala", "PPIO", "SiliconFlow", "StreamLake", "Together AI", "Venice", "Weights & Biases"],
      source: ecosystemSource
    },
    {
      id: "applications",
      name: "Applications",
      short: "Apps",
      role: "Coding agents, office/document workflows, IDE copilots, and developer-facing agent products.",
      evidence: "GLM-5 Acknowledgement lists these as application co-launch partners.",
      partners: ["CatPaw", "Cline", "CodeBuddy", "CodeRider", "Coze", "Crush", "Factory AI", "Kilo Code", "MonkeyCode", "OpenClaw", "OpenCode", "Qoder", "Roo Code", "TRAE", "Verdent AI", "WPS", "YouWare"],
      source: ecosystemSource
    },
    {
      id: "gateways",
      name: "AI Gateways",
      short: "Gateways",
      role: "Model routing, API gateways, model-selection surfaces, and multi-provider access layers.",
      evidence: "GLM-5 Acknowledgement lists these as AI-gateway co-launch partners.",
      partners: ["AI Ping", "EZmodel", "iFlow", "OpenRouter", "Vercel", "Yupp", "ZenMux"],
      source: ecosystemSource
    }
  ];

  function makePartnerId(name) {
    return name.toLowerCase().replace(/&/g, "and").replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "");
  }

  const ecosystemPartners = ecosystemCategories.flatMap((category) => category.partners.map((name) => ({
    id: makePartnerId(name),
    name,
    category: category.id,
    categoryName: category.name,
    role: category.role,
    evidence: category.evidence,
    source: category.source,
    reports: ["GLM-5"]
  })));

  const ecosystemMatrixRows = [
    {
      report: "GLM-5",
      modelId: "glm-5",
      sourceType: "paper acknowledgement",
      url: ecosystemSource,
      cells: {"Open-source Communities": "7", "Inference Providers": "21", Applications: "17", "AI Gateways": "7"},
      status: "listed",
      note: "Formal acknowledgement table with 52 named partners in four categories."
    },
    {
      report: "GLM-5.2",
      modelId: "glm-5-2",
      sourceType: "official blog + docs",
      url: "https://z.ai/blog/glm-5.2",
      cells: {"Open-source Communities": "tooling links", "Inference Providers": "-", Applications: "-", "AI Gateways": "-"},
      status: "partial",
      note: "Blog and docs expose model hubs and local deployment frameworks such as Hugging Face, ModelScope, transformers, vLLM, SGLang, xLLM, and ktransformers, but not a comparable co-launch partner list."
    },
    {
      report: "DeepSeek-V4",
      modelId: "deepseek-v4-pro",
      sourceType: "technical report + official release",
      url: "https://api-docs.deepseek.com/news/news260424",
      cells: {"Open-source Communities": "HF collection", "Inference Providers": "API", Applications: "-", "AI Gateways": "API-compatible"},
      status: "partial",
      note: "Release confirms DeepSeek API access and OpenAI/Anthropic-compatible APIs; it is not a categorized partner acknowledgement."
    },
    {
      report: "Kimi K2.6 / K2.7 Code",
      modelId: "kimi-k2-6",
      sourceType: "official blog + model docs",
      url: "https://www.kimi.com/blog/kimi-k2-6",
      cells: {"Open-source Communities": "-", "Inference Providers": "-", Applications: "Kimi Code / Claw", "AI Gateways": "-"},
      status: "partial",
      note: "Kimi sources describe product and coding-agent surfaces; no four-category co-launch partner table is confirmed in the tracked sources."
    },
    {
      report: "Qwen3.7-Max",
      modelId: "qwen-3-7-max",
      sourceType: "official blog + docs",
      url: "https://qwen.ai/blog?id=qwen3.7",
      cells: {"Open-source Communities": "Qwen open line", "Inference Providers": "Alibaba Cloud", Applications: "-", "AI Gateways": "-"},
      status: "partial",
      note: "Qwen3.7-Max is tracked as an official Qwen/Alibaba release; no comparable acknowledgement partner table is confirmed."
    }
  ];

  const methodRegistry = [
    ["csa", "CSA", "Compressed Sparse Attention", "DeepSeek V4 architecture", "Compresses KV cache blocks, then uses sparse selection over compressed entries for long-context efficiency.", ["deepseek-v4-pro", "deepseek-v4-flash"], "https://arxiv.org/html/2606.19348"],
    ["hca", "HCA", "Heavily Compressed Attention", "DeepSeek V4 architecture", "Uses a heavier compression rate than CSA and keeps dense attention over compressed entries.", ["deepseek-v4-pro", "deepseek-v4-flash"], "https://arxiv.org/html/2606.19348"],
    ["mhc", "mHC", "Modified/strengthened residual path in report", "DeepSeek V4 architecture", "The report states that DeepSeek-V4 strengthens conventional residual connections with mHC and implements cost-effective mHC with recomputation and fused kernels.", ["deepseek-v4-pro", "deepseek-v4-flash"], "https://arxiv.org/html/2606.19348"],
    ["muon", "Muon", "Muon optimizer", "pre-training", "DeepSeek-V4 uses Muon for most modules, AdamW for embeddings, prediction head, and RMSNorm weights, with hybrid ZeRO bucket assignment for efficient implementation.", ["deepseek-v4-pro", "deepseek-v4-flash"], "https://arxiv.org/html/2606.19348"],
    ["opd", "OPD", "On-Policy Distillation", "post-training", "DeepSeek-V4 replaces mixed RL with OPD; GLM-5/5.2 use on-policy cross-stage or parallel OPD to merge expert capabilities while reducing regression.", ["deepseek-v4-pro", "glm-5", "glm-5-2"], "https://arxiv.org/html/2606.19348"],
    ["grpo", "GRPO", "Group Relative Policy Optimization", "RL", "DeepSeek-V4 specialists use GRPO; DeepSeek R1 remains the baseline paper for the method lineage.", ["deepseek-v4-pro", "deepseek-v3-r1"], "https://arxiv.org/abs/2501.12948"],
    ["indexcache", "IndexCache / IndexShare", "Cross-layer sparse-index reuse", "long-context architecture", "GLM-5.2 reuses indexers across sparse-attention layers; IndexCache reports 75% indexer computation removal on DSA models with low quality loss.", ["glm-5-2"], "https://arxiv.org/abs/2603.12201"],
    ["async-rl", "Asynchronous RL", "Decoupled agentic RL", "agentic training", "GLM-5 decouples training and inference engines to reduce bubbles caused by long-tail agent rollouts.", ["glm-5"], "https://arxiv.org/pdf/2602.15763"],
    ["glm-data", "GLM data filters", "DCLM, World Knowledge, code and math classifiers", "pre-training data", "GLM-5 data pipeline adds sentence-embedding DCLM, World Knowledge, low-resource code classifiers, LLM educational scoring, and chunk-and-aggregate scoring.", ["glm-5"], "https://arxiv.org/pdf/2602.15763"],
    ["anti-hack", "Anti-hack", "Online rule + LLM judge guard", "agentic RL/eval", "GLM-5.2 blog describes a two-stage anti-hack module for coding agents that blocks exploitative tool calls while preserving rollouts.", ["glm-5-2"], "https://z.ai/blog/glm-5.2"],
    ["muonclip", "MuonClip", "Kimi optimizer lineage", "watchlist", "Kimi K2.6 footnotes reference the Kimi K2.5 report; keep MuonClip as Kimi lineage until directly verified in the report text.", ["kimi-k2-6", "kimi-k2-5"], "https://arxiv.org/pdf/2602.02276"],
    ["forge-rl", "Forge RL", "Agent-native reinforcement learning", "post-training / RL", "MiniMax M2's Forge system adapts to long-horizon agent trajectories with windowed-FIFO scheduling, prefix-tree merging, and inference optimization. Supports both white-box and black-box agent decoupling.", ["minimax-m2", "minimax-m3"], "https://arxiv.org/abs/2605.26494"],
    ["msa", "MSA", "Mini Sparse Attention", "inference / architecture", "MiniMax M3 uses MSA for 1M-token context with 15.6x faster decoding at 1M tokens compared to dense attention baselines.", ["minimax-m3"], "https://www.minimax.io/blog/minimax-m3"],
    ["self-evolution", "Self-evolution scaffold", "Autonomous training-run debugging", "agentic training", "MiniMax M2.7 checkpoint autonomously debugs training runs and modifies its own scaffold — an early step toward self-improving agent infrastructure.", ["minimax-m2"], "https://arxiv.org/abs/2605.26494"],
    ["tool-harness", "Agent harnesses", "SWE/Terminal/browser/MCP tools", "evaluation", "DeepSeek, Kimi, and GLM all use long-step agent harnesses with shell/file/search/browser/tool constraints; details differ by report.", ["deepseek-v4-pro", "kimi-k2-6", "glm-5"], "https://arxiv.org/html/2606.19348"]
  ];

  const figureAtlas = [
    ["deepseek-fig8", "DeepSeek V4 Figure 8", "Formal reasoning practical/frontier regimes", "https://arxiv.org/html/2606.19348v1/x8.png", "https://arxiv.org/html/2606.19348"],
    ["deepseek-fig9", "DeepSeek V4 Figure 9", "MRCR 1M long-context retrieval stability", "https://arxiv.org/html/2606.19348v1/x10.png", "https://arxiv.org/html/2606.19348"],
    ["deepseek-fig10", "DeepSeek V4 Figure 10", "Reasoning effort vs HLE and TerminalBench cost/performance", "https://arxiv.org/html/2606.19348v1/x11.png", "https://arxiv.org/html/2606.19348"],
    ["glm52-long-horizon", "GLM-5.2 long-horizon coding chart", "FrontierSWE, PostTrainBench and SWE-Marathon comparison from Z.ai blog", "https://z-cdn-media.chatglm.cn/prompts-rich-media-resources/5.2-blog/20260617-012551.png", "https://z.ai/blog/glm-5.2"],
    ["glm52-standard-coding", "GLM-5.2 standard coding chart", "Terminal-Bench 2.1 and SWE-bench Pro comparison", "https://z-cdn-media.chatglm.cn/prompts-rich-media-resources/5.2-blog/20260617-012836.png", "https://z.ai/blog/glm-5.2"],
    ["glm52-effort", "GLM-5.2 effort-level chart", "Reasoning effort and token-budget comparison", "https://z-cdn-media.chatglm.cn/prompts-rich-media-resources/5.2-blog/20260617-010855.png", "https://z.ai/blog/glm-5.2"],
    ["glm52-throughput", "GLM-5.2 inference throughput", "Long-context engine optimization figure", "https://z-cdn-media.chatglm.cn/prompts-rich-media-resources/5.2-blog/rJip3TCbGl.png", "https://z.ai/blog/glm-5.2"],
    ["kimi-k26-1", "Kimi K2.6 original blog figure 1", "Official Kimi K2.6 report image from Moonshot blog", "https://kimi-file.moonshot.cn/prod-chat-kimi/kfs/4/2/2026-04-20/1d7j2jpl3v89kkei5mq70?x-tos-process=image%2Fauto-orient%2C1%2Fstrip%2Fignore-error%2C1", "https://www.kimi.com/blog/kimi-k2-6"],
    ["kimi-k26-2", "Kimi K2.6 original blog figure 2", "Official Kimi K2.6 report image from Moonshot blog", "https://kimi-file.moonshot.cn/prod-chat-kimi/kfs/4/2/2026-04-20/1d7j305qav1fc641b5670?x-tos-process=image%2Fauto-orient%2C1%2Fstrip%2Fignore-error%2C1", "https://www.kimi.com/blog/kimi-k2-6"],
    ["kimi-k26-3", "Kimi K2.6 original blog figure 3", "Official Kimi K2.6 report image from Moonshot blog", "https://kimi-file.moonshot.cn/prod-chat-kimi/kfs/4/2/2026-04-20/1d7j1727f2ena623likig?x-tos-process=image%2Fauto-orient%2C1%2Fstrip%2Fignore-error%2C1", "https://www.kimi.com/blog/kimi-k2-6"]
  ];

  const scoreModels = ["GLM-5.2", "GLM-5", "DeepSeek V4 Pro Max", "MiniMax M3", "Kimi K2.6", "Qwen3.7-Max", "GPT-5.x", "Claude Opus", "Gemini"];
  const benchmarkRows = [
    ["Reasoning", "HLE", "Pass@1", {"GLM-5.2": 40.5, "DeepSeek V4 Pro Max": 37.7, "Kimi K2.6": 36.4, "Qwen3.7-Max": 41.4, "GPT-5.x": 41.4, "Claude Opus": 49.8, "Gemini": 45.0}, "GLM-5.2 blog and DeepSeek-V4 Table 6"],
    ["Reasoning", "HLE with tools", "Pass@1", {"GLM-5.2": 54.7, "DeepSeek V4 Pro Max": 48.2, "Kimi K2.6": 54.0, "Qwen3.7-Max": 53.5, "GPT-5.x": 52.2, "Claude Opus": 57.9, "Gemini": 51.4}, "Tool-augmented HLE"],
    ["Reasoning", "GPQA Diamond", "Pass@1", {"GLM-5.2": 91.2, "DeepSeek V4 Pro Max": 90.1, "Kimi K2.6": 90.5, "Qwen3.7-Max": 90.0, "GPT-5.x": 93.0, "Claude Opus": 93.6, "Gemini": 94.3}, "Deep reasoning"],
    ["Reasoning", "AIME 2026", "Pass@1", {"GLM-5.2": 99.2, "DeepSeek V4 Pro Max": 94.6, "Qwen3.7-Max": 97.0, "GPT-5.x": 98.3, "Claude Opus": 95.7, "Gemini": 98.2}, "Math contest"],
    ["Reasoning", "HMMT Feb 2026", "Pass@1", {"GLM-5.2": 92.5, "DeepSeek V4 Pro Max": 95.2, "Qwen3.7-Max": 97.1, "GPT-5.x": 96.7, "Claude Opus": 96.7, "Gemini": 87.3}, "Math contest"],
    ["Coding", "LiveCodeBench-v6", "Pass@1", {"DeepSeek V4 Pro Max": 93.5, "Kimi K2.6": 89.6, "Gemini": 91.7, "Claude Opus": 88.8}, "DeepSeek-V4 Table 6"],
    ["Coding", "Codeforces", "Rating", {"DeepSeek V4 Pro Max": 3206, "GPT-5.x": 3168, "Gemini": 3052}, "DeepSeek-V4 Table 6"],
    ["Coding", "Terminal Bench 2.1", "Acc", {"GLM-5.2": 81.0, "DeepSeek V4 Pro Max": 64.0, "Kimi K2.6": 66.7, "Qwen3.7-Max": 75.0, "GPT-5.x": 84.0, "Claude Opus": 85.0, "Gemini": 74.0}, "GLM-5.2 blog"],
    ["Coding", "SWE-bench Pro", "Resolved", {"GLM-5.2": 62.1, "DeepSeek V4 Pro Max": 55.4, "Kimi K2.6": 58.6, "Qwen3.7-Max": 60.6, "GPT-5.x": 58.6, "Claude Opus": 69.2, "Gemini": 54.2}, "GLM-5.2 blog and DeepSeek-V4 Table 6"],
    ["Coding", "SWE-rebench Jan 2026", "Resolved", {"GLM-5": 42.1, "Kimi K2.6": 37.9, "GPT-5.x": 51.7, "Claude Opus": 52.9, "Gemini": 46.7}, "GLM-5 report Table 9"],
    ["Long Context", "MRCR 1M", "MMR", {"DeepSeek V4 Pro Max": 83.5, "Claude Opus": 92.9, "Gemini": 76.3}, "DeepSeek-V4 Table 6"],
    ["Long Context", "CorpusQA 1M", "ACC", {"DeepSeek V4 Pro Max": 62.0, "Claude Opus": 71.7, "Gemini": 53.8}, "DeepSeek-V4 Table 6"],
    ["Agentic", "FrontierSWE", "Dominance", {"GLM-5.2": 74.4, "DeepSeek V4 Pro Max": 29.0, "GPT-5.x": 72.6, "Claude Opus": 75.1, "Gemini": 39.6}, "GLM-5.2 blog"],
    ["Agentic", "PostTrainBench", "Score", {"GLM-5.2": 34.3, "GPT-5.x": 28.4, "Claude Opus": 37.2, "Gemini": 21.6}, "GLM-5.2 blog"],
    ["Agentic", "SWE-Marathon", "Pass", {"GLM-5.2": 13.0, "GPT-5.x": 12.0, "Claude Opus": 26.0, "Gemini": 4.0}, "GLM-5.2 blog"],
    ["Agentic", "MCPAtlas Public", "Pass@1", {"GLM-5.2": 76.8, "DeepSeek V4 Pro Max": 73.6, "Kimi K2.6": 66.6, "Qwen3.7-Max": 76.4, "GPT-5.x": 75.3, "Claude Opus": 77.8, "Gemini": 69.2}, "GLM-5.2 blog and DeepSeek-V4 Table 6"],
    ["Agentic", "Tool-Decathlon", "Pass@1", {"GLM-5.2": 48.2, "DeepSeek V4 Pro Max": 51.8, "Kimi K2.6": 50.0, "GPT-5.x": 55.6, "Claude Opus": 59.9, "Gemini": 48.8}, "GLM-5.2 blog and DeepSeek-V4 Table 6"]
  ];

  const sourceLedger = [
    ["GLM-5", "paper", "https://arxiv.org/pdf/2602.15763", "pre-training, mid-training, post-training, agentic engineering, ARC/CC-Bench/SWE-rebench, real-world evals"],
    ["GLM-5.2", "official blog", "https://z.ai/blog/glm-5.2", "1M context, IndexShare, benchmark tables, slime, OPD, anti-hack, images"],
    ["IndexCache / IndexShare", "paper", "https://arxiv.org/abs/2603.12201", "GLM-5.2 long-context sparse-attention method"],
    ["DeepSeek V4", "technical report", "https://arxiv.org/html/2606.19348", "CSA/HCA/mHC/Muon/OPD/GRPO, Tables 6/7, Figures 8-10"],
    ["DeepSeek V3", "paper", "https://arxiv.org/abs/2412.19437", "671B MoE architecture, MLA, DeepSeekMoE, FP8 training, MTP, GRPO alignment"],
    ["DeepSeek R1", "paper", "https://arxiv.org/abs/2501.12948", "Reasoning from RL, cold-start Long-CoT, GRPO, distillation into smaller models"],
    ["DeepSeek V4 release", "official release", "https://api-docs.deepseek.com/news/news260424", "DeepSeek V4 API and release context"],
    ["Kimi K2.6", "official blog", "https://www.kimi.com/blog/kimi-k2-6", "Kimi K2.6 benchmark tables, footnotes, original figures"],
    ["Kimi K2.5", "technical report", "https://arxiv.org/pdf/2602.02276", "Kimi baseline and evaluation setup referenced by K2.6"],
    ["Kimi K2.7 Code", "model docs", "https://platform.kimi.ai/docs/guide/kimi-k2-7-code-quickstart", "latest Kimi coding-model API line"],
    ["GLM/DeepSeek/Kimi author tables", "arXiv metadata", "https://export.arxiv.org/api/query?id_list=2602.15763,2602.02276,2606.19348", "author counts and representative author lists for People Network"],
    ["GLM-5 co-launch partners", "paper acknowledgement", "https://arxiv.org/html/2602.15763v2", "52 ecosystem partners across open-source communities, inference providers, applications, and AI gateways"],
    ["Agent paper authors", "paper set", "https://arxiv.org/abs/2308.08155", "AutoGen plus ReAct/Toolformer/SWE-agent author lineage"],
    ["Qwen3.7-Max", "official blog + docs", "https://qwen.ai/blog?id=qwen3.7", "latest Qwen API flagship source"],
    ["Qwen3 Technical Report", "paper", "https://arxiv.org/abs/2505.09388", "Dense + MoE family (0.6B-235B), thinking/non-thinking mode, thinking budget, knowledge distillation, 119 languages"],
    ["Qwen3-Coder-Next", "paper", "https://arxiv.org/abs/2603.00729", "80B/3B-activated coding agent model with agentic training, verifiable tasks, executable environments, mid-training RL"],
    ["Qwen3-Coder", "code/research", "https://github.com/QwenLM/Qwen3-Coder", "open Qwen coding model line"],
    ["Llama 4 Scout/Maverick", "official blog + open weights", "https://ai.meta.com/blog/llama-4-multimodal-intelligence/", "MoE architecture, 10M context, early fusion, online RL + DPO, Behemoth distillation"],
    ["OpenAI GPT-5.5", "system card", "https://openai.com/index/gpt-5-5-system-card/", "closed model system-card source"],
    ["OpenAI GPT-4.1", "official release + system card", "https://openai.com/index/gpt-4-1/", "instruction following, 1M context, coding, and safety eval source"],
    ["OpenAI GPT-4o", "official release", "https://openai.com/index/hello-gpt-4o/", "natively multimodal model source"],
    ["Claude models", "system card index", "https://www.anthropic.com/system-cards", "Anthropic closed model source ledger: 16 system cards from Claude 2 to Fable 5 / Mythos 5"],
    ["Claude model docs", "API docs", "https://docs.anthropic.com/en/docs/about-claude/models", "Claude model comparison, pricing, adaptive thinking, provider surface, migration guides"],
    ["Gemini 3.1 Pro", "model card", "https://deepmind.google/models/model-cards/gemini-3-1-pro/", "Google DeepMind closed model card"],
    ["Gemini 2.5 Pro", "model card PDF", "https://storage.googleapis.com/deepmind-media/Model-Cards/Gemini-2-5-Pro-Model-Card.pdf", "Google DeepMind hybrid reasoning model card"],
    ["Gemini 2.5 Flash", "model card PDF", "https://storage.googleapis.com/deepmind-media/Model-Cards/Gemini-2-5-Flash-Model-Card.pdf", "Google DeepMind efficient hybrid reasoning model card"],
    ["Grok 4.3", "model docs + AWS model card", "https://docs.x.ai/developers/models/grok-4.3", "xAI flagship: always-on reasoning, 1M context, Mantle engine, $1.25/$2.50, launched Jun 2026"],
    ["Grok 4.3 AWS card", "AWS model card", "https://docs.aws.amazon.com/bedrock/latest/userguide/model-card-xai-grok-4-3.html", "Bedrock Mantle endpoint, reasoning effort config, enterprise use cases"],
    ["Grok 4.20", "model docs", "https://docs.x.ai/developers/models/grok-4.20-0309-reasoning", "xAI speed-tier: reasoning + non-reasoning variants, 1M context, low hallucination"],
    ["Grok Build 0.1", "model docs (early access)", "https://docs.x.ai/developers/models/grok-build-0.1", "xAI fast coding model for agentic coding, 256K context, $1.00/$2.00"],
    ["Grok 4.1 model card", "model card PDF", "https://data.x.ai/2025-11-17-grok-4-1-model-card.pdf", "xAI previous-generation baseline model card"],
    ["xAI models index", "API docs", "https://docs.x.ai/developers/models", "xAI full model lineup, pricing, capabilities, and alias system"],
    ["ReAct", "paper", "https://arxiv.org/abs/2210.03629", "agent reasoning/action foundation"],
    ["SWE-agent", "paper + code", "https://arxiv.org/abs/2405.15793", "software-engineering agent baseline"]
  ];

  const pagerState = {};

  function resetPager(key) {
    pagerState[key] = 1;
  }

  function getPageSlice(key, rows, pageSize) {
    const total = rows.length;
    const totalPages = Math.max(1, Math.ceil(total / pageSize));
    const page = Math.min(Math.max(pagerState[key] || 1, 1), totalPages);
    pagerState[key] = page;
    const start = (page - 1) * pageSize;
    const end = Math.min(start + pageSize, total);
    return {
      rows: rows.slice(start, end),
      page,
      totalPages,
      pageSize,
      total,
      start,
      end
    };
  }

  function renderPagination(target, key, meta, rerender) {
    const wrap = document.querySelector(target);
    if (!wrap) return;
    const progress = meta.totalPages <= 1 ? 100 : (meta.page / meta.totalPages) * 100;
    const visibleStart = meta.total === 0 ? 0 : meta.start + 1;
    wrap.innerHTML = `
      <button class="ops-page-button" type="button" data-page-step="-1" ${meta.page <= 1 ? "disabled" : ""}>Prev</button>
      <span class="ops-page-status">Page ${meta.page}/${meta.totalPages} · ${visibleStart}-${meta.end} / ${meta.total}</span>
      <div class="ops-page-meter" aria-hidden="true" style="--page-progress: ${progress}%"><span></span></div>
      <button class="ops-page-button" type="button" data-page-step="1" ${meta.page >= meta.totalPages ? "disabled" : ""}>Next</button>
    `;
    wrap.onclick = (event) => {
      const button = event.target.closest("button[data-page-step]");
      if (!button || button.disabled) return;
      pagerState[key] = (pagerState[key] || 1) + Number(button.dataset.pageStep);
      rerender();
    };
  }

  function modelCard(item, className) {
    const tags = item.tags.map((tag, index) => `<span class="ops-pill ${index === 0 ? "hot" : ""}">${tag}</span>`).join("");
    const links = item.links.map(([label, url]) => `<a class="ops-source-link" href="${url}" target="_blank" rel="noopener">${label}</a>`).join("");
    const drill = item.id ? `<button class="ops-drill-button" type="button" data-detail="model" data-id="${item.id}">Open detail</button>` : "";
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
        <div class="ops-link-row">${links}${drill}</div>
      </article>
    `;
  }

  function renderCards(target, data, className, key, pageSize = 6) {
    if (!key) {
      document.querySelector(target).innerHTML = data.map((item) => modelCard(item, className)).join("");
      return;
    }
    const meta = getPageSlice(key, data, pageSize);
    document.querySelector(target).innerHTML = meta.rows.map((item) => modelCard(item, className)).join("");
    renderPagination(`#${key}-pagination`, key, meta, () => renderCards(target, data, className, key, pageSize));
  }

  function renderFilters(filter = "all") {
    const filters = ["all", "coding", "agent", "long-context", "multimodal", "open", "API", "reasoning"];
    const wrap = document.querySelector("#frontier-filters");
    wrap.innerHTML = filters.map((item) => `<button class="ops-filter ${item === filter ? "active" : ""}" data-filter="${item}">${item}</button>`).join("");
    const rows = frontierModels.filter((model) => {
      const haystack = `${model.tags.join(" ")} ${model.openness || ""}`.toLowerCase();
      return filter === "all" || haystack.includes(filter.toLowerCase());
    });
    renderCards("#frontier-grid", rows, "ops-model-card", "frontier", 6);
    wrap.onclick = (event) => {
      const button = event.target.closest("button");
      if (!button) return;
      resetPager("frontier");
      renderFilters(button.dataset.filter);
    };
  }

  function renderFeed() {
    const feed = [
      ["Kimi K2.7 Code", "Kimi 最新 coding model 已进入官方模型列表", "API"],
      ["Qwen3.7-Max", "面向 agent 的 Qwen 旗舰线，阿里云列出 2026-06 快照", "agent"],
      ["GLM-5.2", "Z.ai long-horizon flagship，强调 1M 工程上下文", "long ctx"],
      ["Qwen3-235B", "open MoE flagship with thinking/non-thinking unified mode, 119 languages, Apache 2.0", "paper"],
      ["Qwen3-Coder-Next", "80B/3B-activated coding agent with agentic training and executable environments", "coding"],
      ["DeepSeek V4", "Pro/Flash 支持 1M context，API 与 HF 同步出现", "weights"],
      ["GPT-4.1", "OpenAI instruction-following model with 1M context and 54.6% SWE-bench", "coding"],
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
    const meta = getPageSlice("source", sourceLedger, 8);
    document.querySelector("#source-ledger").innerHTML = meta.rows.map(([name, type, url, use]) => `
      <tr>
        <td><a class="ops-source-link" href="${url}" target="_blank" rel="noopener">${name}</a></td>
        <td>${type}</td>
        <td>${use}</td>
      </tr>
    `).join("");
    renderPagination("#source-pagination", "source", meta, renderSources);
  }

  function renderCorpus(filter = "all") {
    const filters = ["all", "paper", "technical report", "official blog", "system card", "model card", "watch"];
    const wrap = document.querySelector("#corpus-filters");
    wrap.innerHTML = filters.map((item) => `<button class="ops-filter ${item === filter ? "active" : ""}" data-corpus-filter="${item}">${item}</button>`).join("");
    const rows = corpusRecords.filter((row) => filter === "all" || row[4].includes(filter) || row[3].includes(filter));
    const meta = getPageSlice("corpus", rows, 6);
    document.querySelector("#corpus-grid").innerHTML = meta.rows.map(([id, title, lab, date, type, note, url]) => `
      <article class="ops-corpus-card">
        <div class="ops-source-type">${type}</div>
        <strong>${title}</strong>
        <span>${lab} / ${date}</span>
        <p>${note}</p>
        <div class="ops-link-row">
          <a class="ops-source-link" href="${url}" target="_blank" rel="noopener">Source</a>
          <button class="ops-drill-button" type="button" data-detail="corpus" data-id="${id}">Open detail</button>
        </div>
      </article>
    `).join("");
    wrap.onclick = (event) => {
      const button = event.target.closest("button");
      if (button) {
        resetPager("corpus");
        renderCorpus(button.dataset.corpusFilter);
      }
    };
    renderPagination("#corpus-pagination", "corpus", meta, () => renderCorpus(filter));
  }

  function renderPeople(filter = "all") {
    const filters = ["all", "full arXiv", "team release", "closed", "academic"];
    const wrap = document.querySelector("#people-filters");
    wrap.innerHTML = filters.map((item) => `<button class="ops-filter ${item === filter ? "active" : ""}" data-people-filter="${item}">${item}</button>`).join("");
    const rows = peopleRecords.filter((record) => {
      const haystack = `${record.cluster} ${record.disclosure} ${record.lab}`.toLowerCase();
      if (filter === "all") return true;
      if (filter === "full arXiv") return record.count;
      if (filter === "team release") return haystack.includes("team") || haystack.includes("official");
      if (filter === "closed") return haystack.includes("closed");
      if (filter === "academic") return haystack.includes("academic");
      return haystack.includes(filter.toLowerCase());
    });
    const meta = getPageSlice("people", rows, 6);
    document.querySelector("#people-grid").innerHTML = meta.rows.map((record) => `
      <article class="ops-people-card">
        <div class="ops-people-meta">
          <span class="ops-people-pill">${record.cluster}</span>
          <span class="ops-people-pill">${record.count ? `${record.count} authors` : "team-level"}</span>
        </div>
        <strong>${record.lab}</strong>
        <span>${record.disclosure}</span>
        <p class="ops-people-note">${record.note}</p>
        <div class="ops-people-chips">${record.people.slice(0, 7).map((person) => `<span class="ops-person-chip">${person}</span>`).join("")}</div>
        <div class="ops-link-row">
          ${linksHtml(record.sources.slice(0, 2))}
          <button class="ops-drill-button" type="button" data-detail="people" data-id="${record.id}">Open detail</button>
        </div>
      </article>
    `).join("");
    wrap.onclick = (event) => {
      const button = event.target.closest("button");
      if (button) {
        resetPager("people");
        renderPeople(button.dataset.peopleFilter);
      }
    };
    renderPagination("#people-pagination", "people", meta, () => renderPeople(filter));
  }

  function renderPeopleMatrix() {
    document.querySelector("#people-matrix").innerHTML = peopleMatrixRows.map(([title, note, labs]) => `
      <div class="ops-people-matrix-row">
        <strong>${title}</strong>
        <span>${note}</span>
        <span>${labs}</span>
      </div>
    `).join("");
  }

  function renderEcosystem(filter = "all") {
    const total = ecosystemPartners.length;
    const summary = [
      ["Total", total],
      ...ecosystemCategories.map((category) => [category.short, category.partners.length])
    ];
    document.querySelector("#ecosystem-summary").innerHTML = summary.map(([label, count]) => `
      <div class="ops-ecosystem-stat"><strong>${count}</strong><span>${label}</span></div>
    `).join("");

    const filters = ["all", ...ecosystemCategories.map((category) => category.id)];
    const filterNames = Object.fromEntries(ecosystemCategories.map((category) => [category.id, category.name]));
    const wrap = document.querySelector("#ecosystem-filters");
    wrap.innerHTML = filters.map((item) => `<button class="ops-filter ${item === filter ? "active" : ""}" data-ecosystem-filter="${item}">${item === "all" ? "all" : filterNames[item]}</button>`).join("");

    const rows = ecosystemCategories.filter((category) => filter === "all" || category.id === filter);
    const meta = getPageSlice("ecosystem", rows, 2);
    document.querySelector("#ecosystem-grid").innerHTML = meta.rows.map((category) => {
      const partnerKey = `ecosystem-partners-${category.id}`;
      const partnerMeta = getPageSlice(partnerKey, category.partners, 8);
      return `
      <article class="ops-ecosystem-card">
        <div class="ops-ecosystem-top">
          <div>
            <strong>${category.name}</strong>
            <span>${category.role}</span>
          </div>
          <div class="ops-ecosystem-count">${category.partners.length}</div>
        </div>
        <p>${category.evidence}</p>
        <div class="ops-partner-cloud">${partnerMeta.rows.map((partner) => `<button class="ops-partner-token" type="button" data-detail="ecosystem-partner" data-id="${makePartnerId(partner)}">${partner}</button>`).join("")}</div>
        <div class="ops-pagination" id="${partnerKey}-pagination" aria-label="${category.name} partner pagination"></div>
        <div class="ops-link-row">
          <a class="ops-source-link" href="${category.source}" target="_blank" rel="noopener">Acknowledgement</a>
          <button class="ops-drill-button" type="button" data-detail="ecosystem" data-id="${category.id}">Open category</button>
        </div>
      </article>
    `}).join("");
    meta.rows.forEach((category) => {
      const partnerKey = `ecosystem-partners-${category.id}`;
      const partnerMeta = getPageSlice(partnerKey, category.partners, 8);
      renderPagination(`#${partnerKey}-pagination`, partnerKey, partnerMeta, () => renderEcosystem(filter));
    });

    wrap.onclick = (event) => {
      const button = event.target.closest("button");
      if (button) {
        resetPager("ecosystem");
        renderEcosystem(button.dataset.ecosystemFilter);
      }
    };
    renderPagination("#ecosystem-pagination", "ecosystem", meta, () => renderEcosystem(filter));
  }

  function renderEcosystemMatrix() {
    const columns = ecosystemCategories.map((category) => category.name);
    const matrix = document.querySelector("#ecosystem-matrix");
    matrix.querySelector("thead").innerHTML = `<tr><th>Report</th><th>Source type</th>${columns.map((column) => `<th>${column}</th>`).join("")}<th>Interpretation</th></tr>`;
    matrix.querySelector("tbody").innerHTML = ecosystemMatrixRows.map((row) => `
      <tr>
        <td><button class="ops-mini-button" type="button" data-detail="model" data-id="${row.modelId}">${row.report}</button></td>
        <td><a class="ops-source-link" href="${row.url}" target="_blank" rel="noopener">${row.sourceType}</a></td>
        ${columns.map((column) => `<td class="${row.cells[column] !== "-" ? row.status : ""}">${row.cells[column]}</td>`).join("")}
        <td>${row.note}</td>
      </tr>
    `).join("");
  }

  function renderMethods() {
    const meta = getPageSlice("method", methodRegistry, 6);
    document.querySelector("#method-grid").innerHTML = meta.rows.map(([id, label, fullName, stage, note, usedBy, url]) => `
      <article class="ops-method-card">
        <div class="ops-stage">${stage}</div>
        <strong>${label}: ${fullName}</strong>
        <span>${note}</span>
        <div class="ops-card-meta">${usedBy.map((modelId) => `<span class="ops-pill">${modelId}</span>`).join("")}</div>
        <div class="ops-link-row">
          <a class="ops-source-link" href="${url}" target="_blank" rel="noopener">Source</a>
          <button class="ops-drill-button" type="button" data-detail="method" data-id="${id}">Open detail</button>
        </div>
      </article>
    `).join("");
    renderPagination("#method-pagination", "method", meta, renderMethods);
  }

  function renderFigures() {
    const meta = getPageSlice("figure", figureAtlas, 4);
    document.querySelector("#figure-grid").innerHTML = meta.rows.map(([id, title, caption, img, source]) => `
      <article class="ops-figure-card">
        <img src="${img}" alt="${title}" loading="lazy">
        <div>
          <strong>${title}</strong>
          <p>${caption}</p>
          <div class="ops-link-row">
            <a class="ops-source-link" href="${source}" target="_blank" rel="noopener">Source</a>
            <button class="ops-drill-button" type="button" data-detail="figure" data-id="${id}">Open detail</button>
          </div>
        </div>
      </article>
    `).join("");
    renderPagination("#figure-pagination", "figure", meta, renderFigures);
  }

  function renderBenchmarkTable(category = "all") {
    const categories = ["all", ...Array.from(new Set(benchmarkRows.map((row) => row[0])))];
    const filterWrap = document.querySelector("#score-filters");
    filterWrap.innerHTML = categories.map((item) => `<button class="ops-filter ${item === category ? "active" : ""}" data-score-filter="${item}">${item}</button>`).join("");
    document.querySelector("#score-head").innerHTML = `<tr><th>Benchmark</th><th>Category</th><th>Metric</th>${scoreModels.map((model) => `<th>${model}</th>`).join("")}<th>Source note</th></tr>`;
    const rows = benchmarkRows.filter((row) => category === "all" || row[0] === category);
    const meta = getPageSlice("score", rows, 8);
    document.querySelector("#score-body").innerHTML = meta.rows.map(([cat, name, metric, scores, note]) => {
      const numericValues = Object.values(scores).filter((value) => typeof value === "number");
      const best = numericValues.length ? Math.max(...numericValues) : null;
      const cells = scoreModels.map((model) => {
        const value = scores[model];
        const isBest = typeof value === "number" && value === best;
        return `<td class="${isBest ? "best" : ""}">${value == null ? "-" : value}</td>`;
      }).join("");
      return `<tr><td><button type="button" data-detail="benchmark" data-id="${name}">${name}</button></td><td>${cat}</td><td>${metric}</td>${cells}<td>${note}</td></tr>`;
    }).join("");
    filterWrap.onclick = (event) => {
      const button = event.target.closest("button");
      if (button) {
        resetPager("score");
        renderBenchmarkTable(button.dataset.scoreFilter);
      }
    };
    renderPagination("#score-pagination", "score", meta, () => renderBenchmarkTable(category));
  }

  function renderSystemLayer(active = "models") {
    const layers = [
      ["models", "Model Graph", "Frontier families, split by actual release"],
      ["reports", "2026 Corpus", "Paper/blog/card source types"],
      ["methods", "Method Atlas", "Training and eval methods"],
      ["benchmarks", "Benchmark Map", "Shared scores and eval setup"],
      ["figures", "Figure Atlas", "Original report images"],
      ["people", "People Network", "Authors, teams, disclosure level"],
      ["ecosystem", "Launch Ecosystem", "Partners, providers, gateways"],
      ["glm", "GLM-5 Deep Dive", "Data, RL, eval and Pony Alpha"],
      ["deepseek", "DeepSeek V3/R1/V4", "MoE, GRPO, reasoning RL, CSA, HCA"],
      ["kimi", "Kimi K2.5/K2.6/K2.7", "Agent swarms, coding, MuonClip lineage"],
      ["qwen", "Qwen3 / Coder-Next", "Thinking mode, MoE, agentic coding, 119 langs"],
      ["openai", "OpenAI GPT Family", "GPT-4o, GPT-4.1, GPT-5.5 lineage"],
      ["anthropic", "Anthropic Claude", "Opus 4.8, Fable/Mythos 5, system cards, adaptive thinking"],
      ["minimax", "MiniMax M2/M3", "Forge RL, self-evolution, MSA sparse attention, 1M context"],
      ["llama", "Llama 4 Family", "Scout, Maverick, Behemoth, MoE, 10M context, open weights"]
    ];
    document.querySelector("#ops-layer-rail").innerHTML = layers.map(([id, title, text]) => `
      <button class="ops-layer-button ${id === active ? "active" : ""}" type="button" data-layer="${id}">
        <strong>${title}</strong><span>${text}</span>
      </button>
    `).join("");
    const detail = document.querySelector("#ops-layer-detail");
    if (active === "models") {
      detail.innerHTML = `<h3>Frontier Model Families</h3><p>每个模型版本拆成独立记录，避免把 GLM-5、GLM-5.1、GLM-5.2 或 Kimi K2.5/K2.6/K2.7-Code 混成一个条目。</p><div class="ops-mini-grid">${modelRecords.slice(0, 12).map((model) => `<div class="ops-mini-card"><strong>${model.name}</strong><span>${model.type} / ${model.status}</span><button class="ops-mini-button" type="button" data-detail="model" data-id="${model.id}">Open</button></div>`).join("")}</div>`;
    } else if (active === "reports") {
      detail.innerHTML = `<h3>2026 Report Corpus</h3><p>paper、technical report、official blog、system card、model card 分开标注。</p><div class="ops-mini-grid">${corpusRecords.map(([id, title, lab, date, type]) => `<div class="ops-mini-card"><strong>${title}</strong><span>${lab} / ${date} / ${type}</span><button class="ops-mini-button" type="button" data-detail="corpus" data-id="${id}">Open</button></div>`).join("")}</div>`;
    } else if (active === "methods") {
      detail.innerHTML = `<h3>Reusable Methods</h3><p>同一方法可能被多个模型或报告复用，点击后会显示 used-by 反向索引。</p><div class="ops-mini-grid">${methodRegistry.map(([id, label, fullName, stage]) => `<div class="ops-mini-card"><strong>${label}</strong><span>${fullName} / ${stage}</span><button class="ops-mini-button" type="button" data-detail="method" data-id="${id}">Open</button></div>`).join("")}</div>`;
    } else if (active === "benchmarks") {
      detail.innerHTML = `<h3>Benchmark Map</h3><p>Benchmark 行是跨模型共享节点，可以查看 source note 和相关模型。</p><div class="ops-mini-grid">${benchmarkRows.slice(0, 12).map(([cat, name, metric]) => `<div class="ops-mini-card"><strong>${name}</strong><span>${cat} / ${metric}</span><button class="ops-mini-button" type="button" data-detail="benchmark" data-id="${name}">Open</button></div>`).join("")}</div>`;
    } else if (active === "figures") {
      detail.innerHTML = `<h3>Original Figure Atlas</h3><p>原图从 arXiv HTML、Z.ai blog、Kimi blog 直接引用，保留 source link。</p><div class="ops-mini-grid">${figureAtlas.slice(0, 8).map(([id, title, caption]) => `<div class="ops-mini-card"><strong>${title}</strong><span>${caption}</span><button class="ops-mini-button" type="button" data-detail="figure" data-id="${id}">Open</button></div>`).join("")}</div>`;
    } else if (active === "people") {
      detail.innerHTML = `<h3>People & Author Network</h3><p>作者表、团队发布、system card 和 agent paper 被放在同一层比较，避免把没有署名的官方发布误当成论文作者贡献。</p><div class="ops-mini-grid">${peopleRecords.slice(0, 10).map((record) => `<div class="ops-mini-card"><strong>${record.lab}</strong><span>${record.disclosure} / ${record.count ? `${record.count} authors` : "team-level"}</span><button class="ops-mini-button" type="button" data-detail="people" data-id="${record.id}">Open</button></div>`).join("")}</div>`;
    } else if (active === "ecosystem") {
      detail.innerHTML = `<h3>Launch Ecosystem</h3><p>GLM-5 Acknowledgement 暴露了可结构化的 partner map：open-source communities、inference providers、applications、AI gateways。其他报告只在有同类伙伴表时才标成 listed。</p><div class="ops-mini-grid">${ecosystemCategories.map((category) => `<div class="ops-mini-card"><strong>${category.name}</strong><span>${category.partners.length} partners / ${category.role}</span><button class="ops-mini-button" type="button" data-detail="ecosystem" data-id="${category.id}">Open</button></div>`).join("")}</div>`;
    } else if (active === "minimax") {
      detail.innerHTML = `<h3>MiniMax M2 / M3 Deep Dive</h3><p>MiniMax 从 M2（229.9B MoE / 9.8B activated + Forge agent-native RL + self-evolution scaffold）到 M3（1M context via MSA sparse attention + native multimodality + $0.60/MTok）的演进。所有阶段卡片都挂回 arXiv 论文和官方博客。</p><div class="ops-stage-grid">${(reportDeepDives["minimax-m2"] || []).map((item) => `<div class="ops-stage-card"><div class="ops-stage">${item.stage}</div><strong>${item.title}</strong><span>${item.body}</span><div class="ops-link-row"><a class="ops-source-link" href="${item.source}" target="_blank" rel="noopener">Source</a></div></div>`).join("")}</div>`;
    } else if (active === "llama") {
      detail.innerHTML = `<h3>Llama 4 Family Deep Dive</h3><p>Meta Llama 4 从 Scout/Maverick（17B active, MoE, 10M context, early fusion multimodal）到 Behemoth（288B active teacher model, 256 experts, in-training）的架构和训练演进。30T+ tokens pre-training, online RL + DPO post-training, synthetic data from Behemoth distillation。所有阶段卡片都挂回 Meta 官方 blog。</p><div class="ops-stage-grid">${(reportDeepDives["llama-4"] || []).map((item) => `<div class="ops-stage-card"><div class="ops-stage">${item.stage}</div><strong>${item.title}</strong><span>${item.body}</span><div class="ops-link-row"><a class="ops-source-link" href="${item.source}" target="_blank" rel="noopener">Source</a></div></div>`).join("")}</div>`;
    } else if (active === "openai") {
      detail.innerHTML = `<h3>OpenAI GPT Family Deep Dive</h3><p>OpenAI 从 GPT-4o（多模态端到端）到 GPT-4.1（instruction following + 1M context）到 GPT-5.5（agentic tool use）的演进路线。所有阶段卡片都挂回官方 release 或 system card。</p><div class="ops-stage-grid">${reportDeepDives["openai-gpt-family"].map((item) => `<div class="ops-stage-card"><div class="ops-stage">${item.stage}</div><strong>${item.title}</strong><span>${item.body}</span><div class="ops-link-row"><a class="ops-source-link" href="${item.source}" target="_blank" rel="noopener">Source</a></div></div>`).join("")}</div>`;
    } else if (active === "anthropic") {
      detail.innerHTML = `<h3>Anthropic Claude Deep Dive</h3><p>Anthropic 从 Claude 2 到 Claude 3/3.5 到 Claude 4.x 再到 Fable 5 / Mythos 5 的演进。16 个 system card 覆盖完整能力、安全评估和部署决策。Opus 4.8 是当前 agentic coding 前沿；Fable 5 引入 adaptive thinking 和新 tokenizer。所有阶段卡片都挂回 Anthropic system card index 和 API docs。</p><div class="ops-stage-grid">${reportDeepDives["anthropic-claude"].map((item) => `<div class="ops-stage-card"><div class="ops-stage">${item.stage}</div><strong>${item.title}</strong><span>${item.body}</span><div class="ops-link-row"><a class="ops-source-link" href="${item.source}" target="_blank" rel="noopener">Source</a></div></div>`).join("")}</div>`;
    } else if (active === "kimi") {
      detail.innerHTML = `<h3>Kimi K2.5 / K2.6 / K2.7 Code Deep Dive</h3><p>Kimi 从 K2.5 基线技术报告（326 作者 arXiv 表）到 K2.6 官方技术博客（agent swarms、proactive agents、Claw Groups、benchmark tables）再到 K2.7 Code API 模型文档的演进。所有阶段卡片都挂回 arXiv 或官方来源。</p><div class="ops-stage-grid">${reportDeepDives["kimi-k2-6"].map((item) => `<div class="ops-stage-card"><div class="ops-stage">${item.stage}</div><strong>${item.title}</strong><span>${item.body}</span><div class="ops-link-row"><a class="ops-source-link" href="${item.source}" target="_blank" rel="noopener">Source</a></div></div>`).join("")}</div>`;
    } else if (active === "qwen") {
      const allDives = [...(reportDeepDives["qwen3-family"] || []), ...(reportDeepDives["qwen3-coder-next"] || [])];
      detail.innerHTML = `<h3>Qwen3 / Qwen3-Coder-Next Deep Dive</h3><p>Qwen3 从 235B MoE 旗舰（thinking/non-thinking unified mode、thinking budget、119 语言、Apache 2.0）到 Qwen3-Coder-Next 80B/3B-activated coding agent（agentic training、verifiable tasks、executable environments）的演进。所有阶段卡片都挂回 arXiv 论文。</p><div class="ops-stage-grid">${allDives.map((item) => `<div class="ops-stage-card"><div class="ops-stage">${item.stage}</div><strong>${item.title}</strong><span>${item.body}</span><div class="ops-link-row"><a class="ops-source-link" href="${item.source}" target="_blank" rel="noopener">Source</a></div></div>`).join("")}</div>`;
    } else if (active === "deepseek") {
      const allDives = [...(reportDeepDives["deepseek-v3"] || []), ...(reportDeepDives["deepseek-r1"] || []), ...(reportDeepDives["deepseek-v4-pro"] || [])];
      detail.innerHTML = `<h3>DeepSeek V3 / R1 / V4 Deep Dive</h3><p>DeepSeek 从 V3（671B MoE + FP8 + MTP）到 R1（emergent reasoning via RL）再到 V4（CSA + HCA + 1M context）的架构和训练演进。所有阶段卡片都挂回 arXiv 报告。</p><div class="ops-stage-grid">${allDives.map((item) => `<div class="ops-stage-card"><div class="ops-stage">${item.stage}</div><strong>${item.title}</strong><span>${item.body}</span><div class="ops-link-row"><a class="ops-source-link" href="${item.source}" target="_blank" rel="noopener">Source</a></div></div>`).join("")}</div>`;
    } else {
      const allDives = [...(reportDeepDives["glm-5"] || []), ...(reportDeepDives["glm-5.2"] || [])];
      detail.innerHTML = `<h3>GLM-5 / GLM-5.2 Report Deep Dive</h3><p>GLM-5 从 vibe coding 到 agentic engineering 的过渡（arXiv 2602.15763），加上 GLM-5.2 的 1M 上下文、IndexCache、slime 和 long-horizon 工程演进。所有阶段卡片都挂回 arXiv 论文和官方博客。</p><div class="ops-stage-grid">${allDives.map((item) => `<div class="ops-stage-card"><div class="ops-stage">${item.stage}</div><strong>${item.title}</strong><span>${item.body}</span><div class="ops-link-row"><a class="ops-source-link" href="${item.source}" target="_blank" rel="noopener">Source</a></div></div>`).join("")}</div>`;
    }
    document.querySelector("#ops-layer-rail").onclick = (event) => {
      const button = event.target.closest("button");
      if (button) renderSystemLayer(button.dataset.layer);
    };
  }

  function linksHtml(links) {
    return links.map(([label, url]) => `<a class="ops-source-link" href="${url}" target="_blank" rel="noopener">${label}</a>`).join("");
  }

  function openDetail(kind, id) {
    const drawer = document.querySelector("#ops-drawer");
    const body = document.querySelector("#ops-drawer-body");
    const crumb = document.querySelector("#ops-crumb");
    let title = id;
    let html = "";
    if (kind === "model") {
      const model = modelRecords.find((item) => item.id === id);
      if (!model) return;
      title = model.name;
      const deepDive = model.deepDive ? reportDeepDives[model.deepDive] || [] : [];
      html = `<h3 id="ops-drawer-title">${model.name}</h3><p>${model.note}</p>
        <ul class="ops-detail-list">
          <li><strong>Org:</strong> ${model.org}</li>
          <li><strong>Date:</strong> ${model.date}</li>
          <li><strong>Source type:</strong> ${model.type}</li>
          <li><strong>Open status:</strong> ${model.openness}</li>
          <li><strong>Methods:</strong> ${(model.methods || []).join(", ")}</li>
          <li><strong>Benchmarks:</strong> ${(model.benchmarks || []).join(", ")}</li>
        </ul>
        <div class="ops-link-row">${linksHtml(model.links)}</div>
        ${model.id === "glm-5" ? `<h3>Co-launch Ecosystem</h3><p>GLM-5 Acknowledgement lists ${ecosystemPartners.length} co-launch partners across ${ecosystemCategories.length} categories. Open the dedicated ecosystem section for category filters and cross-report comparison.</p><div class="ops-mini-grid">${ecosystemCategories.map((category) => `<div class="ops-mini-card"><strong>${category.name}</strong><span>${category.partners.length} partners</span><button class="ops-mini-button" type="button" data-detail="ecosystem" data-id="${category.id}">Open</button></div>`).join("")}</div>` : ""}
        ${deepDive.length ? `<h3>Report Sections</h3><div class="ops-stage-grid">${deepDive.map((item) => `<div class="ops-stage-card"><div class="ops-stage">${item.stage}</div><strong>${item.title}</strong><span>${item.body}</span><div class="ops-link-row"><a class="ops-source-link" href="${item.source}" target="_blank" rel="noopener">Source</a></div></div>`).join("")}</div>` : ""}
        ${model.figures ? `<h3>Related Figures</h3><div class="ops-mini-grid">${model.figures.map((figureId) => {
          const fig = figureAtlas.find((item) => item[0] === figureId);
          return fig ? `<div class="ops-mini-card"><strong>${fig[1]}</strong><span>${fig[2]}</span><button class="ops-mini-button" type="button" data-detail="figure" data-id="${fig[0]}">Open</button></div>` : "";
        }).join("")}</div>` : ""}`;
    } else if (kind === "method") {
      const method = methodRegistry.find((item) => item[0] === id);
      if (!method) return;
      const [mid, label, fullName, stage, note, usedBy, url] = method;
      title = label;
      html = `<h3 id="ops-drawer-title">${label}: ${fullName}</h3><p>${note}</p><ul class="ops-detail-list"><li><strong>Stage:</strong> ${stage}</li><li><strong>Used by:</strong> ${usedBy.join(", ")}</li></ul><div class="ops-link-row"><a class="ops-source-link" href="${url}" target="_blank" rel="noopener">Source</a></div><h3>Used-by Models</h3><div class="ops-mini-grid">${usedBy.map((modelId) => {
        const model = modelRecords.find((item) => item.id === modelId);
        return model ? `<div class="ops-mini-card"><strong>${model.name}</strong><span>${model.type}</span><button class="ops-mini-button" type="button" data-detail="model" data-id="${model.id}">Open</button></div>` : "";
      }).join("")}</div>`;
    } else if (kind === "benchmark") {
      const row = benchmarkRows.find((item) => item[1] === id);
      if (!row) return;
      const [cat, name, metric, scores, note] = row;
      title = name;
      html = `<h3 id="ops-drawer-title">${name}</h3><p>${note}</p><ul class="ops-detail-list"><li><strong>Category:</strong> ${cat}</li><li><strong>Metric:</strong> ${metric}</li></ul><div class="ops-table-wrap"><table class="ops-score-table"><thead><tr><th>Model</th><th>Score</th></tr></thead><tbody>${Object.entries(scores).map(([model, score]) => `<tr><td>${model}</td><td>${score}</td></tr>`).join("")}</tbody></table></div>`;
    } else if (kind === "figure") {
      const fig = figureAtlas.find((item) => item[0] === id);
      if (!fig) return;
      const [fid, name, caption, img, source] = fig;
      title = name;
      html = `<h3 id="ops-drawer-title">${name}</h3><p>${caption}</p><div class="ops-figure-card"><img src="${img}" alt="${name}"><div><div class="ops-link-row"><a class="ops-source-link" href="${source}" target="_blank" rel="noopener">Source</a><a class="ops-source-link" href="${img}" target="_blank" rel="noopener">Open image</a></div></div></div>`;
    } else if (kind === "corpus") {
      const record = corpusRecords.find((item) => item[0] === id);
      if (!record) return;
      const [rid, name, lab, date, type, note, url] = record;
      title = name;
      html = `<h3 id="ops-drawer-title">${name}</h3><p>${note}</p><ul class="ops-detail-list"><li><strong>Lab:</strong> ${lab}</li><li><strong>Date:</strong> ${date}</li><li><strong>Source type:</strong> ${type}</li></ul><div class="ops-link-row"><a class="ops-source-link" href="${url}" target="_blank" rel="noopener">Source</a></div>`;
    } else if (kind === "people") {
      const record = peopleRecords.find((item) => item.id === id);
      if (!record) return;
      title = record.lab;
      html = `<h3 id="ops-drawer-title">${record.lab}</h3><p>${record.note}</p>
        <ul class="ops-detail-list">
          <li><strong>Cluster:</strong> ${record.cluster}</li>
          <li><strong>Disclosure:</strong> ${record.disclosure}</li>
          <li><strong>Author table size:</strong> ${record.count ? `${record.count} listed authors` : "team-level / not listed"}</li>
          <li><strong>Reports:</strong> ${record.reports.join(", ")}</li>
          <li><strong>Methods:</strong> ${record.methods.join(", ")}</li>
        </ul>
        <h3>Representative People / Teams</h3>
        <div class="ops-people-chips">${record.people.map((person) => `<span class="ops-person-chip">${person}</span>`).join("")}</div>
        <h3>Evidence Sources</h3>
        <div class="ops-link-row">${linksHtml(record.sources)}</div>`;
    } else if (kind === "ecosystem") {
      const category = ecosystemCategories.find((item) => item.id === id);
      if (!category) return;
      title = category.name;
      const reportRows = ecosystemMatrixRows.filter((row) => row.cells[category.name] && row.cells[category.name] !== "-");
      html = `<h3 id="ops-drawer-title">${category.name}</h3><p>${category.role}</p>
        <ul class="ops-detail-list">
          <li><strong>Partner count:</strong> ${category.partners.length}</li>
          <li><strong>Evidence:</strong> ${category.evidence}</li>
          <li><strong>Source type:</strong> GLM-5 paper acknowledgement</li>
        </ul>
        <h3>Partners</h3>
        <div class="ops-partner-cloud">${category.partners.map((partner) => `<button class="ops-partner-token" type="button" data-detail="ecosystem-partner" data-id="${makePartnerId(partner)}">${partner}</button>`).join("")}</div>
        <h3>Cross-report Signals</h3>
        <div class="ops-mini-grid">${reportRows.map((row) => `<div class="ops-mini-card"><strong>${row.report}</strong><span>${row.cells[category.name]} / ${row.sourceType}</span><a class="ops-source-link" href="${row.url}" target="_blank" rel="noopener">Source</a></div>`).join("")}</div>
        <div class="ops-link-row"><a class="ops-source-link" href="${category.source}" target="_blank" rel="noopener">Open Acknowledgement</a></div>`;
    } else if (kind === "ecosystem-partner") {
      const partner = ecosystemPartners.find((item) => item.id === id);
      if (!partner) return;
      title = partner.name;
      html = `<h3 id="ops-drawer-title">${partner.name}</h3><p>${partner.evidence}</p>
        <ul class="ops-detail-list">
          <li><strong>Category:</strong> ${partner.categoryName}</li>
          <li><strong>Role layer:</strong> ${partner.role}</li>
          <li><strong>Reports:</strong> ${partner.reports.join(", ")}</li>
          <li><strong>Source type:</strong> paper acknowledgement</li>
        </ul>
        <div class="ops-link-row">
          <a class="ops-source-link" href="${partner.source}" target="_blank" rel="noopener">Source</a>
          <button class="ops-drill-button" type="button" data-detail="ecosystem" data-id="${partner.category}">Open category</button>
          <button class="ops-drill-button" type="button" data-detail="model" data-id="glm-5">Open GLM-5</button>
        </div>`;
    }
    crumb.textContent = `AI Tracker / ${kind} / ${title}`;
    body.innerHTML = html;
    drawer.hidden = false;
    drawer.setAttribute("aria-hidden", "false");
  }

  function closeDetail() {
    const drawer = document.querySelector("#ops-drawer");
    drawer.hidden = true;
    drawer.setAttribute("aria-hidden", "true");
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
    document.querySelectorAll(".ops-model-card, .ops-agent-card, .ops-company-card, .ops-road-card, .ops-corpus-card, .ops-method-card, .ops-figure-card, .ops-people-card, .ops-ecosystem-card").forEach((card) => observer.observe(card));
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

  document.addEventListener("click", (event) => {
    const action = event.target.closest("[data-action]");
    if (action && (action.dataset.action === "close" || action.dataset.action === "back")) {
      closeDetail();
      return;
    }
    const detailButton = event.target.closest("[data-detail]");
    if (detailButton) {
      openDetail(detailButton.dataset.detail, detailButton.dataset.id);
    }
  });

  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape") closeDetail();
  });

  renderFeed();
  renderSystemLayer();
  renderCorpus();
  renderCards("#closed-grid", closedModels, "ops-model-card", "closed", 4);
  renderCards("#agent-grid", agentPapers, "ops-agent-card", "agent", 4);
  renderCards("#roadmap-grid", roadmap, "ops-road-card", "roadmap", 4);
  renderBenchmarkTable();
  renderMethods();
  renderFigures();
  renderPeople();
  renderPeopleMatrix();
  renderEcosystem();
  renderEcosystemMatrix();
  renderFilters();
  renderHeatmap();
  renderSources();
  revealCards();
  drawRadar();
</script>
